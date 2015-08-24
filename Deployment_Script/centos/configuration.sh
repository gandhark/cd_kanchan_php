#!/bin/bash
echo "############### Php 5.5.6 Installation ######################"
			
echo "#######################################################"
echo "Installing Php"
echo "#######################################################"
if   	! which php > /dev/null; then
   	echo -e "Php is not installed! \c"
   	echo "Installinig Php and php-mysql..."
  	sleep 5
  	yum clean all
  	sudo yum -y install php55-php php55-php-mysql php55-php-pecl-xdebug php55-php-mbstring php55-php-mcrypt 
	cd ~
	head -n3 /opt/rh/httpd24/enable>>.bashrc
	head -n3 /opt/rh/php55/enable>>.bashrc
	echo "export PATH=/opt/rh/php55/root/usr/bin:/opt/rh/php55/root/usr/sbin${PATH:+:${PATH}}
	export MANPATH=/opt/rh/php55/root/usr/share/man:${MANPATH}">>.bashrc
	source ~/.bashrc
  	printf "\n\n"

else 
	echo "Php is installed."
	php -v
	printf "\n\n"
	sleep 5
fi


echo "############## MySQL installation ####################"
echo "#######################################################"
echo "Installing MYsql"
echo "#######################################################"
if 	! which mysql>/dev/null; then 
	echo -e "Mysql is not installed!! \c"
	echo -e "Installing Mysql..."
	sleep 5
	yum clean all
	 yum -y install mysql-server
	/etc/init.d/mysqld start	
 	
else
	echo "MySQL is installed."    
       	mysql --version
	/etc/init.d/mysqld start
fi

echo "############## GIT installation ####################"
echo "#######################################################"
echo "Installing Git"
echo "#######################################################"
if      ! which git>/dev/null; then
        echo -e "git is not installed!! \c"
        echo -e "Installing git..."
        sleep 5
        yum clean all
         yum -y install git
        
        
else
        echo "git is installed."
        git --version
fi


echo "##################################Composer globally###############"

if      ! which composer > /dev/null; then
	cd /opt
	pwd
	echo "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"
	mkdir compinstall
	cd compinstall
	pwd
	curl -sS https://getcomposer.org/installer | php
	ls -lrt
	mv  composer.phar /usr/local/bin;
	cd /usr/local/bin
	mv composer.phar composer
	#alias composer='/usr/local/bin';
	ls -lrt
	cd ..
	pwd
	cd /opt
	rm -rf compinstall

else
	echo "composer is installed"
	composer -v	
fi

echo "############## Apache Setup ####################"
echo "Making Firewall rules to permissive";
	setenforce 0
  	/etc/init.d/httpd24-httpd start
echo " started httpd server successfully";
