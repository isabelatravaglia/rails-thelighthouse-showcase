#!/bin/bash

# Gets full image tag in docker.compose.yml
full_tag=$(grep -i "image: rails" ./docker-compose.yml)

#Gets only tag number
tag_number=$(echo $full_tag | egrep -o '(([0-9][\.])|[0-9])(([0-9][\.])|[0-9])(([0-9][\.])|[0-9])')

echo $full_tag
echo $tag_number

#Builds image
docker-compose build

#Tag image
docker tag rails-thelighthouse:"$tag_number" registry.heroku.com/discoverthelighthouse/web

#Push tagged image to Heroku
docker push registry.heroku.com/discoverthelighthouse/web

#Releases 
heroku container:release web