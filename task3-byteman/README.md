Our database specialists are currently working on improving the long running SQL as identified in the previous task.
We have noticed that the performance problems were only spotted under increased load. We need to make sure we have enough resources to handle such load.
Let's start by verifying whether there are enough database connection provided by WildFly and whether we are able to obtain them quickly.

We are obtaining connections like this:
```
Context ctx = new javax.naming.InitialContext();
DataSource ds = (javax.sql.DataSource) ctx.lookup("java:jboss/WorkshopDB");
java.sql.Connection con = ds.getConnection();
```
As you can see, there is no database url/password. We are accessing database by JNDI *java:jboss/WorkshopDB*. This means the database and database connections are managed by the Application Servers itself. We would like to measure the speed of obtaining the managed connection under load.
Our first idea was to add simple *System.out.println()* statements before and after *getConnection()* line. But we still have no sources codes available, so we still can't recompile our application...

## Byteman

[Byteman](http://byteman.jboss.org/) is a byte code manipulation tool. It allows you to inject Java code without the need for you to recompile, repackage or even redeploy your application. You put the code you want to inject into so called *rule*. Rule has set of conditions and if these are fulfilled it will be executed. Example rule:
```
RULE trace entering
CLASS org.sample.Person
METHOD getName
AT ENTRY
IF true
DO traceln("entered get-Name")
ENDRULE

```

Assume following code somewhere inside your application:
```
org.sample.Person person = new org.sample.Person("Anton Giertli");
String name = person.getName(); // you would see additional byteman logging at this point
```

## Task - Measuring getConnection()
  - Download [byteman 4.0.2](http://byteman.jboss.org/downloads.html) and extract it into the root directory of this task
  - It should look like this:
 ```
 $ pwd
 /PATH/task3-byteman
 $ ls
 ...
byteman-download-4.0.2
 ...

 ````
 - Create debug.btm file and put it inside byteman-download-4.0.2/
 - Design a rule/s which will:
    - Print something before *getConnection()* is called
    - Print something after *getConnection()* is called
    - You can't use *System.out.println()*
    - Use the logger which is injected into the class variable *logger*
    - You can't use info log leve. Pick suitable [log level](https://docs.oracle.com/javase/8/docs/api/java/util/logging/Level.html) for debugging
    - To access class variable inside a byteman rule you need to use *$this.someVariable* keyword
    - Use suitable [location specifier](https://github.com/bytemanproject/byteman/blob/master/docs/asciidoc/src/main/asciidoc/chapters/Byteman-Rule-Language.adoc)
    - Be brave. Don't look into the solution file just yet
  
 - Start the environment by executing *start.sh[bat]* script
 - Open two terminal windows and execute *connectToWildfly.sh[bat]* in both of them
 - In one termianl window let's print the WildFly log:
 ```
 tail -f wildfly/standalone/log/server.log
 ```
 - In second window send couple of requests to our application:
 ```
 ./wildfly/stress-test.sh 20
 ```

 - What is the output in the server.log? Why?
