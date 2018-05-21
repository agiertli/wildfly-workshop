We didn't see our byteman logging in the server.log. It seems we need to tweak the logging configuration a bit.
Before you start working on this lab, copy the byteman installation from task3 to the root of this folder. 
Make sure *debug.btm* includes the proper byteman script (if unsure, consult solution from previous task).

Open standalone.xml and enable logging for package *org.fel.cvut.threaddump* for appropriate logging level.

Once done, let's test again:

 - Start the environment by executing *start.sh[bat]* script
 - Open two terminal windows and execute *connectToWildfly.sh[bat]* in both of them
 - In one terminal window let's print the WildFly log:
 ```
 tail -f wildfly/standalone/log/server.log
 ```
 - In second window send couple of requests to our application:
 ```
 ./wildfly/stress-test.sh 20
 ```

 What do you see and why?

 Let's make sure that we are truly configuring the correct package name. Open the byteman rule and change the logging level from *finest* to *info* - this will be present in the server.log by default, without any further configuration needed.

 Execute *cleanup.sh[bat]* and repeat the testing procedure as explained aboved again. 
 What do you see? 

 Revert back the bytemant script to finest level and correct the logging configuration appropriately. Once done, execute *cleanup.sh[bat]* script and repeat the testing procedure from scratch.

 What can we learn from the logs?