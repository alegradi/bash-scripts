#!/bin/bash
# docker_image_cleaner.sh

# Clear docker images that are no longer needed
# Recommended to be running as a cronjob once a week


# TODO:
# - check images by repo name
# - check which images can be removed
# - remove images
# - Write logs about what has been cleaned off


#Which repo's images should be cleared
DOCKER_REPO="adamlegradi/*"

#Get a list of all images
docker images $DOCKER_REPO | tail -n +2 | awk '{print $1}' | sort | uniq

## Test on localhost with returning the value as an array?



# Sort out all the images, discard header and first container
docker images adamlegradi/cucos | tail -n +3 

# for loop all images by repo
# for loop all images

## This works but maybe for loop is needed?
# image_func(){
#     for image in $image_repo
#     do

#         REMOVE_IMAGE=$(docker rmi $(docker images $image | tail -n +3 | awk '{print $3}') 2>&1)  # We are writing it to the log
#         echo $REMOVE_IMAGE
#         WRITE_LOG="$(date) - $REMOVE_IMAGE"
#         echo $WRITE_LOG >> ~/testy.log

#     done
# }



##
# Below ends in endless loop. test how to work around that
##
# image_func(){
#     while [ $NUMBER_OF_IMAGES -ge 0 ] 
#     do
#         REMOVE_IMAGE=$(docker rmi $(docker images $image | tail -n 1 | awk '{print $3}') 2>&1)  # We are writing it to the log
#         echo "Removal attempt - $REMOVE_IMAGE"  ##here only for debug

# # Tail needs adjusting to jump to the next one


#         WRITE_LOG="$(date) - $REMOVE_IMAGE"
#         echo $WRITE_LOG >> ~/testy.log

#         NUMBER_OF_IMAGES=$(( $NUMBER_OF_IMAGES - 1 )) 
#         echo $NUMBER_OF_IMAGES  ## Here only for debug
#     done
# }


# for image_repo in `docker images $DOCKER_REPO | tail -n +2 | awk '{print $1}' | sort | uniq`
# do
#     NUMBER_OF_IMAGES=$(docker images $image_repo | tail -n +3 | wc -l)
#     echo "Original number of images: $NUMBER_OF_IMAGES"  ##here for debug
#     image_func
# done


############### Test array for loop ##################

# image_func(){
#     while [ $NUMBER_OF_IMAGES -ge 0 ] 
#     do
#         REMOVE_IMAGE=$(docker rmi $(docker images $image | tail -n 1 | awk '{print $3}') 2>&1)  # We are writing it to the log
#         echo "Removal attempt - $REMOVE_IMAGE"  ##here only for debug

# # Tail needs adjusting to jump to the next one


#         WRITE_LOG="$(date) - $REMOVE_IMAGE"
#         echo $WRITE_LOG >> ~/testy.log

#         NUMBER_OF_IMAGES=$(( $NUMBER_OF_IMAGES - 1 )) 
#         echo $NUMBER_OF_IMAGES  ## Here only for debug
#     done
# }


# for image_repo in `docker images $DOCKER_REPO | tail -n +2 | awk '{print $1}' | sort | uniq`
# do
#     DOCKER_IMAGES=$(docker images $image_repo | tail -n +3 | awk '{print $3}')
#     echo "$DOCKER_IMAGES"  ##here for debug
#     # image_func
# done


array=$(docker images adamlegradi/mediawiki-kb | tail -n +3 | awk '{print $3}')

# array=( one two three )
for i in "${array[@]}"
do
	echo "$i"
done









################## Test ###################

# image_func(){
#     while [ $NUMBER_OF_IMAGES -ge 0 ] 
#     do
#         echo "Remaining attempts until 0: $NUMBER_OF_IMAGES"
        
#         NUMBER_OF_IMAGES=$(( $NUMBER_OF_IMAGES - 1 ))
#         echo $NUMBER_OF_IMAGES  ## Here only for debug
#     done
# }


# for image_repo in `docker images $DOCKER_REPO | tail -n +2 | awk '{print $1}' | sort | uniq`
# do
#     NUMBER_OF_IMAGES=3
#     echo "Original number of images: $NUMBER_OF_IMAGES"  ##here for debug
#     image_func
# done

