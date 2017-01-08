set -x
# todo shell: check if the volume path exit and create as need
# change MYSQL_ROOT_PASSWORD password
DOCKER_PASS=${DOCKER_PASS:='docker!'}
docker run --name mysql -p 3306:3306 -v /home/alfred/workspace/docker/data/mysql/db:/var/lib/mysql --restart=always -e MYSQL_ROOT_PASSWORD=$DOCKER_PASS -d mysql
