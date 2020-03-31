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
<title>모드선택</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<script type="text/javascript">
	var mode = "";

	$(function()
	{
		mode = 2;
		modeName = '가이드 챌린지 모드(중간)';
		
		$("#sel1").change(function()
		{
			//alert($(this).val());
			mode = $("#sel1 option:selected").val();
			modeName = $("#sel1 option:selected").text();

			$(".mode_guide").css('display', 'none');
			$(".mode_assist").css('display', 'none');
			$(".mode_free").css('display', 'none');
			if (mode == "1" || mode == "2" || mode == "3")
			{
				$(".mode_guide").css('display', 'inline');
			} else if (mode == "assist")
			{
				$(".mode_assist").css('display', 'inline');
			} else
			{
				$(".mode_free").css('display', 'inline');
			}
		});
		
		$("#next").click(function()
		{
			str = "[ " + modeName + " ] 을 선택하셨어요! 다음단계로 넘어가게 되면 재선택을 할 수 없으니 신중하게 선택해주세요. 다음단계로 넘어갈까요?"; 
			
			if(confirm(str))
				$("#myForm").submit();
		});
	});
</script>
</head>
<body>

	<!-- Header -->
	<div style="background-color: #34314c; height: 115px;"></div>
	<div class="container">
		<header>
			<jsp:include page="Header.jsp" />
		</header>
	</div>
	<div style="background-color: white; width: 90%; height: 800px; margin: 0 auto;">
		<!-- <dl style="background-color: yellow; height: 8%;">
			<dd style="background-color: red; width: 4%; height: 100%; float: left; margin: 0 auto;
				font-size: 50px">●</dd>
			<dd style="background-color: red; width: 4%; height: 100%; float: left; margin: 0 auto;
				font-size: 50px">ㅡ</dd>
			<dd style="background-color: red; width: 4%; height: 100%; float: left; margin: 0 auto;
				font-size: 50px">○</dd>
			<dd style="background-color: red; width: 4%; height: 100%; float: left; margin: 0 auto;
				font-size: 50px">ㅡ</dd>
			<dd style="background-color: red; width: 4%; height: 100%; float: left; margin: 0 auto;
				font-size: 50px">○</dd>
			<dd style="background-color: red; width: 4%; height: 100%; float: left; margin: 0 auto;
				font-size: 50px">ㅡ</dd>
			<dd style="background-color: red; width: 4%; height: 100%; float: left; margin: 0 auto;
				font-size: 50px">○</dd>
		
		</dl> -->

		<dl style="height: 8%; margin: 0 auto;">
			<div style="width: 5%; height: 100%; float: left;">
				<div style="height: 70%; font-size: 30pt" align="center">●</div>
				<div style="height: 15%; font-size: 5pt" align="center">팀장선출</div>
				<div style="height: 15%; font-size: 5pt" align="center"></div>
			</div>
			<div style="width: 1%; height: 100%; float: left;">
				<div style="height: 70%; font-size: 30pt" align="center">-</div>
				<div style="height: 20%; font-size: 5pt" align="center"></div>
			</div>
			<div style="width: 5%; height: 100%; float: left;">
				<div style="height: 70%; font-size: 30pt" align="center">○</div>
				<div style="height: 15%; font-size: 5pt" align="center">모드선택</div>
				<div style="height: 15%; font-size: 5pt" align="center"></div>
			</div>
			<div style="width: 1%; height: 100%; float: left;">
				<div style="height: 70%; font-size: 30pt" align="center">-</div>
				<div style="height: 20%; font-size: 5pt" align="center"></div>
			</div>
			<div style="width: 5%; height: 100%; float: left;">
				<div style="height: 70%; font-size: 30pt" align="center">○</div>
				<div style="height: 15%; font-size: 5pt" align="center">과제선택</div>
				<div style="height: 15%; font-size: 5pt" align="center">(알리미)</div>
			</div>
			<div style="width: 1%; height: 100%; float: left;">
				<div style="height: 70%; font-size: 30pt" align="center">-</div>
				<div style="height: 20%; font-size: 5pt" align="center"></div>
			</div>
			<div style="width: 5%; height: 100%; float: left;">
				<div style="height: 70%; font-size: 30pt" align="center">○</div>
				<div style="height: 15%; font-size: 5pt" align="center">일정선택</div>
				<div style="height: 15%; font-size: 5pt" align="center">(알리미)</div>
			</div>

		</dl>
		<dl style="width: 80%; height: 40%; margin: 100px auto;" align="center">
			<div style="width: 35%; height: 100%; float: left; border-right: 2px solid gray;">
				<div style="width: 90%; height: 40%; float: left;">
					<div class="form-group">
					<form action="start_display_page9.action" method="get" id="myForm">
						<select class="form-control" name="modeId" id="sel1">
							<option value="1">가이드 챌린지 모드(어려움)</option>
							<option value="2" selected="selected">가이드 챌린지 모드(중간)</option>
							<option value="3">가이드 챌린지 모드(쉬움)</option>
							<option value="4">알리미 모드</option>
							<option value="5">셀프 디자인 모드</option>
						</select>
					</form>
					</div>
				</div>
			</div>
			<div style="width: 65%; height: 100%; float: right;">
				<div class="mode_guide" style="display: inline; width: 94.8%; height: 100%; float: right; border: 1px solid gray; border-radius: 5px; padding-left: 10px;" align="left">
					<h2 style="font-weight: bold;">1. 가이드 챌린지 모드</h2>
					<h5>
						가이드 챌린지 모드는 유저들의 통계를 기반으로 설정된 프로젝트의 일정 을 경험할 수 있습니다. 프로젝트에 필요한 수행과제들이 모두 들어있기 때문에 입문자들에겐 매우 적합합니다. 난이도(<span style="font-weight: bold;">어려움, 중간, 쉬움</span>)에 따라 얻을 수 있는 경험치가 다릅니다.
					</h5>
					<h1>
						<span style="color: #79bd9a">수행과제</span> : 업무일지, 회의록, 요구분석서, 기획안(초안), 플로우차트, 스토리보드, ERD(데이터베이스 기술 필요), 기획안(최종), 최종보고서
					</h1>
					<h5 style="font-weight: bold; color: #3b8686">[꼭 알아두세요!]</h5>
					<h5>ERD 는 방 개설 시 'ORACLE', 'mySQL', 'mariaDB' 등을 선택했을 시에만 선택할 수 있습니다.</h5>
				</div>

				<div class="mode_assist" style="display: none; width: 94.8%; height: 100%; float: right; border: 1px solid gray; border-radius: 5px; padding-left: 10px;" align="left">
					<h2 style="font-weight: bold;">2. 알리미 모드</h2>
					<h5>알리미 모드는 진행하고 싶은 수행과제들을 선택하고, 그에 따른 일정을 직접 설정하여 프로젝트를 수행할 수 있습니다. 프로젝트를 여러번 경험해 본 중급자 이상에게 적합합니다.</h5>
					<h1>
						<span style="color: #79bd9a">수행과제</span> : 업무일지, 회의록, 요구분석서, 기획안(초안), 플로우차트, 스토리보드, ERD(데이터베이스 기술 필요), 기획안(최종), 최종보고서 중 선택
					</h1>
					<h5 style="font-weight: bold; color: #3b8686">[꼭 알아두세요!]</h5>
					<h5>ERD 는 방 개설 시 'ORACLE', 'mySQL', 'mariaDB' 등을 선택했을 시에만 선택할 수 있습니다.</h5>
				</div>

				<div class="mode_free" style="display: none; width: 94.8%; height: 100%; float: right; border: 1px solid gray; border-radius: 5px; padding-left: 10px;" align="left">
					<h2 style="font-weight: bold;">3. 셀프 디자인 모드</h2>
					<h5>셀프 디자인 모드는 프로젝트의 AtoZ 를 프로그램의 개입없이 진행할 수 있습니다. 수행과제들의 제출 순서가 없습니다. 프로젝트의 경험이 많은 중급자 이상에게 적합합니다.</h5>
					<h1>
						<span style="color: #79bd9a">수행과제</span> : 업무일지, 회의록, 요구분석서, 기획안(초안), 플로우차트, 스토리보드, ERD(데이터베이스 기술 필요), 기획안(최종), 최종보고서 중 선택
					</h1>
					<h5 style="font-weight: bold; color: #3b8686">[꼭 알아두세요!]</h5>
					<h5>ERD 는 방 개설 시 'ORACLE', 'mySQL', 'mariaDB' 등을 선택했을 시에만 선택할 수 있습니다.</h5>
				</div>


			</div>

			<dd style="width: 16%; height: 10%; float: right; margin: 50px 0 0 0;">
				<nav>
					<ul class="pager">
						<li><a href="#" style="width: 100%;" id="next">Next</a></li>
					</ul>
				</nav>
			</dd>
		</dl>
	</div>
</body>
</html>