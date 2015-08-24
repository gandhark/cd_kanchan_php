#!/bin/sh
source ../appconfig;

echo "###########################################################"
echo "cloning repo  into Web Server Directory"
echo "###########################################################"
	cd /opt
	echo $USER_REPO
	echo $PASS_REPO
	echo $GIT_URL
	git clone http://$USER_REPO:$PASS_REPO@$GIT_URL $CONFFILENAME
	ls-lrt;
	#unzip   $ZIPNAME.zip -d $PROJECTDIR
	chmod -R 777 /opt/$CONFFILENAME/app/storage
	#rm -rf $ZIPNAME.zip  

echo "Giving  permission to clone repo source code"
pwd
chmod -R 755 /opt/$CONFFILENAME
chmod -R 777 /opt/$CONFFILENAME/app/storage
echo "successfully copied into /opt..next will be to create symlink"
#echo "Check your site on  url $SERVERNAME";



