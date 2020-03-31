<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); // 서블릿 컨텍스트페쓰
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타임라인 검색</title>
<style type="text/css">
.form-control-borderless {
	border: none;
}

.form-control-borderless:hover, .form-control-borderless:active,
	.form-control-borderless:focus {
	border: none;
	outline: none;
	box-shadow: none;
}
</style>
<script type="text/javascript">
	$(function()
	{
		$(".hashSubmit").click(
				function()
				{
					if ($(".hashContent").val() == ""
							|| $(".hashContent").val() == null)
					{
						alert("검색어를 입력하세요");
						return false;
					}
				});

	});
</script>
</head>
<body>
	<c:if test="${hasLock==0 ||(hasLock==1 && grade!=3)}">
		<div class="container" style="width: 80%; height: 30px; margin-top: 10px;">
			<div class="row justify-content-center" style="width: 100%; height: 100%; margin: 0 auto; padding: 0px;">
				<div class="col-12 col-md-10 col-lg-8" style="width: 100%; height: 100%; margin: 0 auto; padding: 0px;">
					<form action="team_main.action" method="get" class="card card-sm" style="width: 100%; height: 100%; margin: 0 auto; padding: 0;">
						<div class="card-body row no-gutters align-items-center" style="padding: 0; height: 50%; border: none;">
							<div class="col">
								<input class="timeLineKey" name="timeLineKey" value="1" type="text" hidden />
								<input class="hashContent form-control form-control-lg form-control-borderless" name="hashName" type="search" placeholder="해시태그명으로 검색하세요" style="height: 30px;">
							</div>
							<!--end of col-->
							<div class="col-auto">
								<button class="btn btn-lg btn-success hashSubmit" type="submit" style="height: 30px; font-size: 12pt; padding: 3px; padding-bottom: 10px;">#Hash!</button>
							</div>
							<!--end of col-->
						</div>
					</form>
				</div>
				<!--end of col-->
			</div>
		</div>
	</c:if>
</body>
</html>