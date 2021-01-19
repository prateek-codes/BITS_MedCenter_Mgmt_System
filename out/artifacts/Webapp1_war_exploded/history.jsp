<%--
  Created by IntelliJ IDEA.
  User: Vibhor
  Date: 12-11-2019
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %><!DOCTYPE html>
<%
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "medcendb";
    String userid = "root";
    String password = "";
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection2 = null;
    PreparedStatement statement2 = null;
    ResultSet resultSet2 = null;
%>




<html>
<head>
    <title>User History</title>
</head>
<body>

<h2>Previous History</h2>

<br>


        <%
            try{
            String email1=request.getParameter("emailaddr");
            connection2 = DriverManager.getConnection(connectionUrl+database, userid, password);
            statement2=connection2.prepareStatement("select * from medhistory where bits_email=?");
            statement2.setString(1,email1);
            resultSet2 = statement2.executeQuery();
            while(resultSet2.next()){
        %>
        <hr>
        <h3><p>Case No:-<%=resultSet2.getInt(1)%></p></h3><h3><p>Date:-<%=resultSet2.getDate(2)%></p></h3>
        <h3>Synopsis</h3>
        <p><%=resultSet2.getString(5)%></p>
        <h3>Prescription</h3>
        <p><%=resultSet2.getString(6)%></p>
        <br>
        <hr>

<%  }
    connection2.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>
</body>
</html>

