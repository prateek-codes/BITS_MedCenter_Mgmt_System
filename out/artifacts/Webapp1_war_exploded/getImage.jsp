<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 11/12/2019
  Time: 6:15 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%
    String email=request.getParameter("email");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medcendb", "root", "");
ResultSet rs = null;
PreparedStatement pstmt = null;
OutputStream oImage;
try {
pstmt = con.prepareStatement("select photo from user_data where email=?");
pstmt.setString(1,email);
rs = pstmt.executeQuery();
if(rs.next()) {
byte[] barray = rs.getBytes("photo");
response.setContentType("image/gif");
oImage=response.getOutputStream();
oImage.write(barray);
oImage.flush();
oImage.close();
}
}
catch(Exception ex){
ex.printStackTrace();
}finally {
try{
if(con!=null)
con.close();
}catch(Exception ex){
    ex.printStackTrace();
}
}
%>