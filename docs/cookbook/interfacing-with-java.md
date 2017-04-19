The Java interface to q is implemented in the c class at <i class="fa fa-github"></i>&nbsp;<a target="_blank" href="https://github.com/KxSystems/code.archive/blob/master/kx/kdb%2B/c/kx/c.java">kx/kdb+/c/kx/c.java</a>. <!--FIXME-->

!!! note "GitHub"
    Truncated GitHub URLs are children of http://github.com/KxSystems/code.archive.

The c class implements the q protocol. That is:

-   a Java c client can connect to a q server
-   a q client can connect to a Java c server


## Java clients

Client constructors:

<div class="kx-compact" markdown="1">

| signature                                                                                    | notes                                                                                                                             |
|----------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| `public c(String host, int port, String usernameAndPassword) throws KException, IOException` | Throws a KException if access is denied by the q server. The username and password should be of the format `username:password`    |
| `public c(String host, int port) throws KException, IOException`                             | Uses the `user.name` property as the login name and password. Throws a KException if access is denied by the q server             |

</div>

It is important to close the c object explicitly, via the `close` method, when we are finished with the connection to a q server.

The class provides a number of other features explored in the following sections.


## Utility class for q types

Within the c class there are a number of utility classes provided to match the available types in q that do not map directly to standard classes such as Integer. 
In general these classes have all their fields declared with public access, and several provide custom `toString()` methods to decode the data payload.

<div class="kx-compact" markdown="1">

| class    | members                   | methods             | notes                                         |
|----------|---------------------------|---------------------|-----------------------------------------------|
| `Dict`   | `Object x; Object y`      |                     |                                               |
| `Flip`   | `String[] x, Object[]y`.  |                     |                                               |
| `Month`  | `int i`                   | `String toString()` | Provides `toString()` to decode the `i` field |
| `Minute` | `int i`                   | `String toString()` | Provides `toString()` to decode the `i` field |
| `Second` | `int i`                   | `String toString()` | Provides `toString()` to decode the `i` field |

</div>


## Creating null values

For each type character, we can get a reference to a null q value by indexing into the NULL Object array using the `NULL` utility method. 
Note the q null values are not the same as Java’s `null`.

An example of creating an object array containing two null q integers:
```java
#!java
Object[] twoNullIntegers = {NULL('i'), NULL('i')};
```
The q null values are mapped to Java values according to the following table:

<div class="kx-compact" markdown="1">

| q type                  | q null accessor    | Java null                    |
|-------------------------|--------------------|------------------------------|
| Boolean                 | `NULL('b')`        | `Boolean(false)`             |
| Byte                    | `NULL('x')`        | `Byte(byte() 0)`             |
| Short                   | `NULL('h')`        | `Short(Short.MIN_VALUE)`     |
| Integer                 | `NULL('i')`        | `Integer(Integer.MIN_VALUE)` |
| Long                    | `NULL('j')`        | `Long(Long.MIN_VALUE)`       |
| Float                   | `NULL('e')`        | `Float(Double.NaN)`          |
| Double                  | `NULL('f')`        | `Double(Double.Nan)`         |
| Character               | `NULL('c')`        | `Character(' ')`             |
| Symbol                  | `NULL('s')`        | `""`                         |
| Timestamp               | `NULL('p')`        | `Timestamp(Long.MIN_VALUE)`  |
| Month                   | `NULL('m')`        | `Month(Integer.MIN_VALUE)`   |
| Date                    | `NULL('d')`        | `Date(Long.MIN_VALUE)`       |
| DataTime/java.util.Date | `NULL('z')`        | `Timestamp(Long.MIN_VALUE)`  |
| Timespan                | `NULL('n')`        | `Timespan(Long.MIN_VALUE)`   |
| Minute                  | `NULL('u')`        | `Minute(Integer.MIN_VALUE)`  |
| Second                  | `NULL('v')`        | `Second(Integer.MIN_VALUE)`  |
| Time                    | `NULL('t')`        | `Time(Integer.MIN_VALUE)`    |

</div>

We can check whether a given Object `x` is a q null using the c utility method:
```java
#!java
public static boolean qn(Object x);
```


## Q types of Java objects

For reference, internally, types are mapped as follows for atoms:

<div class="kx-compact" markdown="1">

| Java object type | q type number |
|------------------|------------------|
| Boolean          | -1               |
| Byte             | -4               |
| Short            | -5               |
| Integer          | -6               |
| Long             | -7               |
| Float            | -8               |
| Double           | -9               |
| Character        | -10              |
| String           | -11              |
| Month            | -13              |
| java.util.Date   | -15              |
| Time             | -19              |
| Date             | -14              |
| Minute           | -17              |
| Second           | -18              |

</div>

and the following for complex data:

<div class="kx-compact" markdown="1">

| Java object type   | q type number |
|--------------------|---------------|
| `boolean[]`        | 1             |
| `byte[]`           | 4             |
| `short[]`          | 5             |
| `int[]`            | 6             |
| `long[]`           | 7             |
| `float[]`          | 8             |
| `double[]`         | 9             |
| `char[]`           | 10            |
| `String[]`         | 11            |
| `Month[]`          | 13            |
| `java.util.Date[]` | 15            |
| `Time[]`           | 19            |
| `Date[]`           | 14            |
| `Minute[]`         | 17            |
| `Second[]`         | 18            |
| `Flip`             | 98            |
| `Dict`             | 99             |

</div>

The default return value for all other objects is 0.


## Interacting with q via an open c instance

Interacting with the q server is very simple. 
You must make a basic choice between sending a message to the server where you expect no answer, or will check later for an answer.

In the first case, where we will not wait for a response, use the `ks` method on a c instance:
```java
public void ks(String s) throws IOException 
public void ks(String s, Object x) throws IOException
public void ks(String s, Object x, Object y) throws IOException
public void ks(String s, Object x, Object y, Object z) throws IOException
```
Alternatively, should we expect an immediate response use the `k` method:
```java
public Object k(Object x) throws KException, IOException
public Object k(String s) throws KException, IOException
public Object k(String s, Object x) throws KException, IOException
public Object k(String s, Object x, Object y) throws KException, IOException
public Object k(String s, Object x, Object y, Object z) throws KException, IOException 
```
As a special case of the `k` method, we may receive a message from the server without sending any message as an argument:
```java
public Object k() throws KException, IOException
```


## Accessing items of lists

We can access list items using the `at` method of the utility class c:
```java
Object c.at(Object x, int i) // Returns the object at x[i] or null
```
and set them with `set`:
```java
// Set x[i] to y, or the appropriate q null value if y is null
void c.set(Object x, int i, Object y)
```


## Java servers

```java
public interface IAuthenticate{public boolean authenticate(String s);}
public c(ServerSocket s,IAuthenticate a)throws IOException{io(s.accept());...} 
public c(ServerSocket s)throws IOException{this(s,null);}
```
kr(response) and ke(error)
```java
public void kr(Object x){…w(2,x);}
public void ke(String s){…}
```
A proxy:
```java
c s=new c(new ServerSocket(5010));
c c=new c("localhost",5000));
while(true)
{
  try
  {
    s.kr(c.k("qqq")); //response
  }
  catch(Exception e)
  { 
    s.ke(e.toString());    //error
  }
}
```


## Exceptions

The c class throws IOExceptions for typical socket read/write reasons and throws KException objects in higher-level cases. 
That is, for errors at the q level rather than the Socket level.


## Questions 

### What is the default time zone that the Java interface to q uses?

It uses whatever the environment is set to. To override it to be e.g. GMT, use
```java
c.tz=TimeZone.getTimeZone("GMT");
```


### What is the default date format?

```java
SimpleDateFormat(“yyyy.MM.dd”).
```


### How do I change the socket a c instance is using?

We can change the socket being used to talk to a q server using the `void io(Socket x) throws IOException` method.


### Is there a JDBC interface?

Yes. 
See <i class="fa fa-github"></i> <a href="https://github.com/KxSystems/code.archive/blob/master/kx/kdb%2B/c/jdbc.java" target="_blank">kx/kdb+/c/jdbc.java</a> for the implementation. 
Compile it as follows:
```bash
$ java jdbc.java
$ jar cf jdbc.jar *.class
```
and use as normal.

!!! note 
    This is a pure Java native-protocol driver (type 4) JDBC driver. 
    The implementation builds on the lower-level KDBC API, which is somewhat simpler 
    and a good choice for application development when support for legacy code is not a consideration.

The JDBC driver implements only the minimal core of the JDBC feature set. 
Operations must be prefixed by `"q)"` in order to be executed as q statements. 
There is no significant difference in performance between using the `!PreparedStatement`, `!CallableStatement` or `Statement` interfaces.

Q does not have the concept of transactions as expected by the JDBC API. 
That is, you cannot open a connection, explicitly begin a transaction, issue a series of separate queries within that transaction and finally roll back or commit the transaction. 
It will always behave as if `autoCommit` is set to true and the transaction isolation is set to `SERIALIZABLE`. 
In practice, this means that any single query (or sequence of queries if executed in a single JDBC call) will be executed in isolation 
without noticing the effects of other queries, and modifications made to the database will always be permanent.

!!! tip "Connection pooling"
    If little work is being performed per interaction via the JDBC driver, 
    that is, few queries and each query is very quick to execute, 
    then there is a significant advantage to using connection pooling. 
    Using the Apache Commons DBCP component improves the performance of this case by about 70%. 
    DBCP avoids some complexity which can be introduced by other connection pool managers. 
    For example, it handles connections in the pool that have become invalid (say due to a database restart) by automatically reconnecting. 
    Furthermore it offers configuration options to check the status of connections in the connection pool using a variety of strategies.

    Although it is not necessary to call the `close` method on `!ResultSet`, `Statement`, `!PreparedStatement` and `!CallableStatement` when using the q JDBC driver, 
    it is recommended with the DBCP component as it performs checks to ensure all resources are cleaned up, and has the ability to report resource leaks. 
    Explicitly closing the resources avoids a small runtime cost.

```java
package kx;
import java.sql.*;

//in kdb+3.x and above
//init table with
//Employees:([]id:0 1 2;firstName:`Charlie`Arthur`Simon;lastName:`Skelton`Whitney`Garland;age:10 20 30;timestamp:.z.p+til 3)

public class JDBCTest{
  static final String JDBC_DRIVER="jdbc";
  static final String DB_URL="jdbc:q:localhost:5000";
  static final String USER="username";
  static final String PASS="password";

  public static void main(String[] args){
    Connection conn=null;
    Statement stmt=null;
    try{
      Class.forName(JDBC_DRIVER);

      System.out.println("Connecting to database...");
      conn=DriverManager.getConnection(DB_URL,USER,PASS);

      System.out.println("Creating statement...");
      stmt=conn.createStatement();
      ResultSet rs=stmt.executeQuery("SELECT id, firstName, lastName, age,timestamp FROM Employees");

      while(rs.next()){
        long id=rs.getLong("id");
        long age=rs.getLong("age");
        String first=rs.getString("firstName");
        String last=rs.getString("lastName");
        Timestamp timestamp=rs.getTimestamp("timestamp");

        System.out.print("ID: "+id);
        System.out.print(", Age: "+age);
        System.out.print(", FirstName: "+first);
        System.out.println(", LastName: "+last);
        System.out.println(", Timestamp: "+timestamp);
      }
      rs.close();
      stmt.close();
      conn.close();
    }catch(SQLException se){
      se.printStackTrace();
    }catch(Exception e){
      e.printStackTrace();
    }finally{
      try{
        if(stmt!=null)
          stmt.close();
      }catch(SQLException se2){
      }
      try{
        if(conn!=null)
          conn.close();
      }catch(SQLException se){
        se.printStackTrace();
      }
    }
  }
}
```
when run should print something like
```
Connecting to database...
Creating statement...
ID: 0, Age: 10, FirstName: Charlie, LastName: Skelton, Timestamp: 2014-09-02 08:28:11.688024
ID: 1, Age: 20, FirstName: Arthur, LastName: Whitney, Timestamp: 2014-09-02 08:28:11.688024001
ID: 2, Age: 30, FirstName: Simon, LastName: Garland, Timestamp: 2014-09-02 08:28:11.688024002
```
```java
#!java

// An ObjectPool serves as the pool of connections.
//
ObjectPool connectionPool = new GenericObjectPool(null);

// A ConnectionFactory is used by the to create Connections.
// This example uses the DriverManagerConnectionFactory, with a
// a connection string for a local q database listening on port 5001.
//
ConnectionFactory connectionFactory =
            new DriverManagerConnectionFactory("jdbc:q:localhost:5001",null);

// A PoolableConnectionFactory is used to wrap the Connections
// created by the ConnectionFactory with the classes that implement
// the pooling functionality.
//
PoolableConnectionFactory poolableConnectionFactory = new
            PoolableConnectionFactory(connectionFactory,connectionPool,null,
            null,false,true);

// Finally, we create the PoolingDriver itself:
//
Class.forName("org.apache.commons.dbcp.PoolingDriver");
PoolingDriver driver = (PoolingDriver)
            DriverManager.getDriver("jdbc:apache:commons:dbcp:");

// ...and register our pool with it.
//
driver.registerPool("q",connectionPool);

// Now we can just use the connect string "jdbc:apache:commons:dbcp:q"
// to access our pool of Connections.
```


## Example: Grid viewer using Swing

```java
#!java
package app;

import java.awt.BorderLayout;
import java.awt.Color;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.AbstractTableModel;
import kx.c;

public class Main {
    public static class KxTableModel extends AbstractTableModel {
        private c.Flip flip;
        public void setFlip(c.Flip data) {
            this.flip = data;
        }

        public int getRowCount() {
            return Array.getLength(flip.y[0]);
        }

        public int getColumnCount() {
            return flip.y.length;
        }

        public Object getValueAt(int rowIndex, int columnIndex) {
            return c.at(flip.y[columnIndex], rowIndex);
        }

        public String getColumnName(int columnIndex) {
            return flip.x[columnIndex];
        }
    };

    public static void main(String[] args) {
        KxTableModel model = new KxTableModel();
        c c = null;
        try {
            c = new c("localhost", 5001,"username:password");
            String query="([]date:.z.D;time:.z.T;sym:10?`8;price:`float$10?500.0;size:10?100)";
//          String query="0!select last price by sym from trade where date=last date";
            model.setFlip((c.Flip) c.k(query));
        } catch (Exception ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (c != null) {try{c.close();} catch (IOException ex) {}
          }
        }
        JTable table = new JTable(model);
        table.setGridColor(Color.BLACK);
        String title = "kdb+ Example - "+model.getRowCount()+" Rows";
        JFrame frame = new JFrame(title);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.getContentPane().add(new JScrollPane(table), BorderLayout.CENTER);
        frame.setSize(300, 300);
        frame.setVisible(true);
    }
}
```


