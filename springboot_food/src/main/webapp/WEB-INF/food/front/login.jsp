<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<!-- 响应式设计 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>登录</title>

<link href="resources/bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<ul class="nav">
					<li class="nav-item"><a class="nav-link active" href="#">Home</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Profile</a>
					</li>
					<li class="nav-item"><a class="nav-link disabled" href="#">Messages</a>
					</li>
					<li class="nav-item dropdown ml-md-auto"><a
						class="nav-link dropdown-toggle" href="http://example.com"
						id="navbarDropdownMenuLink" data-toggle="dropdown">Dropdown
							link</a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">Another action</a> <a
								class="dropdown-item" href="#">Something else here</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Separated link</a>
						</div></li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-md-7"></div>
			<div class="col-md-5">
				<form role="form">
					<div class="form-group">

						<label for="exampleInputEmail1"> Email address </label> <input
							class="form-control" id="exampleInputEmail1" type="email" />
					</div>
					<div class="form-group">

						<label for="exampleInputPassword1"> Password </label> <input
							class="form-control" id="exampleInputPassword1" type="password" />
					</div>
					<div class="form-group">

						<label for="exampleInputFile"> File input </label> <input
							class="form-control-file" id="exampleInputFile" type="file" />
						<p class="help-block">Example block-level help text here.</p>
					</div>
					<div class="checkbox">

						<label> <input type="checkbox" /> Check me out
						</label>
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<h2>Heading</h2>
				<p>Donec id elit non mi porta gravida at eget metus. Fusce
					dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
					ut fermentum massa justo sit amet risus. Etiam porta sem malesuada
					magna mollis euismod. Donec sed odio dui.</p>
				<p>
					<a class="btn" href="#">View details »</a>
				</p>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="resources/bower_components/jquery/dist/jquery.js"></script>
	<script type="text/javascript" src="resources/bower_components/bootstrap/dist/js/bootstrap.js"></script>
	
</body>
</html>