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
    String name=request.getParameter("name");
    String gender=request.getParameter("gender");
    String email=request.getParameter("email");
    String specialization = request.getParameter("specialization");
    String contact = request.getParameter("contact");
    String experience = request.getParameter("experience");
    String Password = request.getParameter("password");
    String about = request.getParameter("about");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medcendb",
            "root", "");
   String sql = "Update doctor set name=?,gender=?,experience=?,specialization=?,contact=?,password=?,about=? where email=?";
    ps = con.prepareStatement(sql);
    ps.setString(1,name);
    ps.setString(2,gender);
    ps.setString(3,experience);
    ps.setString(4,specialization);
    ps.setString(5,contact);
    ps.setString(6,Password);
    ps.setString(7,about);
    ps.setString(8,email);
    int i = ps.executeUpdate();


%>

<script>
    var j=<%=i%>;
    if(j > 0){
        alert("Updated Succesfully");
        window.location.href="profile_doc.jsp";
    }
    else{
        alert('Enter correct details');
        window.location = 'doctor_login.html';
    }
</script>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
