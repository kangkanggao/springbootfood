<!DOCTYPE html>
<html>
<head>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>

<base href="<%=basePath%>">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>互聊</title>


<link rel="stylesheet" href="resources/gkk/css/index.css" />
<script src='resources/gkk/js/jquery-1.12.4.min.js'></script>
<link rel="stylesheet" href="resources/gkk/css/chat.css" />

</head>
<body>
	<img style="width: 100%; height: 100%">
	<div class="abs cover contaniner">
		<div class="abs cover pnl">
			<div class="top pnl-head"></div>
			<div class="abs cover pnl-body" id="pnlBody">
				<div class="abs cover pnl-left">
					<div class="abs cover pnl-msgs scroll" id="show">
						<div class="msg min time" id="histStart">加载历史消息</div>
						<div class="pnl-list" id="hists">
							<!-- 历史消息 -->
						</div>
						<div class="pnl-list" id="msgs">
							<div class="msg robot">
								<div class="msg-left" worker="商家">
									<div class="msg-host photo"
										style="background-image: url(../Images/head.png)"></div>
									<div class="msg-ball" id="seller_date" title="今天 17:52:06" id="seller_id">
										你好，我是商家 <br> <br>您是想要了解哪些方面呢？
									</div>
								</div>
							</div>
							<input hidden="hidden" type="text" name="toUser" id="toUser"
								value="${sessionScope.seller.username}" /><br /> <input
								type="text" name="sendUser" hidden="hidden" id="sendUser"
								value="${sessionScope.buyer.buyerName}" />
							<div class="msg guest">
								<div class="msg-right">
									<div class="msg-host headDefault"></div>
									<!-- <div class="msg-ball" id="buyer_date" title="今天 17:52:06"></div> -->
								</div>
							</div>
						</div>
						<div class="pnl-list hide" id="unreadLine">
							<div class="msg min time unread">未读消息</div>
						</div>
					</div>
					<div class="abs bottom pnl-text" >
						<div class="abs top pnl-warn" id="pnlWarn">
							<div class="fl btns rel pnl-warn-free"></div>
						</div>
						<div class="abs cover pnl-input" id="messageInput">
							<textarea class="scroll" id="text2" wrap="hard"
								placeholder="在此输入文字信息..."></textarea>
							<div class="abs atcom-pnl scroll hide" id="atcomPnl">
								<ul class="atcom" id="atcom"></ul>
							</div>
						</div>
						<div class="abs br pnl-btn" id="submit"
							style="background-color: rgb(32, 196, 202); color: rgb(255, 255, 255);"
							onclick="send()">发送</div>
						<div class="pnl-support" id="copyright">
							
						</div>
					</div>
				</div>
				<div class="abs right pnl-right">
					<div class="slider-container hide"></div>
					<div class="pnl-right-content">
						<div class="pnl-tabs">
							<div class="tab-btn active" id="hot-tab"><a href="front/toMain">主界面</a></div>
							<div class="tab-btn" id="rel-tab"></div>
						</div>
						<div class="pnl-hot">
							<ul class="rel-list unselect" id="hots">
								<!-- <li class="rel-item">这是一个问题，这是一个问题？</li> -->
							</ul>
						</div>
						<div class="pnl-rel" style="display: none;">
							<ul class="rel-list unselect" id="rels">
								<!-- <li class="rel-item">这是一个问题，这是一个问题？</li> -->
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	
		    var websocket = null;
		    window.onload = function(){ 
		    	 
		    	　		if(${empty buyer.buyerName }){
		                    alert("您还没有登录,请您登录!");
		                    return ;
		 				}
		 				if('WebSocket' in window){
		 					 var sendUser = document.getElementById("sendUser").value;
		 					 document.getElementById("sendUser").disabled = true;
		 					 websocket = new WebSocket("ws://<%=request.getServerName()%>:<%=request.getServerPort()%>/milk/chatDemo/"+ sendUser);
		 		        }else{
		 		              alert('Not support websocket');
		 		        }
		 			
		 			//连接发生错误的回调方法
		 	          websocket.onerror = function(){
		 	        	  document.getElementById('status').innerHTML="error";
		 	          };
		 	           
		 	          //连接成功建立的回调方法
		 	          websocket.onopen = function(event){
			 	          alert('建立连接成功');
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
			function login(){
		
			}
		      //将消息显示在网页上
		      function setMessageInnerHTML(innerHTML){
		    	  $("#seller_date").attr("title", "changeName");
		    	    var j=parseInt(window.j);
					if (j%2!=1&&window.i == 1 && window.old == 1) {
						alert("您有商家新消息!");
					}
					var user=innerHTML.split('给')[0];
					user=user.split(':')[1];
					
					 AddMsg(user, SendMsgDispose(innerHTML.split(':')[2]));
		             document.getElementById('seller_id').value += innerHTML;
		      } 
		      //关闭连接
		      function closeWebSocket(){
		    	  document.getElementById('showMsg').value="";
		          websocket.close();
		      }
		       
		      //发送消息
		      function send(){
		    	  var text = document.getElementById("text2");
		    	    if (text.value == "" || text.value == null)
		    	    {
		    	        alert("发送信息为空，请输入！")
		    	    }
		    	    else
		    	    {
		    	    	 var sendUser = document.getElementById("sendUser").value;
				    	 var toUser = document.getElementById("toUser").value;
				    	 var message = text.value;
				         var jsonMsg = {"sendUser":sendUser,"toUser":"buyer_"+toUser,"message":message};
				         websocket.send(JSON.stringify(jsonMsg));
		    	         AddMsg('default', SendMsgDispose(text.value));
		    	         text.value = "";
		    	    }
		    
		         
		       
		      }

		      /*****************************  */
		      // 发送信息
/* function SendMsg()
{
    var text = document.getElementById("text");
    if (text.value == "" || text.value == null)
    {
        alert("发送信息为空，请输入！")
    }
    else
    {
        AddMsg('default', SendMsgDispose(text.value));
        text.value = "";
    }
} */
// 发送的信息处理
function SendMsgDispose(detail)
{
    detail = detail.replace("\n", "<br>").replace(" ", "&nbsp;")
    return detail;
}

// 增加信息
function AddMsg(user,content)
{
	
    
	
    var str = CreadMsg(user, content);
    
    var msgs = document.getElementById("msgs");
    msgs.innerHTML = msgs.innerHTML + str;
    
}

// 生成内容
function CreadMsg(user, content,time)
{
    var str = "";
    if(user == 'default')
    {
       
        str = "<div class=\"msg guest\"><div class=\"msg-right\"><div class=\"msg-host headDefault\"></div><div class=\"msg-ball\" title=\"\" id=\"iid<%=request.getAttribute("iid")%>\">" + content +"</div></div></div>"
    }
    else
    {
       
        str = "<div class=\"msg robot\"><div class=\"msg-left\" worker=\"" + user + "\"><div class=\"msg-host photo\" title=\"\" style=\"background-image: url(../Images/head.png)\"></div><div class=\"msg-ball\" >" + content + "</div></div></div>";
    }
    return str;
}
		  
$("#messageInput").bind("keydown",function(e){
    // 兼容FF和IE和Opera    
var theEvent = e || window.event;    
var code = theEvent.keyCode || theEvent.which || theEvent.charCode;    
if (code == 13) {    
    send();
    }    
});
	</script>

<script type="text/javascript">

</script>

</body>
</html>