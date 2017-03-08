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
    
    <!--  -->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>
    <script src="js/jquery/jquery-2.2.3.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/2.3.1/js/bootstrap-modal.js"></script>
    <script src="http://malsup.github.io/jquery.form.js"></script>
    
	<!-- 弹出发布框 -->
	<script>
	    $(function(){
	        $("#publish").click(function(){
	            $("#mymodal").modal("toggle");
	        });
	    });
	</script>
	<script>
	    $(function(){
	    	$("#publish").hide();
	    });
	</script>
	<!-- 当管理员登录时，不显示发布房屋信息按钮 TODO-->
 	<!-- 
 	<script>
 		$(function(){			
 			var manager = '<%=(String)session.getAttribute("manager")%>';
 			var user = '<%=(String)session.getAttribute("userName")%>';
 			alert('user='+user+'\n'+'manager:'+manager);
 			if(user!="undefined"&&user!=null){
 				alert("11111");
 				$("#publish").toggle(500);
 			}
 			if(manager!="undefined"&&manager!=null){
 				alert("22222");
 				$("#publish").hide();
 			}
 		});
 	</script>
 	-->
	<script>
		$(function(){
			var $roomtyperadio  = $("input[name=roomtype]");
			var $renttyperadio  = $("input[name=renttype]");
			var $fitradio       = $("input[name=fit]");
			var $roomstyleradio = $("input[name=roomstyle]");
		    $("#remove_roomtype").click(function(){
		    	$roomtyperadio.removeAttr("checked"); 
		    });
		    $("#remove_renttype").click(function(){
		    	$renttyperadio.removeAttr("checked"); 
		    });
		    $("#remove_fit").click(function(){
		    	$fitradio.removeAttr("checked"); 
		    });
		    $("#remove_roomstyle").click(function(){
		    	$roomstyleradio.removeAttr("checked"); 
		    });
		  });
	</script>
	
	<!-- 单张上传图片  单选框输入判断 -->
	<script type="text/javascript">
		function choose(){
			if(document.publish_form.pricetype[0].checked==true){
				document.getElementByName('pricetype').value = "押一付一";
			}
			else if(document.publish_form.pricetype[1].checked==true){
				document.getElementByName('pricetype').value = "押一付二";
			}
			else if(document.publish_form.pricetype[2].checked==true){
				document.getElementByName('pricetype').value = "押一付三";
			}else{
				document.getElementByName('pricetype').value = null;
			}
			
			if(document.publish_form.roomtype[0].checked==true){
				document.getElementByName('roomtype').value = "一室一厅";
			}
			else if(document.publish_form.roomtype[1].checked==true){
				document.getElementByName('roomtype').value = "一室二厅";
			}
			else if(document.publish_form.roomtype[2].checked==true){
				document.getElementByName('roomtype').value = "一室三厅";
			}else{
				document.getElementByName('roomtype').value = null;
			}
			
			if(document.publish_form.renttype[0].checked==true){
				document.getElementByName('renttype').value = "整租";
			}else if(document.publish_form.renttype[1].checked==true){
				document.getElementByName('renttype').value = "合租";
			}else{
				document.getElementByName('renttype').value = null;
			}
			
			if(document.publish_form.fit[0].checked==true){
				document.getElementByName('fit').value = "精装";
			}
			else if(document.publish_form.fit[1].checked==true){
				document.getElementByName('fit').value = "简装";
			}
			else if(document.publish_form.fit[2].checked==true){
				document.getElementByName('fit').value = "毛坯";
			}else{
				document.getElementByName('fit').value = null;
			}
			
			if(document.publish_form.roomstyle[0].checked==true){
				document.getElementByName('roomstyle').value = "别墅";
			}
			else if(document.publish_form.roomstyle[1].checked==true){
				document.getElementByName('roomstyle').value = "普通住宅";
			}
			else if(document.publish_form.roomstyle[2].checked==true){
				document.getElementByName('roomstyle').value = "学区房";
			}else{
				document.getElementByName('roomstyle').value = null;
			}
			
// 			if (document.getElementById('title').value==''){
// 				Alert('标题不能为空！');
// 			}else if(document.getElementById('price').value==''){
// 				alert('租金不能为空！');
// 			}else if(document.getElementById('location').value==''){
// 				alert('地址不能为空！');
// 			}else if(document.getElementById('area').value==''){
// 				alert('面积不能为空！');
// 			}else if(document.getElementById('floor').value==''){
// 				alert('楼层不能为空！');
// 			}else if(document.getElementById('introduct').value==''){
// 				alert('房源描述不能为空！');
// 			}else if(document.getElementById('publisher').value==''){
// 				alert('发布者不能为空！');
// 			}else if(document.getElementById('phone').value==''){
// 				alert('手机号不能为空！');
// 			}else{
// 				document.publish_form.action="publishRoom";
// 			}
			document.publish_form.action="publishRoom";
		}
	</script>
	<script type="text/javascript">
		function chooseMuti(){
			
			if(document.search_form.roomtype[0].checked==true){
				document.getElementByName('roomtype').value = "一室一厅";
			}
			else if(document.search_form.roomtype[1].checked==true){
				document.getElementByName('roomtype').value = "一室二厅";
			}
			else if(document.search_form.roomtype[2].checked==true){
				document.getElementByName('roomtype').value = "一室三厅";
			}else if(document.search_form.roomtype[0].checked==false&&document.search_form.roomtype[1].checked==false&&document.search_form.roomtype[2].checked==false){
				document.getElementByName('roomtype').value = "A";
			}
			
			if(document.search_form.renttype[0].checked==true){
				document.getElementByName('renttype').value = "整租";
			}else if(document.search_form.renttype[1].checked==true){
				document.getElementByName('renttype').value = "合租";
			}else if(document.search_form.renttype[0].checked==false&&document.search_form.renttype[1].checked==false&&document.search_form.renttype[2].checked==false){
				document.getElementByName('renttype').value = "B";
			}
			
			if(document.search_form.fit[0].checked==true){
				document.getElementByName('fit').value = "精装";
			}
			else if(document.search_form.fit[1].checked==true){
				document.getElementByName('fit').value = "简装";
			}
			else if(document.search_form.fit[2].checked==true){
				document.getElementByName('fit').value = "毛坯";
			}else if(document.search_form.fit[0].checked==false&&document.search_form.fit[1].checked==false&&document.search_form.fit[2].checked==false){
				document.getElementByName('fit').value = "C";
			}
			
			if(document.search_form.roomstyle[0].checked==true){
				document.getElementByName('roomstyle').value = "别墅";
			}
			else if(document.search_form.roomstyle[1].checked==true){
				document.getElementByName('roomstyle').value = "普通住宅";
			}
			else if(document.search_form.roomstyle[2].checked==true){
				document.getElementByName('roomstyle').value = "学区房";
			}else if(document.search_form.roomstyle[0].checked==false&&document.search_form.roomstyle[1].checked==false&&document.search_form.roomstyle[2].checked==false){
				document.getElementByName('roomstyle').value = "D";
			}
		}
	</script>
	
  </head>

  <body>
  
  <!-- 发布帖子窗口 -->
  <div class="modal" id="mymodal">
	    <div class="modal-dialog">
	    
	        <div class="modal-content">
	        	<form class="form-publish" name = "publish_form" action="publishRoom"  method="post" enctype="multipart/form-data" onSubmit="choose()">
	            <div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
					<h3 class="modal-title" align="center" >发布租房信息</h3>
				</div>
				<div class="modal-body">
				        <div class="input-group input-group-lg">
						  <span class="input-group-addon" id="sizing-addon1">标题</span>
						  <input type="text" class="form-control" id="title" name = "title" placeholder="请输入标题" aria-describedby="sizing-addon1" required autofocus>
						</div>
						<div class="input-group input-group-lg">
						  <span class="input-group-addon" id="sizing-addon1">租金/月</span>
						  <input type="text" class="form-control" id="price" name = "price" placeholder="请输入租金" aria-describedby="sizing-addon1" required>
						</div>
						<div class="radio">
					        <label>
					        <input type="radio" name="pricetype" value="押一付一" checked/> 押一付一
					        </label>
					        <label>
					        <input type="radio" name="pricetype" value="押一付二" /> 押一付二
					        </label>
					        <label>
					        <input type="radio" name="pricetype" value="押一付三" /> 押一付三
					        </label>
				        </div>
				        <div class="radio">
					        <label>
					        <input type="radio" name="roomtype" value="一室一厅" checked/> 一室一厅
					        </label>
					        <label>
					        <input type="radio" name="roomtype" value="一室二厅" /> 一室二厅
					        </label>
					        <label>
					        <input type="radio" name="roomtype" value="一室三厅" /> 一室三厅
					        </label>
				        </div>
				        <div class="radio">
					        <label>
					        <input type="radio" name="renttype" value="整租" checked/> 整租
					        </label>
					        <label>
					        <input type="radio" name="renttype" value="合租" /> 合租
					        </label>
				        </div>
				        <div class="input-group input-group-lg">
						  <span class="input-group-addon" id="sizing-addon1">位置</span>
						  <input type="text" class="form-control" id="location" name="location" placeholder="请输入地址" aria-describedby="sizing-addon1" required>
						</div>
						<div class="radio">
					        <label>
					        <input type="radio" name="fit" value="精装" checked/> 精装
					        </label>
					        <label>
					        <input type="radio" name="fit" value="简装" /> 简装
					        </label>
					        <label>
					        <input type="radio" name="fit" value="毛坯" /> 毛坯
					        </label>
				        </div>
				        <div class="input-group input-group-lg">
						  <span class="input-group-addon" id="sizing-addon1">面积/m^2</span>
						  <input type="number" class="form-control" id="area" name="area" placeholder="请输入面积" aria-describedby="sizing-addon1" required>
						</div>
						<div class="input-group input-group-lg">
						  <span class="input-group-addon" id="sizing-addon1">楼层</span>
						  <input type="text" class="form-control" id="floor" name="floor" placeholder="请输入楼层" aria-describedby="sizing-addon1" required>
						</div>
						<div class="radio">
					        <label>
					        <input type="radio" name="roomstyle" value="别墅" checked/> 别墅
					        </label>
					        <label>
					        <input type="radio" name="roomstyle" value="普通住宅" /> 普通住宅
					        </label>
					        <label>
					        <input type="radio" name="roomstyle" value="学区房" /> 学区房
					        </label>
				        </div>
				        <div class="input-group input-group-lg">
						  <span class="input-group-addon" id="sizing-addon1">房源描述</span>
						  <input type="text" class="form-control" id="introduct" name="introduct" placeholder="请输入房源描述" aria-describedby="sizing-addon1" required>
						</div>
						<h1></h1>
						<h5>上传房屋图片</h5>
				        <div class="row ">
				            <div style="padding:10px; ">
				                    <input id="file-0a" class="file" name="file" type="file" multiple data-min-file-count="1" data-allowed-file-extensions='["jpg", "png"]'  data-show-upload="false">
				                    <br>
				            </div>
				        </div>
						<div class="input-group input-group-lg">
						  <span class="input-group-addon" id="sizing-addon1">发布者</span>
						  <input type="text" class="form-control" id="publisher" name="publisher" placeholder="请输入发布者" aria-describedby="sizing-addon1" required>
						</div>
						<div class="input-group input-group-lg">
						  <span class="input-group-addon" id="sizing-addon1">手机号码</span>
						  <input type="number" class="form-control" id="phone" name="phone" placeholder="请输入手机号码" aria-describedby="sizing-addon1" required>
						</div>
<!-- 						<div> -->
<!-- 							<button type="button" class="btn btn-default">上传图片</button> -->
<!-- 						</div> -->
						
			      
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
            <li class="active"><a href="#">首页</a></li>
            <li ><a href="showMyRoomList">我的主页</a></li>
            <li ><a id="publish" href="#">发布房屋信息</a></li>
          </ul>
          <form class="navbar-form navbar-right" action="searchRoomByKeyword"  method="post">
            <div class="form-group">
              <input type="text" name= "keyword" placeholder="请输入关键字..." class="form-control" required>
            </div>
            <button type="submit" class="btn btn-success">搜索房屋</button>
          </form>
          <ul class="nav navbar-nav navbar-right">
          <% String name;
          	if((String)session.getAttribute("userName")!=null){
          		name = "用户"+(String)session.getAttribute("userName");
          	}else{
          		name = "管理员"+(String)session.getAttribute("manager");
          	}
          %>
            <li ><a >欢迎你，<%=name%>！</a></li>
            <li ><a href="logout">注销登录 </a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    
	
    <div id="messi" class="container">
    	
    	<h5>
			<span class="glyphicon glyphicon-volume-up" aria-hidden="true">
			<c:forEach var="sysinfo" items="${sysinfos}">
			    	<mark>${sysinfo.systominfo}</mark>
			    </c:forEach>
			</span>
		</h5>
    	
    	<!-- 多条件选择框 -->
    	<div style="border:1px solid #987cb9; border-radius:5px; padding-left:20px;padding-top:20px;padding-right:20px;padding-bottom:0px" >
    		<form class="form-search" name = "search_form" action="searchRoomByMuti"  method="post" onSubmit="chooseMuti()">
    		<table class="table table-condensed">
				<tr>
					<td>
						<div class="row">
							<div class="col-md-1"><span class="label label-primary">房型:</span></div>
							<div class="col-md-1"><a href="showUserRoomList">全部</a></div>
							<div class="col-md-1"><a href="showSearchRoomList?roomtype=一室一厅">一室一厅</a></div>
							<div class="col-md-1"><a href="showSearchRoomList?roomtype=一室二厅">一室二厅</a></div>
							<div class="col-md-1"><a href="showSearchRoomList?roomtype=一室三厅">一室三厅</a></div>
							<div class="col-md-1"><span class="label label-primary">租赁方式:</span></div>
							<div class="col-md-1"><a href="showUserRoomList">全部</a></div>
							<div class="col-md-1"><a href="showSearchRoomList?renttype=整租">整租</a></div>
							<div class="col-md-1"><a href="showSearchRoomList?renttype=合租">合租</a></div>
						</div>
					</td>
				<tr>
					<td>
						<div class="row">
							<div class="col-md-1"><span class="label label-primary">装修:</span></div>
							<div class="col-md-1"><a href="showUserRoomList">全部</a></div>
							<div class="col-md-1"><a href="showSearchRoomList?fit=精装">精装</a></div>
							<div class="col-md-1"><a href="showSearchRoomList?fit=简装">简装</a></div>
							<div class="col-md-1"><a href="showSearchRoomList?fit=毛坯">毛坯</a></div>
							<div class="col-md-1"><span class="label label-primary">类型:</span></div>
							<div class="col-md-1"><a href="showUserRoomList">全部</a></div>
							<div class="col-md-1"><a href="showSearchRoomList?roomstyle=别墅">别墅</a></div>
							<div class="col-md-1"><a href="showSearchRoomList?roomstyle=普通住宅">普通住宅</a></div>
							<div class="col-md-1"><a href="showSearchRoomList?roomstyle=学区房">学区房</a></div>
						</div>
					</td>
				</tr>
				
				<tr>
					<td>
						<div class="row">
							<div class="col-md-1"><span class="label label-primary">房型</span></div>
							<div class="col-md-4">
								<div class="radio">
							        <label>
							        <input type="radio" name="roomtype" value="一室一厅" > 一室一厅
							        </label>
							        <label>
							        <input type="radio" name="roomtype" value="一室二厅" /> 一室二厅
							        </label>
							        <label>
							        <input type="radio" name="roomtype" value="一室三厅" /> 一室三厅
							        </label>
							        <button type="button" class="btn btn-warning btn-xs" id="remove_roomtype" >任意</button> 
							    </div>
						    </div>
						    <div class="col-md-1"><span class="label label-primary">租赁方式</span></div>
						    <div class="col-md-4">
							    <div class="radio">
							        <label>
							        <input type="radio" name="renttype" value="整租" > 整租
							        </label>
							        <label>
							        <input type="radio" name="renttype" value="合租" /> 合租
							        </label>
							        <button type="button" id="remove_renttype" class="btn btn-warning btn-xs">任意</button>
							    </div>
						    </div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="row">
							<div class="col-md-1"><span class="label label-primary">装修</span></div>
							<div class="col-md-4">
								<div class="radio">
							        <label>
							        <input type="radio" name="fit" value="精装" > 精装
							        </label>
							        <label>
							        <input type="radio" name="fit" value="简装" /> 简装
							        </label>
							        <label>
							        <input type="radio" name="fit" value="毛坯" /> 毛坯
							        </label>
							        <button type="button" id="remove_fit" class="btn btn-warning btn-xs">任意</button>
							    </div>
						    </div>
						    <div class="col-md-1"><span class="label label-primary">类型</span></div>
						    <div class="col-md-4">
							    <div class="radio">
							        <label>
							        <input type="radio" name="roomstyle" value="别墅" > 别墅
							        </label>
							        <label>
							        <input type="radio" name="roomstyle" value="普通住宅" /> 普通住宅
							        </label>
							        <label>
							        <input type="radio" name="roomstyle" value="学区房" /> 学区房
							        </label>
							        <button type="button" id="remove_roomstyle" class="btn btn-warning btn-xs">任意</button>
							    </div>
						    </div>
						</div>
					</td>
				</tr>
				<tr><td></td></tr>
			</table>
			<div>
			<button type="submit" class="btn btn-success btn-sm">搜索房屋</button>
			</div>
			</form>
    	</div>
    	<h1></h1>
    	<div class="row">
    		<div class="col-md-9" >
    		
		<c:forEach var="listRoominfo" items="${listRoominfo}" varStatus="status">
      <!-- Main component for a primary marketing message or call to action -->
      
        
        <div class="row" onmouseover="this.style.backgroundColor='#F4F9FD'" onmouseout="this.style.backgroundColor='#FFFFFF'" style="border-bottom:1px dashed #987cb9; padding:15px">
        	<div class="col-xs-6 col-md-4" align="center">
	        	<c:set value="${'imageName'}${status.index}" var="option" />
	        	<c:forEach var="imageName" items="${requestScope[option]}" end="0">
	    			<a href="showUserRoomDetail?room_id=${listRoominfo.id}" >
	      				<img src="image/${imageName}"  style="max-width: 150px; max-height: 150px;">
	    			</a>
	  			</c:forEach>
  			</div>
  			<div class="col-xs-6 col-md-8">
	  			<h3><a href="showUserRoomDetail?room_id=${listRoominfo.id}">${listRoominfo.title}</a></h3>
	  			<p><span class="label label-primary">租金/月</span><span class="label label-default">租金押付</span><span class="label label-danger">装修</span>${listRoominfo.price}&nbsp;||&nbsp;${listRoominfo.pricetype}&nbsp;||&nbsp;${listRoominfo.fit}</p>
	        	<div class="row">
		        	<div class="col-xs-6 col-md-8">
		        		<p><span class="label label-success">房型</span><span class="label label-info">租赁方式</span><span class="label label-danger">类型</span>${listRoominfo.roomtype}&nbsp;||&nbsp;${listRoominfo.renttype}&nbsp;||&nbsp;${listRoominfo.roomstyle}</p>
					</div>
					<div class="col-xs-6 col-md-4">
		        		<h3 class="text-warning">${listRoominfo.price}元/月</h3>
					</div>
				</div>
				<span class="label label-warning">地址</span>${listRoominfo.location}
			</div>
		</div>
<!--         <HR style="border:1 dashed #987cb9" width="100%" color=#987cb9 SIZE=1> -->
      
      </c:forEach>
      
	  		</div>
	  		<div class="col-md-3">
	  		<h5>&nbsp;<span class="glyphicon glyphicon-pushpin" aria-hidden="true">&nbsp;最新发布</span></h5>
	  		<c:forEach var="listRoominfoReverse" items="${listRoominfoReverse}" varStatus="status" end="4">
	  			<c:set value="${'imageNameReverse'}${status.index}" var="option" />
	        	<c:forEach var="imageNameReverse" items="${requestScope[option]}" end="0">
				  	<div align="center" style="border:1px solid #987cb9; border-radius:5px; padding-left:20px;padding-top:1px;padding-right:20px;padding-bottom:-2px">
			            <a href="showUserRoomDetail?room_id=${listRoominfoReverse.id}">
			            	<img src="image/${imageNameReverse}"  style="max-width: 150px; max-height: 150px;">
			            </a>
			            <p>${listRoominfoReverse.title}</p>
			        </div>
			        <h1></h1>
		        </c:forEach>
		    </c:forEach>
		  </div>
    	</div>
    	
    	<footer >
        	<p>&copy; Company 2016</p>
      	</footer>
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
  
  <!-- 多张图片提交 -->
    <script src="js/bootstrap/js/fileinput.js" type="text/javascript"></script>
	<script src="js/bootstrap/js/fileinput_locale_zh.js" type="text/javascript"></script>
	
	<script>
	    $('#file-0a').fileinput({
	        language: 'zh',
// 	        uploadUrl: 'uploadMultipleFile',
	        allowedPreviewTypes : ['image'],
		    allowedFileTypes: ['image'],
	        allowedFileExtensions:  ['jpg', 'png'],
	    	maxFileSize : 2000
	    });
// 	    $('#file-0a').on('fileuploaderror', function(event, data, previewId, index) {
// 	        var form = data.form, files = data.files, extra = data.extra,
// 	                response = data.response, reader = data.reader;
// 	        console.log(data);
// 	        console.log('File upload error');
// 	    });
// 	    $('#file-0a').on('fileerror', function(event, data) {
// 	        //控制台输出消息
// 	    	console.log(data.id);
// 	        console.log(data.index);
// 	        console.log(data.file);
// 	        console.log(data.reader);
// 	        console.log(data.files);
// 	    });
// 	    $('#file-0a').on('fileuploaded', function(event, data, previewId, index) {
// 	        var form = data.form, files = data.files, extra = data.extra,
// 	                response = data.response, reader = data.reader;
// 	        console.log('File uploaded triggered');
// 	    });
	</script>
</html>
