#!/bin/bash

#editor: cpt_redbeard
#Task: build a ton of images to test with, delete them, retag them, push them

#modifiable values
images="10000"
repo="imagerepo"
image="alpine-mass"
registry="NewRegistryName"
newrepo="NewRepoName"
newimage="NewImageName"

#constant
count="605"

echo "Make, Tag, Push or Destroy?"
echo "Push only pushes from the newtag"
read decision

case $decision in
[Dd] | [Dd][Ee][Ss][Tt][Rr][Oo][Yy] )
echo "Destroying..."

while [ ${images} -gt ${count} ];
do
        docker rmi $repo/$image:$count
        sleep 2
count=$[$count+1]
done
;;

[Tt] | [Tt][Aa][Gg] )
echo "Tagging..."

while [ ${images} -gt ${count} ];
do
        #docker rmi $repo/$image:$count
        docker tag $repo/$image:$count $registry/$newrepo/$newimage:$count
        sleep 2
count=$[$count+1]
done
;;

[Pp] | [Pp][Uu][Ss][Hh] )
echo "Pushing..."

while [ ${images} -gt ${count} ];
do
        #docker rmi $repo/$image:$count
        docker push $registry/$newrepo/$newimage:$count
        sleep 2
count=$[$count+1]
done
;;

[Mm] | [Mm][Aa][Kk][Ee] )
echo "Making..."

while [ ${images} -gt ${count} ];
do
        #docker rmi $repo/$image:$count
        docker build -t $repo/$image:$count .
        sleep 2

count=$[$count+1]
done
;;

*)
	echo "Unkown choice, please select one of the above"
	;;

esac