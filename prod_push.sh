#!/bin/bash


full_tag=$(grep -i "image: rails" ./docker-compose.yml)
tag_number=$(echo $full_tag | egrep -o '(([0-9][\.])|[0-9])(([0-9][\.])|[0-9])(([0-9][\.])|[0-9])')

echo $full_tag
echo $tag_number

docker tag rails-thelighthouse:"$tag_number" registry.heroku.com/discoverthelighthouse/web

docker push registry.heroku.com/discoverthelighthouse/web

heroku container:release web