<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 响应式设计 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>顶栏</title>
<link href="resources/bower_components/bootstrap/dist/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link href="resources/icomoon/style.css" rel="stylesheet" type="text/css" />
<link href="resources/bower_components/jqueryui/themes/hot-sneaks/jquery-ui.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<!-- start -->
	<div class="container-fluid" style="padding: 0px;">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">

					<h4 style="width: 200px;">我们的商城</h4>
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="navbar-nav">
							<li class="nav-item dropdown" style="cursor:default;">
								<a class="nav-link dropdown-toggle" data-toggle="dropdown">店铺管理主页</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="back/toOrderList">订单管理</a> 
									<a class="dropdown-item" href="back/productInfoList">商品管理</a>
								</div>
							</li>
						</ul>
						<ul class="navbar-nav ml-md-auto">
							<li ><span>欢迎<b style="color: blue;">${sessionScope.seller.username }</b>登录&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
							<li><span><a href="javascript:void(0);" onclick="exit()">退出</a></span></li>
						</ul> 
					</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<!-- Button trigger modal -->
					<button type="button" id="button" class="btn btn-lg" data-toggle="modal" data-target="#myModal">消息</button>
				</nav>
			</div>
		</div>
	</div>
	<!-- end -->
	<!-- 消息模态对话框开始 -->
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div id="modalDialog" class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<div class="modal-body">
					<!--  start----------------------------------->
					买家账 号:<input type="text" name="sendUser" id="sendUser" /> <input
						type="button" id="login" value="登录" onclick="login()" /> <input
						type="button" onclick="closeWebSocket()" value="退出" /> 在线人数:<font
						id="count"></font> 连接状态:<font id="status"></font> <br /> 接收人:<input
						type="text" name="toUser" id="toUser" /><br /> 消息框:<br />

					<form role="form">
						<div class="form-group">
							<label for="name">文本框</label>
							<textarea class="form-control" rows="3" cols="5" id="showMsg"
								name="showMsg" disabled="disabled"></textarea>
							<br />
						</div>

						<div class="form-group">
							<label for="name">文本框</label>
							<textarea class="form-control" rows="3" id="message"
								name="sendMsg"></textarea>
							<br />
						</div>
					</form>
					<input type="button" value="发送" onclick="send()" /> <input
						type="button" value="关闭" onclick="closeWebSocket()" />

					<!--  end--------------------------------------->
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-success" onclick="send()">发送消息</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						id="button2">关闭窗口</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 结束 -->
	
	<script type="text/javascript"
		src="resources/bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="resources/bower_components/jqueryui/jquery-ui.js"></script>
	<script type="text/javascript">
		var websocket = null;
		function login() {
			if ('WebSocket' in window) {
				var sendUser = document.getElementById("sendUser").value;
				document.getElementById("sendUser").disabled = true;
				websocket = new WebSocket("ws://localhost:8080/chatDemo/"
						+ sendUser);
			} else {
				alert('Not support websocket');
			}

			//连接发生错误的回调方法
			websocket.onerror = function() {
				document.getElementById('status').innerHTML = "error";
			};

			//连接成功建立的回调方法
			websocket.onopen = function(event) {
				document.getElementById('status').innerHTML = "连接服务器成功";
			}

			//接收到消息的回调方法
			websocket.onmessage = function(event) {
				//判断分割是统计人数还是显示消息
				if (event.data.indexOf("count") > -1) {
					var msg = event.data;
					var data = msg.split(":");
					document.getElementById('count').innerHTML = data[1];
				} else {
					setMessageInnerHTML(event.data);
				}
			}

			//连接关闭的回调方法
			websocket.onclose = function() {
				document.getElementById('status').innerHTML = "连接被成功关闭";
			}

			//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
			window.onbeforeunload = function() {
				websocket.close();
			}
		}
		//将消息显示在网页上
		function setMessageInnerHTML(innerHTML) {
			/* ************************* */
			/* if(!window.old){
			  document.getElementById("button").click();
			 } */
			if (window.i == 1 && window.old == 1) {
				alert("您有商家新消息！");
			}
			document.getElementById('showMsg').innerHTML += innerHTML;
		}

		//关闭连接
		function closeWebSocket() {
			websocket.close();
		}

		//发送消息
		function send() {
			var sendUser = document.getElementById("sendUser").value;
			var toUser = document.getElementById("toUser").value;
			var message = document.getElementById("message").value;

			var jsonMsg = {
				"sendUser" : sendUser,
				"toUser" : toUser,
				"message" : message
			}
			websocket.send(JSON.stringify(jsonMsg));

			document.getElementById('showMsg').innerHTML += message;
		}
	</script>
	<script>
		$(document).ready(function() {

			$("#modalDialog").draggable();//为模态对话框添加拖拽
			$("#myModal").css("overflow", "hidden");//禁止模态对话框的半透明背景滚动

		});
		/*判断button按钮是否被点击过  */
		window.old = 0;
		window.i = 0;
		document.getElementById("button").onclick = function() {
			i = 1;
		}
		document.getElementById("button2").onclick = function() {
			window.old = 1;
		}
		function exit(){
			window.location.href="back/exit";
		}
	</script>
	
</body>
</html>