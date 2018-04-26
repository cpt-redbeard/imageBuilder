#!/bin/bash

images="100"
count="0"

while x [ $images -lt $count]
do
	docker build -t repo/image:$count .
count =$[$count+1]
done