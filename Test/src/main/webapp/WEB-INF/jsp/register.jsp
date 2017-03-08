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
    <link href="js/static/signup.css" rel="stylesheet">
	<link href="js/static/navbar.css" rel="stylesheet">
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>
    
    <script type="text/javascript">
		function checkup(){
			if (document.getElementById('userName').value==''){
				alert('用户名不能为空！');
			}else if(document.getElementById('password').value==''){
				alert('密码不能为空！');
			}else if(document.getElementById('phone').value==''){
				alert('手机号不能为空！');
			}else{
				document.signup_form.action="userRegister";
			}
		}
	</script>
    
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
            <a class="navbar-brand" href="#">注册页面</a>
          </div>
        </div><!--/.container-fluid -->
      </nav>
    <div class="jumbotron">

      <form class="form-signup" name = "signup_form" action=""  method="post" onSubmit="checkup()">
        <h2 class="form-signup-heading" align="center">用户注册</h2>
        <label for="userName" >用户名</label>
        <input type="text" id="userName" name = userName class="form-control" placeholder="请输入账号" required autofocus>
        
        <label for="password" >密码</label>
        <input type="password" id="password" name = password class="form-control" placeholder="请输入密码" required>
        
        <label for="phone" >手机号码</label>
        <input type="number" id="phone" name = phone class="form-control" placeholder="请输入手机号" required>
        <p></p>
        <button class="btn btn-lg btn-primary btn-block" type="submit" id="register" >注册</button>
        <h1></h1>
        <h4 align="center"><a href="login_toLogin">有账户？去登陆&raquo;</a></h4>
        <h1></h1>
        <h4 align="center"><a href="showTourRoom">游客通道&raquo;</a></h4>
      </form>

    </div> <!-- /container -->
	</div>

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
