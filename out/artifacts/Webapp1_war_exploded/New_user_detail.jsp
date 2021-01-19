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
    <title>New User Detail</title>
</head>
<body>
<% int i;
    try {
        String Name = request.getParameter("Name");
        String Email = request.getParameter("Email");
        String Hostel = request.getParameter("Hostel");
        String Mobile_No = request.getParameter("Mobile_No");
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");
        String password = request.getParameter("Password");
        String BITS_ID = request.getParameter("BITS_Id");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medcendb",
                "root", "");
        Statement st = con.createStatement();

        i = st.executeUpdate("insert into user_data(BITS_ID,Name,gender,age,contact,email,hostel,password) values('" + BITS_ID + "','" + Name + "','" + gender + "','" + age + "','" + Mobile_No + "','" + Email + "','" + Hostel + "','" + password + "')");
    }
    catch(Exception e){
        i=0;
    }
%>
<script>
    var j=<%=i%>;


    if(j > 0){
        window.location.href="login.jsp";
    }
    else{
        alert('Enter correct details');
        window.location = 'New_User.html';
    }
</script>

</body>
</html>
