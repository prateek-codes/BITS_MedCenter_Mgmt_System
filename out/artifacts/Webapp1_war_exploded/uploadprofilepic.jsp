<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import="javax.servlet.annotation.WebServlet" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert an Image into MySQL Database</title>
</head>
<body>
<h1>Insert an Image into MySQL Database!</h1>
<%
    int count=0;
    String email=request.getParameter("email");
    String myloc=request.getParameter("myimg");
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String url = "jdbc:mysql://localhost:3306/medcendb";//Here the "test" is the Database name
    FileInputStream fis = null;
    File file ;
    System.out.println("Path:"+myloc);
    System.out.println("email:"+email);
    int maxFileSize = 5000 * 1024;
    int maxMemSize = 5000 * 1024;
    ServletContext context = pageContext.getServletContext();
    String filePath = context.getInitParameter("file-upload");
    // Verify the content type
    String contentType = request.getContentType();


        DiskFileItemFactory factory = new DiskFileItemFactory();
        // maximum size that will be stored in memory
        factory.setSizeThreshold(maxMemSize);

        // Location to save data that is larger than maxMemSize.
        factory.setRepository(new File("c:\\temp"));

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // maximum file size to be uploaded.
        upload.setSizeMax( maxFileSize );

        try {
            // Parse the request to get file items.
            List fileItems = upload.parseRequest(request);

            // Process the uploaded file items
            Iterator i = fileItems.iterator();
            List<FileItem> uploadItems = upload.parseRequest(request);
            for(FileItem uploadItem : uploadItems)
            {
                if(uploadItem.isFormField())
                {
                    String fieldName = uploadItem.getFieldName();
                    email = uploadItem.getString();
                }
            }

            while ( i.hasNext () ) {
                FileItem fi = (FileItem)i.next();
                if ( !fi.isFormField () ) {
                    // Get the uploaded file parameters
                    String fieldName = fi.getFieldName();
                     String fileName = fi.getName();
                     myloc=fileName;
                    boolean isInMemory = fi.isInMemory();
                    long sizeInBytes = fi.getSize();

                    // Write the file
                    if( fileName.lastIndexOf("\\") >= 0 ) {
                        file = new File( filePath +
                                fileName.substring( fileName.lastIndexOf("\\"))) ;
                    } else {
                        file = new File( filePath +
                                fileName.substring(fileName.lastIndexOf("\\")+1)) ;
                    }
                    fi.write( file ) ;
                    out.println("Uploaded Filename: " + filePath +
                            fileName + "<br>");
                }
            }
        } catch(Exception ex) {
            System.out.println(ex);
        }

        %>
<%


    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection(url, "root", "");
        File image = new File(filePath+myloc);
        System.out.println("filename:"+myloc);
        System.out.println("email:"+email);
        pstmt = conn.prepareStatement("update user_data set photo =? where email=?");
        pstmt.setString(2, email);
        fis = new FileInputStream(image);
        pstmt.setBinaryStream(1, (InputStream) fis, (int) (image.length()));

        count = pstmt.executeUpdate();
        if (count > 0) {
            System.out.println("The image has been inserted successfully");
        } else {
            System.out.println("The image did not insert successfully");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    } finally {
        try {
            if (rs != null) {
                rs.close();
                rs = null;
            }
            if (pstmt != null) {
                pstmt.close();
                pstmt = null;
            }
            if (conn != null) {
                conn.close();
                conn = null;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

%>
<script type="text/javascript">
    var st =<%=count%>;
    if(st){

        window.location.href='userprofile.jsp';
    }else{
        alert('Please select another Image');
        window.location = 'userprofile.jsp';
    }
</script>
</body>
</html>
Post to Facebook
Post to Twitter
Add to LinkedIn
Post to Google+
Send via Shareaholic Mail
Post to Delicious
Post to Digg
Post to Blogger
Add to DZone
Add to Reddit
