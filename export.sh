#!/bin/sh

# get service name
service_name=$1

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
wget -O $folder/license.txt https://creativecommons.org/licenses/by-sa/4.0/legalcode.txt

# download readme into folder
wget -O $folder/readme.md https://raw.githubusercontent.com/ecosyste-ms/export/master/README.md

# compress folder 
tar -czf $folder.tar.gz -C /tmp/ $path

# upload to s3
aws s3 cp $folder.tar.gz s3://ecosystems-data/

# trigger rake task in $service_name service to record export
# dokku run --env EXPORT_DATE=$date $service_name rake exports:record

# delete folder
rm -rf $folder
rm $folder.tar.gz