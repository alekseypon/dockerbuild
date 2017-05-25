FROM registry.local/library/centos

ENV WP_DATABASE wp_db
ENV WP_DB_USER wp_db_user
ENV WP_DB_PASSWD password
ENV WP_DB_HOST wp_db

RUN yum -y update && yum -y install epel-release && yum -y install wordpress php httpd iputils && yum clean all -y
RUN sed -i 's/^Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf && \
    chmod -R a+rwx /etc && chmod -R a+rwx /run && chmod -R a+rwx /var/log/httpd && chmod -R a+rwx /etc/httpd/logs

ADD start.sh /
EXPOSE 8080


CMD [ "/start.sh" ] 
