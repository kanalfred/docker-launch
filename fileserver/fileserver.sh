set -x
DIRNAME=$(dirname `readlink -f -- $0`)

# vars require by update.sh
CONTAINTER_NAME="fileserver"
IMAGE_TAG="kanalfred/fileserver"

# virutal nic 
IPADDRESS="192.168.3.130"
docker run -h fileserver --name $CONTAINTER_NAME \
--restart=always \
--volumes-from data-fileserver --volumes-from data-fileserver-bak --volumes-from data-other \
-p $IPADDRESS:2200:22 -p $IPADDRESS:445:445 -p $IPADDRESS:139:139 -p $IPADDRESS:135:135 -p $IPADDRESS:137:137/udp -p $IPADDRESS:138:138/udp \
-d $IMAGE_TAG
