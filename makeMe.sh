#!/bin/bash

#editor: cpt_redbeard
#Task: build a ton of images to test with

#modifiable values
images="100"
repo="imagerepo"
image="alpine-mass"

#constant
count="0"

echo "Make or Destroy?"
read decision

case $decision in
[Dd] | [Dd][Ee][Ss][Tt][Rr][Oo][Yy] )
echo "Destroying..."

while [ ${images} -gt ${count} ];
do
        docker rmi $repo/$image:$count
        #docker build -t $repo/$image:$count .
count=$[$count+1]
done
;;

[Mm] | [Mm][Aa][Kk][Ee] )
echo "Making..."

while [ ${images} -gt ${count} ];
do
        #docker rmi $repo/$image:$count
        docker build -t $repo/$image:$count .
count=$[$count+1]
done
;;

*)
	echo "Unkown choice, please choose Make or Destroy"
	;;

esac