echo "server {
        listen 80;

        location / {
                return 404;
        }

        location = /404.html {
                internal;
        }
        return 301 https://\$host\$request_uri;
}

server {
        listen 443 ssl;
		
        ssl_certificate     /etc/ssl/private/nginx.cert.pem;
        ssl_certificate_key /etc/ssl/private/nginx.key.pem;

        root /var/www/react;

        index index.html;

        location = /wordpress {
            return 307 http://$IP:$WPPORT/;
        }

        location /phpmyadmin/ {
            proxy_pass http://$IP:$PMAPORT/;
        }
}" > /etc/nginx/conf.d/react.conf