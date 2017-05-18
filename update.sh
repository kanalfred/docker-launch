#set -x
# Launch script that use this script must contain following variable 
#   CONTAINTER_NAME
#   IMAGE_TAG
# 
# Usage:
# ./update.sh test.sh

FILENAME=$1

if  [ -z "$FILENAME" ]; then
    echo 'Please enter launch script file path:'
    exit 1
fi

# Eeval to assing value excludeing double quota
eval "CONTAINTER_NAME="$(sed -n 's/^CONTAINTER_NAME=//p' $FILENAME)""
eval "IMAGE_TAG="$(sed -n 's/^IMAGE_TAG=//p' $FILENAME)""

if  [ -z "$CONTAINTER_NAME" ]; then
    echo "Error reading [CONTAINTER_NAME] in [$FILENAME]"
    exit 1
fi
if  [ -z "$IMAGE_TAG" ]; then
    echo "Error reading [IMAGE_TAG] in [$FILENAME]"
    exit 1
fi

echo "---------------------------------------------------"
echo "Contain Name: [$CONTAINTER_NAME] Image tag: [$IMAGE_TAG]"  
echo "---------------------------------------------------"
printf "\n\r"

# update docker image
docker pull $IMAGE_TAG
# remove existing container
docker rm -f $CONTAINTER_NAME
# run
sh ./$FILENAME
# remove old image
docker rmi $(docker images | grep '<none>' | awk '{print $3}')
