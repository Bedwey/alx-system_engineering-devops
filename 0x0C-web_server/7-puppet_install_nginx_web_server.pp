# install nginx
package {'nginx':
  ensure   => 'installed',
  provider => 'pip',
}

# Create a home page
file { '/var/www/html/index.nginx-debian.html':
  ensure  => 'file',
  content => 'Hello World!',
  owner   => 'www-data',
  group   => 'www-data',
  mode    => '0744',
}

# Configure Nginx
file { '/etc/nginx/sites-available/default':
  ensure  => present,
  content => "server {\n
   		        listen 80 default_server;\n
			listen [::]:80 default_server;\n
\n
        		root /var/www/html;\n
\n
        		index index.html index.htm index.nginx-debian.html;\n
\n
        		server_name _;\n
\n
        		location / {\n
				try_files $uri $uri/ =404;\n
        		}\n
\n
 		       location /redirect_me {\n
                		return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4/;\n
        	       }\n
	   }\n",
}
