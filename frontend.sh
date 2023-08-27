echo -e "\e[34mInstalling Nginx server\e[0m"
yum install nginx -y

echo -e "\e[34mRemoving old App content\e[0m"
rm -rf /usr/share/nginx/html/*

echo -e "\e[34Downloading frontend content\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip

echo -e "\e[34Extract frontend content\e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

#we need to copy configuration file

echo -e "\e[34Starting Nginx server\e[0m"
systemctl enable nginx
systemctl restart nginx
