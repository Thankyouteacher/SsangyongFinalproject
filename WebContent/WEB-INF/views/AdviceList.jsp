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
<title>Do!Project</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<script>
	$(document).ready(function()
	{
		$("#flip").click(function()
		{
			$("#panel").slideToggle("slow");
		});

		$("label", this).click(function()
		{
			likeUsId = $(this).parent().children().eq(0).val();
			likeSaId = $(this).parent().children().eq(1).val();

			$.post("guidelikecheck.action",
			{
				usId : likeUsId,
				saId : likeSaId
			}, function(data)
			{
				$("#" + likeSaId).attr("value", data.trim());
			});

		});

		$(".guideAdviceDelete", this).click(function()
		{
			if (confirm("정말로 삭제하시겠습니까?"))
				$(this).parent().submit()
		});

		$("input", this).change(function()
		{
			var star = $("input:checked").val();

			if (star == 1)
			{
				$(".star5").css('color', 'black');
				$(".star4").css('color', 'black');
				$(".star3").css('color', 'black');
				$(".star2").css('color', 'black');
				$(".star1").css('color', 'red');
			} else if (star == 2)
			{
				$(".star5").css('color', 'black');
				$(".star4").css('color', 'black');
				$(".star3").css('color', 'black');
				$(".star2").css('color', '#ffc952');
				$(".star1").css('color', '#ffc952');
			} else if (star == 3)
			{
				$(".star5").css('color', 'black');
				$(".star4").css('color', 'black');
				$(".star3").css('color', '#ffc952');
				$(".star2").css('color', '#ffc952');
				$(".star1").css('color', '#ffc952');
			} else if (star == 4)
			{
				$(".star5").css('color', 'black');
				$(".star4").css('color', '#ffc952');
				$(".star3").css('color', '#ffc952');
				$(".star2").css('color', '#ffc952');
				$(".star1").css('color', '#ffc952');
			} else if (star == 5)
			{
				$(".star5").css('color', '#ffc952');
				$(".star4").css('color', '#ffc952');
				$(".star3").css('color', '#ffc952');
				$(".star2").css('color', '#ffc952');
				$(".star1").css('color', '#ffc952');
			}
		});

	});
</script>
<style>
#panel, #flip {
	padding: 5px;
	text-align: center;
	background-color: #34314c;
	border: solid 1px #34314c;
}

#panel {
	display: none;
}

.main_eval {
	width: 100%;
	height: 300px;
	border: 2px solid;
}
</style>
</head>
<body style="margin-top: 0;">

	<!-- Header -->
	<div style="background-color: #34314c; height: 115px;"></div>
	<div class="container">
		<header>
			<jsp:include page="Header.jsp" />
		</header>
	</div>
	<div style="width: 100%; height: 800px; margin: 0 auto;"><jsp:include page="Info.jsp"></jsp:include>
		<div id="flip" style="width: 50px; margin: 0 auto; border: 0px; border-bottom-left-radius: 3px; border-bottom-right-radius: 3px; background-color: #34314c; color: white;">info</div>
		<div id="teamtitle" style="width: 60%; height: 20%; margin: 0 auto; padding-top: 70px; position: relative;" align="center">
			<a href="team_main.action">
				<h2 style="font-weight: bold;">${ppName==null ? '팀명을정하세요' : ppName}</h2>
			</a>
		</div>
		<div style="width: 50%; height: 80%; margin: 0 auto;">
			<div style="width: 100%; height: 10%; padding-top: 10px; padding-left: 10px;">
				<a href="team_main.action" style="font-size: 20pt;">
					<i class="fas fa-arrow-left"></i>
				</a>
			</div>



			<!-- 작업공간 -->
			<c:if test="${listKey == 0 }">
				<div style="width: 100%; height: 20%; border: 2px solid #3b8686;">
					<div style="width: 50%; height: 50%; padding: 15px 15px 15px 30px;" align="left">제목 : ${reportNfile.ssName}</div>
					<div style="width: 50%; height: 50%; padding: 15px 15px 15px 30px;" align="left">
						첨부파일 :
						<a href="${reportNfile.urlFile }">${reportNfile.pfile }</a>
					</div>
				</div>
			</c:if>
			<c:if test="${listKey == 1 }">
				<c:forEach var="meetOrLog" items="${reportNfileList }">
					<div style="width: 100%; height: 20%; border: 2px solid #3b8686;">
						<div style="width: 50%; height: 50%; padding: 15px 15px 15px 30px;" align="left">제목 : ${meetOrLog.ssName}${meetOrLog.gpNum }</div>
						<div style="width: 50%; height: 50%; padding: 15px 15px 15px 30px;" align="left">
							첨부파일 :
							<a href="${meetOrLog.urlFile }">${meetOrLog.pfile }</a>
						</div>
					</div>
				</c:forEach>
			</c:if>



			<div style="width: 100%; height: 40%;">
				<%-- <jsp:include page="submit_evaluate.jsp"/> --%>
				<form action="guideadviceinsert.action">
					<div class="main_eval" style="margin: 0 auto; margin-top: 3%;">
						<input type="text" name="usId" value="${myInfo.usId }" hidden />
						<input type="text" name="pid" value="${myInfo.pid }" hidden />
						<input type="text" name="fsId" value="${fsId }" hidden />
						<div style="width: 100%; height: 10%; float: right;">
							<div style="width: 76%; height: 100%; float: right; padding-top: 5px;">
								<div style="width: 98%; height: 95%; float: right;">
									<div style="width: 45%; height: 100%; float: left; border: 2px solid; border-radius: 5px;" class="d-flex justify-content-around">
										<label for="score1" class="star">
											<i class="far fa-star star1" style="font-size: 14pt; margin: 0 auto;"></i>
										</label>
										<label for="score2" class="star">
											<i class="far fa-star star2" style="font-size: 14pt; margin: 0 auto;"></i>
										</label>
										<label for="score3" class="star">
											<i class="far fa-star star3" style="font-size: 14pt; margin: 0 auto;"></i>
										</label>
										<label for="score4" class="star">
											<i class="far fa-star star4" style="font-size: 14pt; margin: 0 auto;"></i>
										</label>
										<label for="score5" class="star">
											<i class="far fa-star star5" style="font-size: 14pt; margin: 0 auto;"></i>
										</label>
										<input type="radio" name="score" value="1" id="score1" style="display: none;" />
										<input type="radio" name="score" value="2" id="score2" style="display: none;" />
										<input type="radio" name="score" value="3" id="score3" style="display: none;" />
										<input type="radio" name="score" value="4" id="score4" style="display: none;" />
										<input type="radio" name="score" value="5" id="score5" style="display: none;" />
									</div>
								</div>
							</div>
						</div>
						<div style="width: 24%; height: 80%; float: left;">
							<div style="width: 80%; height: 60%; margin: 0 auto; margin-top: 8%;">
								<div style="width: 100%; height: 85%;">
									<div style="height: 70%; padding-top: 10%;" align="center">
										<img src="<%=cp %>/profilePhoto/member${myInfo.usId }/${myInfo.usPhoto}" style="width: 80px; height: 80px; border-radius: 40px; margin: 12px auto;"onerror="this.src = '<%=cp %>/profilePhoto/default.png'">
									</div>
								</div>
								<div style="width: 30%; height: 15%; float: left;">
									<span style="float: right; background-color: #79bd9a; border: 1px; border-radius: 5px;">${myInfo.usLv }</span>
								</div>
								<div style="width: 30%; height: 15%; float: right;">
									<a href="member_info_pro.action?member=${myInfo.usId }" style="float: left;">
										<i class="fas fa-info-circle" style="font-size: 13pt; margin: 0 auto;"></i>
									</a>
								</div>
								<div style="width: 40%; height: 15%; float: left;" align="center">
									<span>${myInfo.nickName }</span>
								</div>
							</div>
						</div>
						<div style="width: 76%; height: 80%; float: right; padding-right: 8px; padding-top: 10px;">
							<textarea name="saText" style="width: 98%; height: 93%; float: right;" placeholder="내용을 입력하세요."></textarea>
						</div>
						<div style="width: 20%; height: 10%; float: right; padding-right: 8px;">
							<button type="submit" style="float: right; width: 100%; height: 100%; text-align: center;">등록하기</button>
						</div>
					</div>
				</form>
				<c:forEach var="adviceList" items="${adviceList }">
					<div class="main_eval" style="margin: 0 auto; margin-top: 3%;">
						<div style="width: 74.5%; height: 10%; /*  background-color: black; */ float: right;">
							<c:if test="${myInfo.usId != adviceList.usId}">
								<div style="width: 12%; height: 100%; float: right;">
									<a href="#" style="font-weight: bold; float: right; padding-right: 8px; padding-top: 10px;">신고하기</a>
								</div>
							</c:if>
							<c:if test="${myInfo.usId == adviceList.usId }">
								<div style="width: 10%; height: 100%; float: right;">
									<form action="guideadvicedelete.action" method="get" class="guideDeleteForm">
										<input type="text" name="saId" value="${adviceList.saId }" hidden />
										<a class="guideAdviceDelete" href="#" style="font-weight: bold; float: right; padding-right: 8px; padding-top: 10px;">삭제</a>
									</form>
								</div>
								<div style="width: 10%; height: 100%; float: right;">
									<a href="#" style="font-weight: bold; float: right; padding-right: 8px; padding-top: 10px;">수정</a>
								</div>
							</c:if>
							<div style="width: 30%; height: 100%; float: right; padding-top: 10px;">
								<span style="float: right;">${adviceList.saDate }</span>
							</div>
							<div class="d-flex justify-content-around" style="width: 45%; height: 83%; margin-right: 2.3%; margin-top: 10px; border: 2px solid; border-radius: 5px; /*  background-color: yellow;  */ float: left;">
								<i class="far fa-star" style="font-size: 14pt; margin: 0 auto; ${adviceList.score == 1 ? 'color: red' : '' }; ${adviceList.score > 1 ? 'color: #ffc952' : ''};"></i>
								<i class="far fa-star" style="font-size: 14pt; margin: 0 auto; ${adviceList.score >= 2 ? 'color: #ffc952' : '' };"></i>
								<i class="far fa-star" style="font-size: 14pt; margin: 0 auto; ${adviceList.score >= 3 ? 'color: #ffc952' : '' };"></i>
								<i class="far fa-star" style="font-size: 14pt; margin: 0 auto; ${adviceList.score >= 4 ? 'color: #ffc952' : '' };"></i>
								<i class="far fa-star" style="font-size: 14pt; margin: 0 auto; ${adviceList.score == 5 ? 'color: #ffc952' : '' };"></i>
							</div>
						</div>
						<div style="width: 24%; height: 80%; float: left;">
							<div style="width: 80%; height: 60%; margin: 0 auto; margin-top: 20%;">
								<div style="width: 100%; height: 85%;">
									<div style="height: 70%; padding-top: 10%;" align="center">
										<img src="<%=cp %>/profilePhoto/member${adviceList.usId }/${adviceList.usPhoto}" style="width: 80px; height: 80px; border-radius: 40px; margin: 12px auto;"onerror="this.src = '<%=cp %>/profilePhoto/default.png'">
									</div>
								</div>
								<div style="width: 30%; height: 15%; float: left;">
									<span style="float: right; background-color: #79bd9a; border: 1px; border-radius: 5px;">${adviceList.usLv }</span>
								</div>
								<div style="width: 30%; height: 15%; float: right;">
									<a href="member_info_pro.action?member=${adviceList.usId }" style="float: left;">
										<i class="fas fa-info-circle" style="font-size: 13pt; margin: 0 auto;"></i>
									</a>
								</div>
								<div style="width: 40%; height: 15%; float: left;" align="center">
									<span>${adviceList.nickName}</span>
								</div>
							</div>
						</div>
						<div style="width: 76%; height: 80%; float: right; padding-right: 8px; padding-top: 10px;">
							<textarea style="width: 98%; height: 93%; float: right;" readonly="readonly">${adviceList.saText }</textarea>
						</div>
						<div style="width: 50%; height: 10%; float: right; padding-right: 8px;">
							<input type="text" value="${myInfo.usId }" id="likeUsId" hidden />
							<input type="text" value="${adviceList.saId }" id="likeSaId" hidden />
							<!-- <button type="button" class="btn btn-primary Like" style="padding: 0; width: 30%; height: 85%; float: right;">
								공감해요 <span class="badge badge-light like" style="width: 30%;"></span>
							</button> -->
							<input type="text" id="${adviceList.saId }" value="${adviceList.guideLikeCount }" style="width: 12%; font-size: 10pt; float: right; height: 75%;" readonly="readonly">
							<label for="${adviceList.saId }" style="width: 20%; float: right;" align="center"> 공감해요 </label>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>