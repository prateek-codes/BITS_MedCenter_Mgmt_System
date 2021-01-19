<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Login Form</title>
    <LINK REL=StyleSheet HREF="style.css" TYPE="text/css" MEDIA=screen>
    <meta name="robots" content="noindex,follow" />
</head>
<body>
<div class="container">
    <div class="login">
        <h1>Login to BITS MedC App</h1>
        <form method="post" action="LoginCheck.jsp">
            <p><input type="text" name="email" value="" placeholder="Email"></p>
            <p><input type="password" name="password" value="" placeholder="Password"></p>
            <p class="remember_me">
                <label>
                    <input type="checkbox" name="remember_me" id="remember_me">
                    Remember me on this computer
                </label>
            </p>
            <p class="submit"><input type="submit" name="commit" value="Login"></p>
        </form>
    </div>

    <div class="login-help">
        <p>New User? <a href="New_User.html">Click here to register it</a>.</p>
    </div>
</div>
</body>
</html>
