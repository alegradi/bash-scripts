#!/bin/bash

# Create an empty dictionary to store podname and namespace
declare -A pods

# Find all pods in 'Terminating' state from all namespaces
while IFS= read -r line; do
    if [[ $line =~ Terminating ]]; then
        # Extract podname and namespace from the line
        podname=$(echo "$line" | awk '{print $1}')
        namespace=$(echo "$line" | awk '{print $2}')

        # Save podname and namespace into the dictionary
        pods["$podname"]=$namespace
    fi
done < <(kubectl get pods --all-namespaces --field-selector=status.phase=Terminating --no-headers)

# Loop through the dictionary and delete the pods
for podname in "${!pods[@]}"; do
    namespace=${pods[$podname]}
    echo "Deleting pod: $podname in namespace: $namespace"
    kubectl delete pod "$podname" --namespace "$namespace"

    # Wait for 1 second between requests
    sleep 1
done
