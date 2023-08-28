echo -e "\e[32m configuring nodejs \e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash

echo -e "\e[32m install nodejs \e[0m"
yum install nodejs -y

echo -e "\e[32m add application user \e[0m"
useradd roboshop

echo -e "\e[32m create application directory \e[0m"
rm -rf /app
mkdir /app

echo -e "\e[32m downloading user content\e[0m"
curl -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip

echo -e "\e[32m extract application content\e[0m"
cd /app
unzip /tmp/cart.zip

echo -e "\e[32m  install nodejs dependencies\e[0m"
cd /app
npm install

echo -e "\e[32m configure systemd services\e[0m"
#cd /home/centos/roboshop-shell
cp /home/centos/roboshop-shell/cart.service /etc/systemd/system/cart.service

echo -e "\e[32m  start cart service\e[0m"
systemctl daemon-reload
systemctl enable cart
systemctl start cart
