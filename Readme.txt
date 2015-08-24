1) replace /opt/rh/httpd/root/etc/httpd/conf/httpd.conf file .
   or else changes to be

2) setenforce 0

3) you need to add fingerprint of machine to the machine on which u want to deploy (here 182 server)

4)make changes accordingly in appconfig file

5) for laravel projects add following extentions while installing (creating php environment)
eg. PDO php-mcrypt php-mbstring


