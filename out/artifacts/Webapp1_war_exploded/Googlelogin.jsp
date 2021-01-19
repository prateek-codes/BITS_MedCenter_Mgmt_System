<%--
  Created by IntelliJ IDEA.
  User: SeshaGopal
  Date: 11/22/2019
  Time: 6:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>GoogleLogin</title>
</head>
<body>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medcendb", "root", "");
    String ID=request.getParameter("ID");
    String Name=request.getParameter("Name");
    String Email=request.getParameter("Email");
    System.out.println(Email);
    boolean isstudent;
    boolean invalidlogin=false;
    if(request.getParameter("Who").equals("student")){
        isstudent=true;
    }else{
        isstudent=false;
    }
    if(isstudent) {
        PreparedStatement ps=con.prepareStatement("select * from user_data where email=?");
        ps.setString(1,Email);
        ResultSet rs=ps.executeQuery();
        boolean status=rs.next();
        Statement st = con.createStatement();
        if (!status) {
            int i = st.executeUpdate("insert into user_data(BITS_ID,Name,email) values('" + ID + "','" + Name + "','" + Email + "')");
        }
    }else{
        PreparedStatement ps=con.prepareStatement("select * from doctor where email=?");
        ps.setString(1,Email);
        ResultSet rs=ps.executeQuery();
        boolean status=rs.next();
        if(!status){
            invalidlogin=true;
        }
    }
%>

<script>
    var isstu =<%=isstudent%>;
    var inval =<%=invalidlogin%>
    if(!inval){
        if(isstu){
            <% session.setAttribute("email",Email);%>
            window.location.href='userprofile.jsp';
        }else{
            <% session.setAttribute("email",Email);%>
            window.location.href='profile_doc.jsp';
        }
    }else{
        alert('Invalid Credentials. Enter correct login details');
        window.location = 'FirstScreen.html';
    }

</script>
</body>
</html>
