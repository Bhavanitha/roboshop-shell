curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/roboshop.log
yum install nodejs -y &>>/tmp/roboshop.log
useradd roboshop &>>/tmp/roboshop.log
rm -rf /app &>>/tmp/roboshop.log
mkdir /app
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip &>>/tmp/roboshop.log
cd /app
unzip /tmp/catalogue.zip &>>/tmp/roboshop.log
cd /app
npm install &>>/tmp/roboshop.log
cp catalogue.service /etc/systemd/system/catalogue.service &>>/tmp/roboshop.log
systemctl daemon-reload &>>/tmp/roboshop.log
systemctl enable catalogue &>>/tmp/roboshop.log
systemctl start catalogue &>>/tmp/roboshop.log
cp mongodb.repo /etc/yum.repos.d/mongodb.repo &>>/tmp/roboshop.log
yum install mongodb-org-shell -y &>>/tmp/roboshop.log
mongo --host mongodb-dev.bhavanitha.site </app/schema/catalogue.js &>>/tmp/roboshop.log
