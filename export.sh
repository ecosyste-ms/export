#!/bin/sh

# get service name
service_name=$1

default_bucket_name=ecosystems-data

bucket_name="${2:-$default_bucket_name}"

database="$service_name"_production

# get current date
date=$(date '+%Y-%m-%d')

path="$service_name-$date"

folder="/tmp/$path"

# mkdir of current date
mkdir $folder

# export database into folder
dokku postgres:export $database > $folder/$service_name-$date.sql

# download license into folder
curl -o $folder/license.txt https://raw.githubusercontent.com/ecosyste-ms/export/main/export-license.txt

# download readme into folder
curl -o $folder/readme.md https://raw.githubusercontent.com/ecosyste-ms/export/main/export-readme.md

# compress folder 
tar -czf $folder.tar.gz -C /tmp/ $path

# upload to s3
aws s3 cp $folder.tar.gz s3://$bucket_name/

# trigger rake task in $service_name service to record export
dokku run --env EXPORT_DATE=$date --env BUCKET_NAME=$bucket_name $service_name rake exports:record

# delete folder
rm -rf $folder
rm $folder.tar.gz