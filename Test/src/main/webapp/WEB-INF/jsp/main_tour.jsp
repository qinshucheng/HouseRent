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
          <form class="navbar-form navbar-right" action="searchRoomByKeyword"  method="post">
            <div class="form-group">
              <input type="text" name= "keyword" placeholder="请输入关键字..." class="form-control" required>
            </div>
            <button type="submit" class="btn btn-success">搜索房屋</button>
          </form>
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">首页</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li ><a >欢迎你，游客！</a></li>
            <li ><a href="login_toLogin">去登录 </a></li>
            <li ><a href="register_toRegister">去注册 </a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    
	
    <div class="container">
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
</html>
