<%--
  Created by IntelliJ IDEA.
  User: Prateek
  Date: 19-10-2019
  Time: 13:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Check Credencials</title>
</head>
<body>

<%
    String email=request.getParameter("email");
    String password=request.getParameter("password");
    boolean status=false;
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medcendb", "root", "");
    PreparedStatement ps=con.prepareStatement("select * from doctor where email=? and password=?");
    ps.setString(1,email);
    ps.setString(2,password);
    ResultSet rs=ps.executeQuery();
    status=rs.next();
%>
<script type="text/javascript">
    var st =<%=status%>;
    if(st){
        <% session.setAttribute("email",email);%>
        window.location.href='profile_doc.jsp';
    }else{
        alert('Invalid Credentials. Enter correct login details');
        window.location = 'doctor_login.html';
    }
</script>
</body>
</html>
