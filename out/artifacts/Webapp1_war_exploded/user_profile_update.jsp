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
    String age=request.getParameter("age");
    String email=request.getParameter("email");
    String contact = request.getParameter("contact");
    String hostel = request.getParameter("hostel");

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medcendb",
            "root", "");
    String sql = "Update user_data set name=?,gender=?,age=?,contact=?,hostel=? where email=?";
    ps = con.prepareStatement(sql);
    ps.setString(1,name);
    ps.setString(2,gender);
    ps.setString(3,age);

    ps.setString(4,contact);

    ps.setString(6,email);
    ps.setString(5,hostel);
    int i = ps.executeUpdate();


%>

<script>
    var j=<%=i%>;
    if(j > 0){
        alert("Updated Succesfully");
        window.location.href="userprofile.jsp";
    }
    else{
        alert('Error! Profile not updated. Please retry');
        window.location = 'userprofile.jsp';
    }
</script>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
