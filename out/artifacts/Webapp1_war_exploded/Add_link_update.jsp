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
    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet resultSet = null;
%>

<%
    String email=request.getParameter("email");
    String link=request.getParameter("link");


    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medcendb",
            "root", "");
    String sql = "Update doctor set link=? where email=?";
    ps = con.prepareStatement(sql);

    ps.setString(1,link);

    ps.setString(2,email);
    int i = ps.executeUpdate();


%>

<script>
    var j=<%=i%>;
    if(j > 0){
        alert("Updated Succesfully");
        window.location.href="adminprofile.jsp";
    }
    else{
        alert('something happn?');
        window.location = 'adminprofile.jsp';
    }
</script>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
