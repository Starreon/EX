<p align="center"><a href="https://t.me/starreon" target="_blank"><img src="https://keephere.ru/get/rNEsjyFpOlo/o/photo.jpg" width="400"></a></p>

## 联系作者

承接，机器人、网站平台，定制开发，17人大团队，5年技术经验，欢迎咨询

telegram作者 [@Star](https://t.me/starreon)


## 使用方法

<p align="center"><a href="https://t.me/starreon" target="_blank"><img src="https://keephere.ru/get/3NEsrjJxtQu/o/photo.jpg" width="400"></a></p>
前端uniapp，后端Java

nohup java -jar trading-order-admin-0.0.1-SNAPSHOT.jar &

admin会生成个jar 上传到服务器 
nohup java -jar a.jar &

admin-vue  修改 .env.development     .env.production

wap-vue   修改  vite.config.js   index.js

后端

超级管理员：root           登录密码：123456          

交易验证：123456              

谷歌验证：OFSGV4RPZXOJY4GL（默认密钥）

前端反向代理

	     	location /api/ {
                        index index.html index.php;
                        proxy_pass http://103.15.217.206:8085/api/;
                        proxy_http_version 1.1;
                        proxy_set_header Upgrade $http_upgrade;
                        proxy_set_header Connection "upgrade";
                        proxy_set_header   Host    $host;
                        proxy_set_header   X-Real-IP   $remote_addr;
                        proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
                        client_max_body_size 100m;
		}

后台反向代理
				location /aip/ {
                       index index.html index.php;
                        proxy_pass http://103.15.217.206:8085/;
                        proxy_http_version 1.1;
                        proxy_set_header Upgrade $http_upgrade;
                        proxy_set_header Connection "upgrade";
                        proxy_set_header   Host    $host;
                        proxy_set_header   X-Real-IP   $remote_addr;
                        proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
                        client_max_body_size 100m;
                }

## 声明

本项目仅供技术研究，请勿用于任何商业用途，请勿用于非法用途，如有任何人凭此做非法事情，均于作者无关，特此声明。
