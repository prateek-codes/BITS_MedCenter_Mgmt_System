<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome Doctor</title>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <title>Title</title>
</head>
<body>
<p>
    <font size="7">Welcome Doctor</font><br />
    <font size="5">Appoinments</font><br />
    <meta name="google-signin-client_id" content="817620795151-67pgs7j9dgs2vhic7kvasum7al8ffmlq.apps.googleusercontent.com">
    <div class="g-signin2" data-onsuccess="onSignIn"></div>
    <iframe id="frme" style="border: 0" width="800" height="600" frameborder="0" scrolling="no"></iframe>
</p>
<script>
    function onSignIn(){
        document.getElementById("frme").setAttribute("src","https://calendar.google.com/calendar/embed?src=bits-pilani.ac.in_ac3b8i3dcgsbhavcnjr41raaf4%40group.calendar.google.com&ctz=Asia%2FKolkata");
    }
</script>
</body>
</html>
