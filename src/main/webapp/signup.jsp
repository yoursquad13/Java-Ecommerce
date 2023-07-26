<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SignUp</title>
</head>
<body>
<h1>Sign Up</h1>
<form action="signup" method="post" enctype='multipart/form-data'>
  Login: <label>
  <input type="text" name="login"/>
</label> <br>
  Password: <label>
  <input type="text" name="password"/>
</label> <br>
  Full Name: <label>
  <input type="text" name="fullname">
</label>
  Email: <label>
  <input type="text" name="email">
</label>
  <label> <br>
    <input type="file" name="file" alt="image">
  </label> <br>
  <input type="submit">
</form>
</body>
</html>
