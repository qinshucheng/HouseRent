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
	<link href="js/bootstrap/css/fileinput.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="js/static/navbar.css" rel="stylesheet">
	
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>
	<script src="js/jquery/jquery-2.2.3.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/2.3.1/js/bootstrap-modal.js"></script>
    <script src="http://malsup.github.io/jquery.form.js"></script>
    
    <!-- 弹出更新资料框 -->
	<script>
	  $(function(){
	    $("#openModal").click(function(){
	      $("#update_mydata_modal").modal("toggle");
	    });
	  });
	</script>
    
    <!-- 更新内容框 -->
    <script>
		$(function(){
			
		  var ll = ${myroomnum+1};
		  for(var i=1;i<ll;i++){
			  (function(arg){
				  	var form_id = "updateForm"+i;
					var btn_id  = "update"+i;
					$("#"+form_id).hide();
					$("#"+btn_id).click(function(){
						console.log(btn_id);
					    $("#"+form_id).toggle(500);
							 
					});
			  })(i);
						
		  }
			
	});
	</script>
	
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
	<script type="text/javascript">
		function checkpassword(){
			if (document.getElementById('firstpassword').value==''){
				alert('密码不能为空！');
			}else if(document.getElementById('secondpassword').value==''){
				alert('请再次输入密码！');
			}else if(document.getElementById('phone').value==''){
				alert('联系方式不能为空！');
			}else if(document.getElementById('firstpassword').value!=document.getElementById('secondpassword').value){
				alert('两次密码输入不一致！');
			}else if(document.getElementById('firstpassword').value==document.getElementById('secondpassword').value&&document.getElementById('phone').value!=''){
				document.update_mydata_form.action="updateMydata";
			}
		}
	</script>
  </head>

  <body>
  
  <!-- 修改信息窗口 -->
  <div class="modal" id="update_mydata_modal">
	    <div class="modal-dialog">
	    
	        <div class="modal-content">
	        	<form class="form-update" name = "update_mydata_form" action=""  method="post" onSubmit="checkpassword()">
	            <div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
					<h3 class="modal-title" align="center" >修改我的信息</h3>
				</div>
				<div class="modal-body">
						  <label for="password" >输入密码</label>
						  <input type="password" class="form-control" name = "password" id="firstpassword" value="${mydata.password}" placeholder="请输入密码"  required autofocus>
						  <label for="password1" >再输入密码</label>
						  <input type="password" class="form-control" name = "password1" id="secondpassword" value="${mydata.password}" placeholder="请再次输入密码"  required>
				          <label for="phone" >联系方式</label>
						  <input type="number" class="form-control" name = "phone" id="phone" placeholder="请输入联系方式" value="${mydata.phone}" required>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-primary">确认更改</button>
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
              <li><a href="showUserRoomList">首页</a></li>
              <li class="active"><a >我的主页</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <% String userName = (String)session.getAttribute("userName");%>
              <li ><a >欢迎你，<%=userName%>！</a></li>
              <li><a href="logout">注销登录 </a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>

      <!-- Main component for a primary marketing message or call to action -->
      <div class="row">
      	<div class="col-md-3" align="center" style="border:1px solid #987cb9; border-radius:5px; padding-top:1px;padding-bottom:20px">
      		<div onmouseover="this.style.backgroundColor='#F4F9FD'" onmouseout="this.style.backgroundColor='#FFFFFF'" style="border-bottom:1px dashed #987cb9; padding:15px"><a href="">修改我的帖子</a></div>
      		<div onmouseover="this.style.backgroundColor='#F4F9FD'" onmouseout="this.style.backgroundColor='#FFFFFF'" style="padding-top:15px"><a id="openModal" href="#">修改我的信息</a></div>
        </div>
        <div class="col-md-9">
        <c:forEach var="myListRoominfo" items="${myListRoominfo}" varStatus="status">
        <div class="row" onmouseover="this.style.backgroundColor='#F4F9FD'" onmouseout="this.style.backgroundColor='#FFFFFF'" style="border-bottom:1px dashed #987cb9; padding:15px">
        	<div class="col-xs-6 col-md-4" align="center">
	        	<c:set value="${'myImageName'}${status.index}" var="option" />
	        	<c:forEach var="myImageName" items="${requestScope[option]}" end="0">
	    			<a href="showUserRoomDetail?room_id=${myListRoominfo.id}" >
	      				<img src="image/${myImageName}"  style="max-width: 150px; max-height: 150px;">
	    			</a>
	  			</c:forEach>
  			</div>
  			<div class="col-xs-6 col-md-8">
	  			<h3><a href="showUserRoomDetail?room_id=${myListRoominfo.id}">${myListRoominfo.title}</a></h3>
	  			<p><span class="label label-primary">租金/月</span><span class="label label-default">租金押付</span><span class="label label-danger">装修</span>${myListRoominfo.price}&nbsp;||&nbsp;${myListRoominfo.pricetype}&nbsp;||&nbsp;${myListRoominfo.fit}</p>
	        	<div class="row">
		        	<div class="col-xs-6 col-md-8">
		        		<p><span class="label label-success">房型</span><span class="label label-info">租赁方式</span><span class="label label-danger">类型</span>${myListRoominfo.roomtype}&nbsp;||&nbsp;${myListRoominfo.renttype}&nbsp;||&nbsp;${myListRoominfo.roomstyle}</p>
					</div>
					<div class="col-xs-6 col-md-4">
		        		<h3 class="text-warning">${myListRoominfo.price}元/月</h3>
					</div>
				</div>
				<p><span class="label label-warning">地址</span>${myListRoominfo.location}</p>
				<p><span class="label label-primary">联系人</span><span class="label label-default">联系方式</span>${myListRoominfo.publisher}&nbsp;||&nbsp;${myListRoominfo.phone}</p>
			</div>
			<p><a class="btn btn-sm btn-primary" id="update${status.index+1}" role="button">修改&raquo;</a></p>
		</div>
			<div>
				<form class="form-update" id="updateForm${status.index+1}" action="updateMyRoom?roomid=${myListRoominfo.id}"  method="post" enctype="multipart/form-data" onSubmit="choose()">
				     <div style="border:1px solid #987cb9; border-radius:5px; padding:20px">
				        <div class="input-group input-group-lg">
						  <span class="input-group-addon" id="sizing-addon1">标题</span>
						  <input type="text" class="form-control" name = "title" placeholder="请输入标题" value="${myListRoominfo.title}" aria-describedby="sizing-addon1" required autofocus>
						</div>
						<div class="input-group input-group-lg">
						  <span class="input-group-addon" id="sizing-addon1">租金/月</span>
						  <input type="text" class="form-control" name = "price" placeholder="请输入租金" value="${myListRoominfo.price}" aria-describedby="sizing-addon1" required>
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
						  <input type="text" class="form-control" name="location" placeholder="请输入地址" value="${myListRoominfo.location}" aria-describedby="sizing-addon1" required>
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
						  <input type="number" class="form-control" name="area" placeholder="请输入面积" value="${myListRoominfo.area}" aria-describedby="sizing-addon1" required>
						</div>
						<div class="input-group input-group-lg">
						  <span class="input-group-addon" id="sizing-addon1">楼层</span>
						  <input type="text" class="form-control" name="floor" placeholder="请输入楼层" value="${myListRoominfo.floor}" aria-describedby="sizing-addon1" required>
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
						  <input type="text" class="form-control" name="introduct" placeholder="请输入房源描述" value="${myListRoominfo.introduct}" aria-describedby="sizing-addon1" required>
						</div>
						<h1></h1>
						<h5>添加房屋图片</h5>
				        <div class="row ">
				            <div style="padding:10px; ">
				                    <input id="file-0a" class="file" name="file" type="file" multiple data-min-file-count="0" data-allowed-file-extensions='["jpg", "png"]'  data-show-upload="false">
				                    <br>
				            </div>
				        </div>
						<div class="input-group input-group-lg">
						  <span class="input-group-addon" id="sizing-addon1">发布者</span>
						  <input type="text" class="form-control" name="publisher" placeholder="请输入发布者" value="${myListRoominfo.publisher}" aria-describedby="sizing-addon1" required>
						</div>
						<div class="input-group input-group-lg">
						  <span class="input-group-addon" id="sizing-addon1">手机号码</span>
						  <input type="number" class="form-control" name="phone" placeholder="请输入手机号码" value="${myListRoominfo.phone}" aria-describedby="sizing-addon1" required>
						</div>
						<h1></h1>
						<button class="btn btn-xs btn-primary" type="submit">提交更新</button>
<!-- 						<p><a class="btn btn-sm btn-primary" role="button" type="submit">提交更新&raquo;</a></p> -->
							</div>
						</form>
					</div>	
			      
		
      </c:forEach>
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
