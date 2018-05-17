FROM jboss/wildfly:12.0.0.Final
ADD mariadb-java-client-1.4.6.jar /opt/jboss/wildfly/standalone/deployments/
ADD mariadb-java-client-1.4.6.jar.dodeploy /opt/jboss/wildfly/standalone/deployments/
ADD standalone.xml /opt/jboss/wildfly/standalone/configuration/
ADD task2-binaries.war /opt/jboss/wildfly/standalone/deployments/
ADD task2-binaries.war.dodeploy /opt/jboss/wildfly/standalone/deployments/
