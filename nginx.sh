set -x
# todo shell: check if the volume path exit and create as need
# change MYSQL_ROOT_PASSWORD password
docker run -e 'apple=aboy!' -h nginx --name nginx -p 2200:22 -p 80:80 -p 443:443 -d -v /home/alfred/workspace/docker/data/nginx/data:/data kanalfred/nginx
