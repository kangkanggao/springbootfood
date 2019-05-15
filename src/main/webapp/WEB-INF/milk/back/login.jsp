<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<html>

<head>
<meta charset="UTF-8">
<!-- 响应式设计 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>登录</title>

<base href="<%=basePath%>">
<link href="resources/gkk/back/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="resources/gkk/back/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="resources/gkk/back/static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
<link href="resources/gkk/back/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>天天订后台登录</title>

</head>
<body>
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="header">同城天天订后台管理系统</div>
<div class="loginWraper">
  <div id="loginform" class="loginBox">
  <c:if test="${msg!=null }">
					<div class="alert alert-primary" role="alert">${msg}</div>
				</c:if>
    <form class="form form-horizontal" action="back/login" method="post">
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-xs-8">
          <input id="" name="username" value="${requestScope.name}" type="text" placeholder="用户名" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8">
          <input id="" name="password" type="password"  placeholder="密码" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input class="input-text size-L" type="text" id="vcode" maxlength="4" name="vcode" placeholder="验证码" onblur="if(this.value==''){this.value='验证码:'}" onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:" style="width:150px;">
          <img alt="" src="vcode.png" class="validateVcode" title="点击换图" style="">
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <label for="online">
            <input type="checkbox" name="online" id="online" value="">
            使我保持登录状态</label>
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input name="" type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
          <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
        </div>
      </div>
    </form>
  </div>
</div>
<div class="footer">同城天天订</div>
<script type="text/javascript" src="resources/gkk/back/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="resources/gkk/back/static/h-ui/js/H-ui.min.js"></script>
<!--此乃百度统计代码，请自行删除-->
<script>
$(function() {
	$(".validateVcode").click(
			function() {
				$(".validateVcode").attr("src",
						"vcode.png?t=" + Math.random());
			});
	});
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?080836300300be57b7f34f4b3e97d911";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>

</body>
</html>