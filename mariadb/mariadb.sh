set -x
# todo shell: check if the volume path exit and create as need
# change MYSQL_ROOT_PASSWORD password
# Set password : export DOCKER_PASS='xxxx'
# Unit linkl
# https://coreos.com/os/docs/latest/getting-started-with-systemd.html
# download and install on new coreos
# (own by core user)
# 1)  mkdir -p /data  
# 2)  wget -qO- your_dropbox_share_link_here | tar xvz -C /data
# (remove: IPADDRESS) 
# 3)  ./data/launch/mariadb/mariadb.sh     
IPADDRESS="192.168.3.112"
DOCKER_PASS=${DOCKER_PASS:='docker!'}
docker run --name mariadb -p $IPADDRESS:3306:3306 -v /data/mariadb/db:/var/lib/mysql --restart=always -e MYSQL_ROOT_PASSWORD=$DOCKER_PASS -d mariadb
