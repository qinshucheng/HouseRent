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
    
    <script type="text/javascript">
		function check(){
			if(document.getElementById('userName').value=='' || document.getElementById('password').value==''){
				alert('用户名或密码不能为空！');
			}else if(document.signin_form.radio[0].checked==true){
				document.signin_form.action="ulogin"
			}else if(document.signin_form.radio[1].checked==true){
				document.getElementById('userName').name = "manager";
				document.getElementById('password').name = "password";
				document.signin_form.action="managerlogin"
			}
		}
	</script>
  </head>
  <body>
	<%
	String user = (String)session.getAttribute("userName");
	String manager = (String)session.getAttribute("manager");
	if(user!=null){
		session.removeAttribute("userName");
	}
	if(manager!=null){
		session.removeAttribute("manager");
	}
	%>
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
      <form class="form-signin" name = "signin_form"  method="post" onSubmit="check()">
        <h2 class="form-signin-heading" align="center">用户登陆</h2>
        <label for="userName" >用户名</label>
        <input type="text" id="userName" name = "userName" class="form-control" placeholder="请输入账号" required autofocus>
        <label for="password" >密码</label>
        <input type="password" id="password" name = password class="form-control" placeholder="请输入密码" required>
        <div class="radio">
        <label>
        <input type="radio" name="radio" value="user" checked/> 用户
        </label>
        <label>
        <input type="radio" name="radio" value="manager" /> 管理员
        </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit" id="login" >登陆</button>
        <h1></h1>
        <h4 align="center"><a href="register_toRegister">还没账户？去注册&raquo;</a></h4>
        <h1></h1>
        <h4 align="center"><a href="showTourRoom">游客通道&raquo;</a></h4>
      </form>

    </div> <!-- /container -->
    

  </body>
</html>
