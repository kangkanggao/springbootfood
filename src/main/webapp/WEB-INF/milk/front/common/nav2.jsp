<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css"
	href="resources/lujian/css/style.css">
<link
	href="resources/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="resources/bower_components/jqueryui/themes/sunny/jquery-ui.min.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="resources/bower_components/jquery/dist/jquery.js"></script>

<script type="text/javascript"
	src="resources/bower_components/jqueryui/jquery-ui.min.js">
	</script>
<nav class="navbar navbar-expand-lg navbar-light static-top">
<div style="right: 0px">
	<form class="form-inline" action="front/productInfoOne" method="POST" >
			<input class="form-control mr-sm-2" type="text" id="productName" value="${productName }"/>
			<a  id="pn" href="front/productInfoOne"><button class="btn btn-warning my-2 my-sm-0" type="button" >
				搜一搜</button></a>&nbsp;&nbsp;
		</form>
</div>
</nav>
<!-- Modal -->
<script>
	 $(document).ready(function(){
	       //点击链接的时候调用
	      $("#pn").click(function(){
	    	  var productName = document.getElementById("productName").value;
	    	 
	          //设置linkToCart的href的值
	          $("#pn").attr("href","front/productInfoList?productName="+productName);
	         
	      });
	    });
   /*  $(document).ready(function(){
        
        //$("#modalDialog").draggable();//为模态对话框添加拖拽
        $("#myModal").css("overflow", "hidden");//禁止模态对话框的半透明背景滚动
         
    }); */
 /*判断button按钮是否被点击过  */  
        window.old =0;
        window.i=0;
        window.j=0;
        document.getElementById("button").onclick = function() {
        	j++;
            i=1;
        }
        function closeWindow() {
           j++;
           window.old=1;
          
        }
//清空消息框
function clearMessage(){
	document.getElementById('showMsg').value="";
}

</script>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div id="modalDialog" class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>

			</div>
			<div class="modal-body">
				<!--  start----------------------------------->

				<input type="text" name="sendUser" hidden="hidden" id="sendUser"
					value="${sessionScope.buyer.buyerName}" /> <input type="button"
					id="login" class="btn btn-success" value="互聊" onclick="login()" />

				<!-- <font id="count"></font> -->
				您的连接状态:<font id="status"></font> <br /> <input hidden="hidden"
					type="text" name="toUser" id="toUser"
					value="${sessionScope.seller.username}" /><br /> <br />

				<form role="form">
					<div class="form-group">
						<label for="name">消息框</label>
						<textarea class="form-control" rows="3" cols="5" id="showMsg"
							name="showMsg" disabled="disabled"></textarea>
						<br />
					</div>
					<div style="float: right">
						<button type="button" class="btn btn-primary"
							onclick="clearMessage()">清空消息</button>
						<button type="button" class="btn btn-primary"
							onclick="closeWebSocket()">结束聊天</button>
					</div>
					<div class="form-group">
						<label for="name">文本框</label>
						<textarea class="form-control" rows="3" id="message"
							name="sendMsg"></textarea>
						<br />
					</div>
				</form>

				<!--  end--------------------------------------->
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-success" onclick="send()">发送消息</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal"
					id="button2" onclick="closeWindow()">关闭窗口</button>
			</div>
		</div>
	</div>
</div>
<!-- --------------------------------------------------------------- -->
<script type="text/javascript">
	       
		    var websocket = null;
			function login(){
				if(${empty buyer.buyerName }){
                   alert("您还没有登录,请您登录!");
                   return ;
				}
				if('WebSocket' in window){
					 var sendUser = document.getElementById("sendUser").value;
					 document.getElementById("sendUser").disabled = true;
					websocket = new WebSocket("ws://<%=request.getServerName()%>:<%=request.getServerPort()%>/food/chatDemo/"+ sendUser);
		        }else{
		              alert('Not support websocket');
		        }
			
			//连接发生错误的回调方法
	          websocket.onerror = function(){
	        	  document.getElementById('status').innerHTML="error";
	          };
	           
	          //连接成功建立的回调方法
	          websocket.onopen = function(event){
	        	 document.getElementById('status').innerHTML="连接服务器成功";
	          }
	           
	          //接收到消息的回调方法
	          websocket.onmessage = function(event){
	        	  //判断分割是统计人数还是显示消息
	        	  if(event.data.indexOf("count")>-1){
	        		  var msg = event.data;
	        		  var data = msg.split(":");
	        		  document.getElementById('count').innerHTML=data[1];
	        	  }else{
	        		  setMessageInnerHTML(event.data);
	        	  }
	          }
	           
	          //连接关闭的回调方法
	          websocket.onclose = function(){
	        	  document.getElementById('status').innerHTML="连接被成功关闭";
	          }
	          
	          //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
	          window.onbeforeunload = function(){
	              websocket.close();
	          }
			}
		      //将消息显示在网页上
		      function setMessageInnerHTML(innerHTML){
		    	    var j=parseInt(window.j);
					if (j%2!=1&&window.i == 1 && window.old == 1) {
						alert("您有商家新消息!");
					}
		          document.getElementById('showMsg').value += innerHTML;
		      } 
		      //关闭连接
		      function closeWebSocket(){
		    	  document.getElementById('showMsg').value="";
		          websocket.close();
		      }
		       
		      //发送消息
		      function send(){
		    	 var sendUser = document.getElementById("sendUser").value;
		    	 var toUser = document.getElementById("toUser").value;
		    	 var message = document.getElementById("message").value;
 
		         var jsonMsg = {"sendUser":sendUser,"toUser":toUser,"message":message};
		         websocket.send(JSON.stringify(jsonMsg));
		         //显示消息
		         document.getElementById('showMsg').value+=message+"\n";
		        
		         //清空消息
		         document.getElementById('message').value="";
		       
		      }
	</script>


