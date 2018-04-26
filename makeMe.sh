#!/bin/bash

#editor: cpt_redbeard
#Task: build a ton of images to test with

#modifiable values
images="100"
repo="imagerepo"
image="alpine-mass"

#constant
count="0"


if 

while [ ${images} -gt ${count} ];
do
        #docker rmi $repo/$image:$count
        docker build -t $repo/$image:$count .
count=$[$count+1]
done