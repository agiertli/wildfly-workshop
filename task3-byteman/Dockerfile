FROM wildfly-task2
ADD task3-binaries.war /opt/jboss/wildfly/standalone/deployments/
ADD task3-binaries.war.dodeploy /opt/jboss/wildfly/standalone/deployments/
RUN rm /opt/jboss/wildfly/standalone/deployments/task2-binaries.war
ADD byteman-download-4.0.2 /opt/jboss/wildfly/byteman-download-4.0.2
ADD standalone.conf /opt/jboss/wildfly/bin/
ADD stress-test.sh /opt/jboss/wildfly/