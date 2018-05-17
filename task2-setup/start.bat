docker run --name workshop-mariadb -d -e MYSQL_RANDOM_ROOT_PASSWORD=yes -e MYSQL_USER=student -e MYSQL_PASSWORD=student -e MYSQL_DATABASE=workshopdb -p 3306:3306 mariadb:10.1
docker build -t wildfly-task2 .
docker run --name=wildfly-task2 --link workshop-mariadb:db -e JAVA_OPTS="-Djava.net.preferIPv4Stack=true" -p 8080:8080 -p 9990:9990 -d wildfly-task2 /opt/jboss/wildfly/bin/standalone.sh -bmanagement 0.0.0.0 -b 0.0.0.0
