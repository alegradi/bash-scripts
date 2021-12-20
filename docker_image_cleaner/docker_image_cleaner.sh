#!/bin/bash
# docker_image_cleaner.sh

# Clear docker images that are no longer needed
# Recommended to be running as a cronjob once a week

#--------------------------------------------------##--------------------------------------------------#
## Variables ##

#Which repo's images should be cleared
DOCKER_BASE_REPO="adamlegradi/*"
# Log location
# LOG_LOCATION="/var/log/docker_image_cleaner.log"
LOG_LOCATION="/home/adam/testy.log"

## Do not edit below this line
#--------------------------------------------------##--------------------------------------------------#

# Get an array of sub repos of the DOCKER_BASE_REPO
docker_repo=( $(docker images $DOCKER_BASE_REPO | tail -n +2 | cut -d ' ' -f 1 | sort | uniq) )

# Loop through the elements of the array to find docker images for each
for docker_image_repo in "${docker_repo[@]}"
do
    docker_image=( $(docker images $docker_image_repo | tail -n +3 | awk '{ print $3 }'))

    for docker_image_delete in "${docker_image[@]}"
    do
        # echo "Removing $docker_image_delete"  # <<--- working, not needed now
        REMOVE_IMAGE=$(docker rmi -f $docker_image_delete 2>&1)
        WRITE_TO_LOG="$(date +"%d-%m-%Y %H:%M:%S") - Deleting - $docker_image_repo - $docker_image_delete - $REMOVE_IMAGE"
        echo $WRITE_TO_LOG >> $LOG_LOCATION
    done

done