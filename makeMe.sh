#!/bin/bash

images="100"
count="0"
repo="testRepo"
image="alpine-mass"

while [ ${images} -gt ${count} ];
do
        docker build -t $repo/$image:$count .
count =$[$count+1]
done