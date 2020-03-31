<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header.jsp</title>
 <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous"> 
	
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="assets/css/main.css">
</head>
<body>
	<div style="background-color: #34314c; height: 115px;"></div> 
	<header id="header">

		<div class="inner">

			<nav id="nav" style="display: flex; margin-right: 50px;">
				<!-- class="navbar navbar-fixed-top"  -->
				<div>
					<a href="index.html"> <img src="<%=cp%>/images/logo.png"
						style="width: 70px;" />
					</a>
				</div>
				<div style="flex-grow: 1">
					<a href="index.html">Project</a> <a href="generic.html">Contest</a>
					<a href="elements.html">Board</a>
				</div>
				<div style="flex-grow: 1">
					<a href="index.html">Admin</a> <a href="generic.html">Join</a>
				</div>
			</nav>
			<!-- <a href="#navPanel" class="navPanelToggle"><span
				class="fa fa-bars"></span></a> -->
		</div>
	</header>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>