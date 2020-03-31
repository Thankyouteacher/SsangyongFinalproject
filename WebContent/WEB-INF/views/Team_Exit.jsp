<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); // 서블릿 컨텍스트페쓰
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>프로젝트탈퇴</title>
<style type="text/css">
</style>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">

	$(function()
	{
		$(".exit").click(function()
		{
			$(location).attr("href", "team_exit.action?outCase=3");
		});
	});

</script>
</head>
<body>
	<div class="container">
		<div class="modal fade" id="team_exit">
			<div class="modal-dialog modal-dialog-scrollable" style="max-width: 800px;">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h1 class="modal-title">프로젝트 탈퇴하기</h1>
						<button type="button" class="close" data-dismiss="modal" style="height: 100%; margin: 0; padding: 0; float: right;">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<h5>프로젝트를 탈퇴하게 되면 그동안의 프로젝트 기록이 전부 사라집니다.</h5>
						<br>
						<h5>그래도 프로젝트를 탈퇴하시겠습니까?</h5>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer d-flex justify-content-around">
						<button type="button" class="exit" data-dismiss="modal" style="background-color: #E53A40">네, 탈퇴할게요</button>
						<button type="button" data-dismiss="modal">아뇨, 남을게요</button>
					</div>

				</div>
			</div>
		</div>

	</div>

</body>
</html>