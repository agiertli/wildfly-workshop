We would like to find out where exactly is a bottleneck in our application.
We first want to verify how long our SQL query actualy lasts and how many concurrent requests is application able to handle as there
has been some uncertainty.

Luckily, we have obtained an older version of our application which actually prints the timestamp as soon as the SQL execution ended:

```
PrintWriter writer = asyncContext.getResponse().getWriter();
writer.println("SQL execution ended:" + new Date());
writer.close();
```

Unfortunately the timestamp is not printed on the stdout but its part of the servlet response.
Let's add static html resource into our application which will print the timestamp before SQL is invoked and the same html page will also receive
the timestamp printed from our servlet.
 
## Task A - update the binary
 - By utilizing [jar command](https://docs.oracle.com/javase/tutorial/deployment/jar/update.html), add index.thml file under the root folder of our application
 - Verify the success of this operation by using jd-gui

## Setup

Now let's get familiarize with our environment. We will be using dockerized WildFly 12, which is fully certified Java EE application server.
Feel free to explore various scripts - Dockerfile, start.sh, cleanup.sh, etc. Our WildFly docker image is linked with MariaDB image, which we need
for simulating long running database queries. Once started, WildFly is accessible on port 8080.
You can start wildfly by executing *start.sh[bat]* script and once you are done testing, make sure to execute *cleanup.sh[bat]*

## Task B - Starting the environment for the first time
Start the environment by executing *start.sh[bat]* . Be patient - when executed for the first time, this command will actually download WildFly and MariaDB binaries onto your local PC. Once the WildFly is started open your browser and navigate to
```
http://localhost:8080/task2-binaries/GetData
```
How long the SQL query execution took?
