<%--
  Created by IntelliJ IDEA.
  User: Shubham
  Date: 20-10-2019
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>New Doctor Detail</title>
</head>
<body>
<%int i;
    try {
    String Name=request.getParameter("Name");
    String gender=request.getParameter("gender");
    String Email=request.getParameter("Email");
    String Specialization = request.getParameter("Specialization");
    String Experience= request.getParameter("Experience");
    String Password = request.getParameter("Password");
    String Mobile_No = request.getParameter("Mobile_No");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medcendb",
            "root", "");
    Statement st = con.createStatement();

     i = st.executeUpdate("insert into doctor(name, gender, experience, specialization, contact, email, password) values('"+Name+"','"+gender+"','"+Experience+"','"+Specialization+"','"+Mobile_No+"','"+Email+"','"+Password+"')");

    }
    catch(Exception e){
        i=0;
    }
%>
<script>
    var j=<%=i%>;
    if(j > 0){
       alert("Successfully added Doctor");
        window.location.href="adminprofile.jsp";
    }
    else{
        alert('Enter correct details');
        window.location = 'adminprofile.jsp';
    }
</script>
</body>
</html>
