FROM nginx
RUN rm /etc/nginx/conf.d/default.conf
ADD vulnerable.conf /etc/nginx/conf.d/vulnerable.conf
ADD index.html /usr/share/nginx/html/index.html
RUN mkdir -p /var/www/app/static
RUN echo 'Welcome seccamp track B!' > /var/www/app/static/welcome.txt
ADD git /var/www/app/.git
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
EXPOSE 80
