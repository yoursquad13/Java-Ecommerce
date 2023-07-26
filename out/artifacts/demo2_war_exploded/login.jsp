<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Login Page | Saree Nepal</title>
  <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Raleway'>
  <link rel='stylesheet' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
  <style>
    html, body {
      padding: 0px;
      margin: 0px;
      background: #d5dfed;
      font-family: "Raleway", sans-serif;
      color: #FFF;
      height: 100%;
    }

    .container {
      min-height: 300px;
      max-width: 450px;
      margin: 40px auto;
      background: #FFF;
      border-radius: 2px;
      box-shadow: 0px 2px 3px rgba(0, 0, 0, 0.2);
      display: flex;
      flex-direction: column;
      overflow: hidden;
      -webkit-animation: hi 0.5s;
      animation: hi 0.5s;
      -webkit-transform: translateZ(0px);
    }
    .container * {
      box-sizing: border-box;
    }
    .pages {
      flex: 1;
      white-space: nowrap;
      position: relative;
      transition: all 0.4s;
      display: flex;
    }
    .pages .page {
      min-width: 100%;
      padding: 20px 15px;
      padding-top: 0px;
      background: linear-gradient(to left, #955DFF, #6FAAFF);
    }
    .pages .page:nth-of-type(1) .input {
      transform: translateX(-100%) scale(0.5);
    }
    .pages .page:nth-of-type(2) .input {
      transform: translateX(100%) scale(0.5);
    }
    .pages .page .input {
      transition: all 1s;
      opacity: 0;
      transition-delay: 0s;
    }
    .pages .page.signup {
      background: linear-gradient(to left, #6FAAFF, #955DFF);
    }
    .pages .page .title {
      margin-bottom: 10px;
      font-size: 14px;
      position: relative;
      line-height: 14px;
    }
    .pages .page .title i {
      vertical-align: text-bottom;
      font-size: 19px;
    }
    .pages .page .input {
      margin-top: 20px;
    }
    .pages .page input.text, select {
      background: #F6F7F9;
      border: none;
      border-radius: 4px;
      width: 100%;
      height: 40px;
      line-height: 40px;
      padding: 0px 10px;
      color: rgba(0, 0, 0, 0.5);
      outline: none;
    }
    .pages .page input[type=submit] {
      background: rgba(0, 0, 0, 0.5);
      color: #F6F7F9;
      height: 40px;
      line-height: 40px;
      width: 100%;
      border: none;
      border-radius: 4px;
      font-weight: 600;
    }
    .tabs {
      max-height: 50px;
      height: 50px;
      display: flex;
      background: #FFF;
    }
    .tabs .tab {
      flex: 1;
      color: #5D708A;
      text-align: center;
      line-height: 50px;
      transition: all 0.2s;
    }
    .tabs .tab .text {
      font-size: 14px;
      transform: scale(1);
      transition: all 0.2s;
    }
    input[type=radio] {
      display: none;
    }
    input[type="submit"]:hover {
      cursor: pointer;
      transition: 0.4s;
      transform: scale(1.01);
      box-shadow: 2px 2px 7px #513d3dad;
    }
    input[type=radio]:nth-of-type(1):checked ~ .tabs .tab:nth-of-type(1) {
      box-shadow: inset -3px 2px 5px rgba(0, 0, 0, 0.25);
      color: #3F4C7F;
    }
    input[type=radio]:nth-of-type(1):checked ~ .tabs .tab:nth-of-type(1) .text {
      transform: scale(0.9);
    }
    input[type=radio]:nth-of-type(1):checked ~ .pages {
      transform: translateX(0%);
    }
    input[type=radio]:nth-of-type(1):checked ~ .pages .page:nth-of-type(1) .input {
      opacity: 1;
      transform: translateX(0%);
      transition: all 0.5s;
    }
    input[type=radio]:nth-of-type(1):checked ~ .pages .page:nth-of-type(1) .input:nth-child(1) {
      transition-delay: 0.2s;
    }
    input[type=radio]:nth-of-type(1):checked ~ .pages .page:nth-of-type(1) .input:nth-child(2) {
      transition-delay: 0.4s;
    }
    input[type=radio]:nth-of-type(1):checked ~ .pages .page:nth-of-type(1) .input:nth-child(3) {
      transition-delay: 0.6s;
    }
    input[type=radio]:nth-of-type(1):checked ~ .pages .page:nth-of-type(1) .input:nth-child(4) {
      transition-delay: 0.8s;
    }
    input[type=radio]:nth-of-type(1):checked ~ .pages .page:nth-of-type(1) .input:nth-child(5) {
      transition-delay: 1s;
    }
    input[type=radio]:nth-of-type(2):checked ~ .tabs .tab:nth-of-type(2) {
      box-shadow: inset 3px 2px 5px rgba(0, 0, 0, 0.25);
      color: #3F4C7F;
    }
    input[type=radio]:nth-of-type(2):checked ~ .tabs .tab:nth-of-type(2) .text {
      transform: scale(0.9);
    }
    input[type=radio]:nth-of-type(2):checked ~ .pages {
      transform: translateX(-100%);
    }
    input[type=radio]:nth-of-type(2):checked ~ .pages .page:nth-of-type(2) .input {
      opacity: 1;
      transform: translateX(0%);
      transition: all 0.5s;
    }
    input[type=radio]:nth-of-type(2):checked ~ .pages .page:nth-of-type(2) .input:nth-child(1) {
      transition-delay: 0.2s;
    }
    input[type=radio]:nth-of-type(2):checked ~ .pages .page:nth-of-type(2) .input:nth-child(2) {
      transition-delay: 0.4s;
    }
    input[type=radio]:nth-of-type(2):checked ~ .pages .page:nth-of-type(2) .input:nth-child(3) {
      transition-delay: 0.6s;
    }
    input[type=radio]:nth-of-type(2):checked ~ .pages .page:nth-of-type(2) .input:nth-child(4) {
      transition-delay: 0.8s;
    }
    input[type=radio]:nth-of-type(2):checked ~ .pages .page:nth-of-type(2) .input:nth-child(5) {
      transition-delay: 1s;
    }
    @-webkit-keyframes hi {
      from {
        transform: translateY(50%) scale(0, 0);
        opacity: 0;
      }
    }
    .page {
      display: flex;
      flex-direction: column;
      justify-content: center;
    }
    input.text:focus {
      box-shadow: 2px 2px 9px #00000063;
    }
    .text:hover {
      transition: 0.4s;
      cursor: pointer;
      background: #dadada;
    }
    @keyframes hi {
      from {
        transform: translateY(50%) scale(0, 0);
        opacity: 0;
      }
    }
    .msg {
      margin-bottom: 10px;
      margin: auto;
      width: 450px;
      top: 10px;
      height: fit-content;
    }
    .msg span{
      padding: 10px;display: block;border-radius: 10px;
    }
    .msg span.error{
      background: #ffc3c3;
      border: solid 1px red;
      color: red;
    }
    .msg span.success{
      background: #d0ffd0;
      border: solid 1px green;
      color: green;
    }

  </style>

</head>
<body>
<div style="text-align: center;margin-top: 20px;"><img src="images/logo-l.png" alt="SareeNepal" style="width:450px"></div>
<div class="msg"></div>
<div class="container">
  <div class="tabs">
    <label class="tab" for="signin" style="border-right:solid 1px #708198">
      <div class="text">Sign In</div>
    </label>
    <label class="tab" for="register">
      <div class="text">Register</div>
    </label>
  </div>
  <input type="radio" name="tab" id="signin" checked="checked"/>
  <input type="radio" name="tab" id="register"/>
  <div class="pages">
    <form method="post" action="login" class="page">
      <div style="margin-top:-100px;text-align:center">
        <h3>Login to your account</h3>
        To start buying from SareeNepal, Login to your account.<br>If you don't have an account you can create your account <br>anytime for free.
      </div>
      <div class="input">
        <div class="title"><i class="material-icons">account_box</i> USERNAME</div>
        <input name="login" class="text" type="text" required/>
      </div><br>
      <div class="input">
        <div class="title"><i class="material-icons">lock</i> PASSWORD</div>
        <input name="password" class="text" type="password" required/>
      </div>
      <div class="input">
        <a href="#" style="color: white;font-weight: bolder;float: right;margin-right:20px" onclick="alert('Contact admin: info@anishkhatri.com\nto change your password.')"><div class="title"><i class="material-icons">lock</i> FORGOT PASSWORD?</div></a>
      </div>
      <div class="input">
        <input type="submit" value="LOGIN"/>
      </div>
    </form>
    <form method="post" action="signup" class="page signup" enctype='multipart/form-data'>
      <h3 style="text-align: center;margin-bottom: 4px;">Register for an account</h3><p style="margin-top: 0;text-align: center">Fill up all the fields to create account.</p>
      <div class="input">
        <div class="title"><i class="material-icons">person</i> FULL NAME</div>
        <input name="fullname" class="text" type="text" required/>
      </div>
      <div class="input">
        <div class="title"><i class="material-icons">mail</i> EMAIL</div>
        <input name="email" class="text" type="email" required/>
      </div>
      <div class="input">
        <div class="title"><i class="material-icons">account_box</i> USERNAME</div>
        <input name="login" class="text" type="text" required/>
      </div>
      <div class="input">
        <div class="title"><i class="material-icons">lock</i> PASSWORD</div>
        <input name="password" class="text" type="password" required/>
      </div>
      <div class="input">
        <div class="title"><i class="material-icons">image</i> PROFILE PICTURE</div>
        <input name="file" class="text" type="file" accept="image/*" required/>
      </div>
      <div class="input">
        <input type="submit" value="CREATE ACCOUNT"/>
      </div>
    </form>
  </div>
  <a href="./"> <div class="input">
    <input type="submit" value="BACK TO HOME" style="HEIGHT: 50px;width: 100%;margin-top: 7px;background: #46377f;color: #fff;border: 0;border-radius: 5px;">
  </div></a>
</div>
<script>
  var signin = document.querySelector('#signin')
  var register = document.querySelector('#register')
  setTimeout(function(){ register.checked = true}, 1000)
  setTimeout(function(){ signin.checked = true}, 2000)
</script>
<script>
  const urlParams = new URLSearchParams(window.location.search);
  const message = urlParams.get('msg');
  const type = urlParams.get('type');
  const msgDiv = document.querySelector('.msg');

  if(message != null) {
    msgDiv.innerHTML = '<span class="' + type + '">' + message + '</span>';
  }
</script>
</body>
</html>
