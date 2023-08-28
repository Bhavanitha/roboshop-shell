echo -e "\e[33m Install Redis repos\e["
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y &>>/tmp/roboshop.log

echo -e "\e[33mEnable redis 6 version \e["
yum module enable redis:remi-6.2 -y &>>/tmp/roboshop.log

echo -e "\e[33m Install redis\e["
yum install redis -y &>>/tmp/roboshop.log

echo -e "\e[33m Update Redis Listen address \e["
sed -i 's/127.0.0.1/0.0.0.0/'/etc/redis.conf & vim /etc/redis/redis.conf &>>/tmp/roboshop.log

echo -e "\e[33m Start Redis Service \e["
systemctl enable redis &>>/tmp/roboshop.log
systemctl restart redis &>>/tmp/roboshop.log
