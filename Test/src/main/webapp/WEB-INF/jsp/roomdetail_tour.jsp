<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%--引入JSTL核心标签库 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>房屋租赁系统</title>

    <!-- Bootstrap core CSS -->
    <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
	<link href="js/bootstrap/css/fileinput.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="//v3.bootcss.com/examples/navbar/navbar.css" rel="stylesheet">
    <!-- Ideal Image Slider -->
    <link rel="stylesheet" href="http://www.dowebok.com/demo/173/css/ideal-image-slider.css">
	<link rel="stylesheet" href="http://www.dowebok.com/demo/173/themes/default/default.css">
    <!-- Ideal Image Slider -->
    
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>
    <script src="js/jquery/jquery-2.2.3.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/2.3.1/js/bootstrap-modal.js"></script>
    <script src="http://malsup.github.io/jquery.form.js"></script>
    
    
    
    <!-- 回复内容框 -->
    <script>
		$(function(){
		  $("#reply_box").hide();
		  $("#show_reply").click(function(){
		    $("#reply_box").toggle(1000);
		  });
	});
	</script>
	
  </head>

  <body>
  
  
	<div class="container">
    <!-- Fixed navbar -->
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
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="showUserRoomList">首页</a></li>
          </ul>
          <form class="navbar-form navbar-right" action="searchRoomByKeyword"  method="post">
            <div class="form-group">
              <input type="text" name= "keyword" placeholder="请输入关键字..." class="form-control" required>
            </div>
            <button type="submit" class="btn btn-success">搜索房屋</button>
          </form>
          <ul class="nav navbar-nav navbar-right">
            <li ><a >欢迎你，游客！</a></li>
            <li ><a href="login_toLogin">去登录 </a></li>
            <li ><a href="register_toRegister">去注册 </a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    
	
    <div id="messi" class="container">
      <!-- Main component for a primary marketing message or call to action -->
      <div class="col-md-8">
      <div class="jumbotron">
      <!-- 添加边框 -->
        <div style="border:1px solid #FFFFFF; HEIGHT: 100%; padding:15px" >
        <div align="center">
        	<h3>${roominfo.title}</h3>
        </div>
<!--         <div class="row"> -->
        
<%--         	<c:forEach var="imageName" items="${imageName}"> --%>
<!--   			<div class="col-xs-6 col-md-4"> -->
<!--     			<a class="thumbnail"> -->
<%--       				<img src="image/${imageName}" class="thumbnail" style="max-width: 150px; max-height: 130px;"> --%>
<!--     			</a> -->
<!--   			</div> -->
<%--   			</c:forEach> --%>
  			
<!-- 		</div> -->
		<!-- Ideal Image Slider -->
		<div class="dowebok">
			<div id="slider">
				<c:forEach var="imageName" items="${imageName}">
				<img src="image/${imageName}" title="标题标题" alt="文字说明文字说明文字说明">
				</c:forEach>
			</div>
		</div>
		<script src="http://www.dowebok.com/demo/173/js/ideal-image-slider.min.js"></script>
		<script src="http://www.dowebok.com/demo/173/extensions/captions/iis-captions.js"></script>
		<script>
			var slider = new IdealImageSlider.Slider('#slider');
			slider.addCaptions();
			slider.start();
		</script>
		<!-- Ideal Image Slider -->
			<div class="row">
				<div class="col-md-4">
	  				<p><span class="label label-primary">租金/月</span>${roominfo.price}</p>
	  			</div>
	  			<div class="col-md-6">
	  				<span class="label label-default">租金押付</span>${roominfo.pricetype}
	  			</div>
	        </div>
	        <div class="row">
				<div class="col-md-4">
	  				<p><span class="label label-success">房型</span>${roominfo.roomtype}</p>
	  			</div>
	  			<div class="col-md-6">
	  				<span class="label label-info">租赁方式</span>${roominfo.renttype}
	  			</div>
	        </div>
	        <div class="row">
				<div class="col-md-4">
	  				<p><span class="label label-danger">装修</span>${roominfo.fit}</p>
	  			</div>
	  			<div class="col-md-6">
	  				<span class="label label-danger">类型</span>${roominfo.roomstyle}
	  			</div>
	        </div>
	        <div class="row">
				<div class="col-md-4">
	  				<p><span class="label label-primary">面积/m^2</span>${roominfo.area}</p>
	  			</div>
	  			<div class="col-md-6">
	  				<span class="label label-info">楼层</span>${roominfo.floor}
	  			</div>
	        </div>
	        <p><span class="label label-warning">房源描述</span>${roominfo.introduct}</p>
	  		<p><span class="label label-warning">地址</span>${roominfo.location}</p>
	    </div><!-- 边框 -->
		<h1></h1>
		<p>
        <a class="btn btn-sm btn-primary" id="show_reply" role="button">回复&raquo;</a>
        </p>
		
		<div id="reply_box">
		<div style="border:1px solid #FFFFFF; HEIGHT: 100%; padding:10px">
		<h4>您还没有登陆不能发表评论，去<a href="login_toLogin">登陆</a>或者<a href="register_toRegister">注册</a>吧！</h4>
		</div>
        <ul class="media-list"  >
        	<c:forEach var="listRoom_reply" items="${listRoom_reply}" varStatus="status">
  			<li class="media" style="border-bottom:1px solid #FFFFFF; padding:15px">
    			<div class="media-left">
      				<a href="#">
        				<img  class="thumbnail" src="image/a.jpg" alt="我的头像"style="max-width: 48px; max-height: 48px;">
      				</a>
    			</div>
    			<div class="media-body">
      				<h4 class="media-heading">${status.index+1}楼：${listRoom_reply.replyer}    ${listRoom_reply.time}</h4>
      				${listRoom_reply.reply}
    			</div>
  			</li>
  			</c:forEach>
		</ul>
		
		</div>
                     
      </div>
      </div> <!-- class="col-md-9" -->
	  
	  <div class="col-md-4">
	  	<div class="jumbotron">
	  		<p>联系人信息</p>
            <p><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;${roominfo.publisher}</p>
            <p><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>&nbsp;&nbsp;${roominfo.phone}</p>
        	<p><span class="glyphicon glyphicon-dashboard" aria-hidden="true">${roominfo.time}</span></p>
        </div>
	  </div>
	  
    </div> 
	</div><!-- /container -->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    
  </body>
</html>
