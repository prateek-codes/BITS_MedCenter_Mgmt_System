<%--
  Created by IntelliJ IDEA.
  User: Vibhor
  Date: 12-11-2019
  Time: 19:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%int i;
    try {
        String case_id=request.getParameter("case_id");
        String date=request.getParameter("date");
        String valid_till=request.getParameter("valid_till");
        String email = request.getParameter("email");
        String synopsis= request.getParameter("synopsis");
        String prescription = request.getParameter("prescription");

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medcendb",
                "root", "");
        PreparedStatement ps = con.prepareStatement("insert into medhistory(case_no, date, valid_till, bits_email, synopsis, prescription) values(?,?,?,?,?,?)");


        ps.setString(1,case_id);
        ps.setString(2,date);
        ps.setString(3,valid_till);
        ps.setString(4,email);
        ps.setString(5,synopsis);
        ps.setString(6,prescription);
        i = ps.executeUpdate();

    }
    catch(Exception e){
        i=0;
    }
%>
<script>
    var j=<%=i%>;
    if(j > 0){
        alert("Successfully added Doctor");
        window.location.href="profile_doc.jsp";
    }
    else{
        alert('Enter correct details');
        window.location.href="profile_doc.jsp";

    }
</script>
</body>
</html>
