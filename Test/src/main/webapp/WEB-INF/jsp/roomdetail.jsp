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
    <link href="//v3.bootcss.com/examples/navbar-fixed-top/navbar-fixed-top.css" rel="stylesheet">
    <!-- Ideal Image Slider -->
    <link rel="stylesheet" href="http://www.dowebok.com/demo/173/css/ideal-image-slider.css">
	<link rel="stylesheet" href="http://www.dowebok.com/demo/173/themes/default/default.css">
    <!-- Ideal Image Slider -->
    <!--  -->
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
			
		  var ll = ${replyLength+1};
		  for(var i=1;i<ll;i++){
			  (function(arg){
				  	var form_id = "replyForm"+i;
					var btn_id  = "reply"+i;
					$("#"+form_id).hide();
					$("#"+btn_id).click(function(){
					    $("#"+form_id).toggle(500);
							 
					});
			  })(i);
						
			  
		  }
			
	});
	</script>
	<!-- 回复内容校验 -->
	<script type="text/javascript">
					function checkre(){
						if (document.getElementById('re').value==''){
							alert('回复内容不能为空！');
						}else if(document.getElementById('re').value!=''){
							document.re_form.action="addReply?room_id=${roominfo.id}";
						}
					}
			</script>
	<!-- 弹出发布框 -->
	<script>
	  $(function(){
	    $("#publish").click(function(){
	      $("#mymodal").modal("toggle");
	    });
	  });
	</script>
	<!-- 单选框输入判断 -->
	<script type="text/javascript">
		function choose(){
			if(document.publish_form.pricetype[0].checked==true){
				document.getElementByName('pricetype').value = "押一付一";
			}
			else if(document.publish_form.pricetype[1].checked==true){
				document.getElementByName('pricetype').value = "押一付二";
			}
			else{
				document.getElementByName('pricetype').value = "押一付三";
			}
			
			if(document.publish_form.roomtype[0].checked==true){
				document.getElementByName('roomtype').value = "一室一厅";
			}
			else if(document.publish_form.roomtype[1].checked==true){
				document.getElementByName('roomtype').value = "一室二厅";
			}
			else{
				document.getElementByName('roomtype').value = "一室三厅";
			}
			
			if(document.publish_form.renttype[0].checked==true){
				document.getElementByName('renttype').value = "整租";
			}
			else(document.publish_form.renttype[1].checked==true){
				document.getElementByName('renttype').value = "合租";
			}
			
			if(document.publish_form.fit[0].checked==true){
				document.getElementByName('fit').value = "精装";
			}
			else if(document.publish_form.fit[1].checked==true){
				document.getElementByName('fit').value = "简装";
			}
			else{
				document.getElementByName('fit').value = "毛坯";
			}
			
			if(document.publish_form.roomstyle[0].checked==true){
				document.getElementByName('roomstyle').value = "别墅";
			}
			else if(document.publish_form.roomstyle[1].checked==true){
				document.getElementByName('roomstyle').value = "普通住宅";
			}
			else{
				document.getElementByName('roomstyle').value = "学区房";
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
						  <input type="text" class="form-control" name = "title" placeholder="请输入标题" aria-describedby="sizing-addon1" required autofocus>
						</div>
						<div class="input-group input-group-lg">
						  <span class="input-group-addon" id="sizing-addon1">租金/月</span>
						  <input type="text" class="form-control" name = "price" placeholder="请输入租金" aria-describedby="sizing-addon1">
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
						  <input type="text" class="form-control" name="location" placeholder="请输入地址" aria-describedby="sizing-addon1">
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
						  <input type="number" class="form-control" name="area" placeholder="请输入面积" aria-describedby="sizing-addon1">
						</div>
						<div class="input-group input-group-lg">
						  <span class="input-group-addon" id="sizing-addon1">楼层</span>
						  <input type="text" class="form-control" name="floor" placeholder="请输入楼层" aria-describedby="sizing-addon1">
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
						  <input type="text" class="form-control" name="introduct" placeholder="请输入房源描述" aria-describedby="sizing-addon1">
						</div>
						<h1></h1>
						<h5>上传房屋图片</h5>
				        <div class="row ">
				            <div style="padding:10px; ">
				                    <input id="file-0a" class="file" name="file" type="file" multiple data-min-file-count="1" data-allowed-file-extensions='["jpg", "png"]'  data-show-upload="false">
				                    <br>
				            </div>
				        </div>
						
						<h1></h1>
						<div class="input-group input-group-lg">
						  <span class="input-group-addon" id="sizing-addon1">发布者</span>
						  <input type="text" class="form-control" name="publisher" placeholder="请输入发布者" aria-describedby="sizing-addon1">
						</div>
						<div class="input-group input-group-lg">
						  <span class="input-group-addon" id="sizing-addon1">手机号码</span>
						  <input type="number" class="form-control" name="phone" placeholder="请输入手机号码" aria-describedby="sizing-addon1">
						</div>
						
			      
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-primary">发布</button>
				</div>
				</form>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

    <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
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
            <li><a href="showMyRoomList">我的主页</a></li>
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
			<!-- Ideal Image Slider -->
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
		<!-- 输入评论 -->
			<form name = "re_form" action="" method="post" onSubmit="checkre()">
				<label for="re" >输入评论内容</label>
				<textarea class="form-control" id="re" name="reply" required autofocus></textarea>
				<h3></h3>
				<button class="btn btn-xs btn-primary" type="submit">提交评论</button>
			</form>
			
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
      				<p>
			        	<a class="btn btn-xs btn-primary" id="reply${status.index+1}" role="button">回复&raquo;</a>
			        </p>
      				
    			</div>
    			
    			<!-- 输入回复 -->
				<form id="replyForm${status.index+1}" action="addReply?room_id=${roominfo.id}" method="post">
					<textarea class="form-control" id="re" name="reply" placeholder="reply${status.index+1}replyForm${status.index+1}"  required autofocus>回复@${listRoom_reply.replyer}:</textarea>
					<h3></h3>
					<button class="btn btn-xs btn-primary" type="submit">提交回复</button>
				</form>
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
	  
    </div> <!-- /container -->


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
