#!/bin/bash

#Stop local containers to avoid deployment errors
# docker-compose stop

# Gets full image tag in docker.compose.yml
full_tag=$(grep -i "image: rails" ./docker-compose.yml)

#Gets only tag number
tag_number=$(echo $full_tag | egrep -o '(([0-9][\.])|[0-9])(([0-9][\.])|[0-9])(([0-9][\.])|[0-9])')

echo $full_tag
echo $tag_number

#Builds image
echo "Getting current user and group IDs"
UID=$(id -u) 
export UID
GID=$(id -g)
export GID

echo "UID is $UID"
echo "GID is $GID"

echo "Building Image"
# docker-compose build
docker build -f Dockerfile.prod -t rails-thelighthouse-prod:"$tag_number" ./

#Tag image
echo "Tagging Image for Heroku Registry"
docker tag rails-thelighthouse-prod:"$tag_number" registry.heroku.com/discoverthelighthouse/web

#Push tagged image to Heroku
echo "Pushing Image to Heroku"
docker push registry.heroku.com/discoverthelighthouse/web

#Releases 
echo "Releasing Image"
heroku container:release web