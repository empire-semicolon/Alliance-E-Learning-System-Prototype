<html lang="en">
    <%@include file="includes/header.jsp" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="span4 offset4 well">
                            <legend>Please Sign In</legend>
                    <div class="alert alert-error">
                        <a class="close" data-dismiss="alert" href="#">�</a>Incorrect Username or Password!
                    </div>
                    <form method="POST" action="" accept-charset="UTF-8">
                        <input type="text" id="username" class="span4" name="username" placeholder="Username">
                        <input type="password" id="password" class="span4" name="password" placeholder="Password">
                        <label class="checkbox">
                            <input type="checkbox" name="remember" value="1"> Remember Me
                        </label>
                        <button type="submit" name="submit" class="btn btn-info btn-block">Sign in</button>
                    </form>    
                </div>
            </div>
        </div>
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
