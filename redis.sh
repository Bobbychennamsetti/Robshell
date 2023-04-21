echo -e "\e[36m<<<<<<<<< install redis repos>>>>>>>>>>>>\e[om"
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
echo -e "\e[36m<<<<<<<<< install redis >>>>>>>>>>>>\e[om"
dnf module enable redis:remi-6.2 -y
yum install redis -y

echo -e "\e[36m<<<<<<<<< update redis listen address >>>>>>>>>>>>\e[om"
sed -i -e 's|127.0.0.0|0.0.0.0|' /etc/redis.conf /etc/redis/redis.conf

echo -e "\e[36m<<<<<<<<< start redis service >>>>>>>>>>>>\e[om"
systemctl enable redis
systemctl restart redis
