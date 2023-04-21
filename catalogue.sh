# before doing an operation i'm giving some info in the form of echo statements below:
echo -e "\e[36m<<<<<<<<<<<<<< configuring node js repos >>>>>>>>>>>>>>\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo -e "\e[36m<<<<<<<<<<<<<< install node js  >>>>>>>>>>>>>>\e[0m"
yum install nodejs -y

echo -e "\e[36m<<<<<<<<<<<<<< add application user>>>>>>>>>>>>>>\e[0m"
useradd roboshop

echo -e "\e[36m<<<<<<<<<<<<<< create application directory >>>>>>>>>>>>>>\e[0m"
rm -rf /app
mkdir /app

echo -e "\e[36m<<<<<<<<<<<<<< download app content >>>>>>>>>>>>>>\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app

echo -e "\e[36m<<<<<<<<<<<<<<unzip app content >>>>>>>>>>>>>>\e[0m"
unzip /tmp/catalogue.zip

echo -e "\e[36m<<<<<<<<<<<<<< install node js dependencies >>>>>>>>>>>>>>\e[0m"
npm install

echo -e "\e[36m<<<<<<<<<<<<<< copy catalogue systemD file>>>>>>>>>>>>>>\e[0m"
cp /home/centos/Robshell/catalogue.service /etc/systemd/system/catalogue.service

echo -e "\e[36m<<<<<<<<<<<<<< start catalogue service >>>>>>>>>>>>>>\e[0m"
systemctl daemon-reload
systemctl enable catalogue
systemctl start catalogue
echo -e "\e36m<<<<<<<<<<<<copy mongodb repos>>>>>>>>>>>\e[0m"
cp mongo.repo /etc/yum.repos.d/mongo.repo
yum install mongodb-org-shell -y
mongo --host mongodb-dev.bobbydevops.online </app/schema/catalogue.js

