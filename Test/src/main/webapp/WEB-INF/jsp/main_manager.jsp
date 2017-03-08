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

    <title>房屋租赁</title>

    <!-- Bootstrap core CSS -->
    <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="js/static/navbar.css" rel="stylesheet">

    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>
    <script src="js/jquery/jquery-2.2.3.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/2.3.1/js/bootstrap-modal.js"></script>
    <script src="http://malsup.github.io/jquery.form.js"></script>
	
	<!-- 弹出发布消息框 -->
	<script>
	  $(function(){
	    $("#openSysModal").click(function(){
	      $("#publish_sysinfo_modal").modal("toggle");
	    });
	  });
	</script>
	<script type="text/javascript">
		function checkinfo(){
			if (document.getElementById('systominfo').value==''){
				alert('消息不能为空！');
			}else if(document.getElementById('systominfo').value!=''){
				document.publish_sysinfo_form.action="publish_sysinfo";
			}
		}
	</script>
  </head>

  <body>
  
 	<!-- 发布系统消息窗口 -->
  <div class="modal" id="publish_sysinfo_modal">
	    <div class="modal-dialog">
	    
	        <div class="modal-content">
	        	<form class="form-update" name = "publish_sysinfo_form" action=""  method="post" onSubmit="checkinfo()">
	            <div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
					<h3 class="modal-title" align="center" >发布系统消息</h3>
				</div>
				<div class="modal-body">
						  <label for="systominfo" >请输入消息</label>
						  <input type="text" class="form-control" name = "systominfo" id="systominfo"  placeholder="请输入消息"  required autofocus>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-primary">发布</button>
				</div>
				</form>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

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
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li ><a href="showUserRoomList">首页</a></li>
              <li class="active"><a href="#">管理员主页</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <% String name;
          	if((String)session.getAttribute("userName")!=null){
          		name = "用户"+(String)session.getAttribute("userName");
          	}else{
          		name = "管理员"+(String)session.getAttribute("manager");
          	}
          %>
            <li ><a >欢迎你，<%=name%>！</a></li>
              <li><a href="logout">注销登录 </a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>

      <!-- Main component for a primary marketing message or call to action -->
      <div class="row">
        <div class="col-md-3" align="center" style="border:1px solid #987cb9; border-radius:5px; padding-top:1px;padding-bottom:20px">
      		<div onmouseover="this.style.backgroundColor='#F4F9FD'" onmouseout="this.style.backgroundColor='#FFFFFF'" style="border-bottom:1px dashed #987cb9; padding:15px"><a href="">管理帖子</a></div>
      		<div onmouseover="this.style.backgroundColor='#F4F9FD'" onmouseout="this.style.backgroundColor='#FFFFFF'" style="border-bottom:1px dashed #987cb9; padding:15px"><a href="">管理用户</a></div>
        	<div onmouseover="this.style.backgroundColor='#F4F9FD'" onmouseout="this.style.backgroundColor='#FFFFFF'" style="padding:15px"><a id="openSysModal" href="#">发布系统消息</a></div>
        </div>
        <div class="col-md-9">
        	<div>
	        	<table class="table table-hover">
	        	<tr class="success">
	        		<td>##</td>
	        		<td>帖子名</td>
	        		<td>发布者</td>
	        		<td>发布时间</td>
	        		<td></td>
	        	</tr>
	        	<c:forEach var="room" items="${roomList}" varStatus="status">
	        		<tr>
	        			<td>${status.index+1}</td>
	        			<td><a href="showUserRoomDetail?room_id=${room.id}">${room.title}</a></td>
	        			<td>${room.user}</td>
	        			<td>${room.time}</td>
	        			<td><a href="deleteRoominfo?room_id=${room.id}">删帖</a></td>
	        		</tr>
	        	</c:forEach>
	        	</table>
        	</div>
        	<div>
        		<table class="table table-hover">
        		<tr class="success">
	        		<td>##</td>
	        		<td>用户名</td>
	        		<td>联系方式</td>
	        		<td></td>
	        	</tr>
	        	<c:forEach var="user" items="${userList}" varStatus="sta">
	        		<tr>
	        			<td>${sta.index+1}</td>
	        			<td>${user.userName}</td>
	        			<td>${user.phone}</td>
	        			<td><a href="deleteUser?user_id=${user.id}">删除用户</a></td>
	        		</tr>
	        	</c:forEach>
	        	</table>
        	</div>
        	<div>
        		<table class="table table-hover">
        		<tr class="success">
	        		<td>##</td>
	        		<td>系统信息</td>
	        		<td></td>
	        	</tr>
	        	<c:forEach var="sysinfo" items="${sysinfos}" varStatus="sta">
	        		<tr>
	        			<td>${sta.index+1}</td>
	        			<td>${sysinfo.systominfo}</td>
	        			<td><a href="deleteSysinfo?sysinfo_id=${sysinfo.id}">删除消息</a></td>
	        		</tr>
	        	</c:forEach>
	        	</table>
        	</div>
        	
        </div>
      </div>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
