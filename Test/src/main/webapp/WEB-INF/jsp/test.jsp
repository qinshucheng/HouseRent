<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>房屋租赁</title>

    <!-- Bootstrap core CSS -->
    <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template  //v3.bootcss.com/examples/signin/signin.css-->
    <link href="js/static/signin.css" rel="stylesheet">
	<link href="js/static/navbar.css" rel="stylesheet">
	
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>
    
  </head>

  <body>

    <div class="container">
		
	  <!-- Static navbar -->
      <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">房屋租赁</a>
            <a class="navbar-brand" href="#">登录页面</a>
          </div>
        </div><!--/.container-fluid -->
      </nav>
      <form class="form-signin" name = "signin_form" action="ulogin"  method="post" onSubmit="check()">
        <h2 class="form-signin-heading" align="center">用户登陆</h2>
        <label for="userName" >用户名</label>
        <input type="text" id="userName" name = "userName" class="form-control" placeholder="请输入账号" required autofocus>
        <label for="password" >密码</label>
        <input type="password" id="password" name = password class="form-control" placeholder="请输入密码" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit" id="login" >登陆</button>
        <h1></h1>
        <h1></h1>
      </form>

    </div> <!-- /container -->
    

  </body>
</html>
