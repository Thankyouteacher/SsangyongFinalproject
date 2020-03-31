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
<title>ContestRead.jsp</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<script type="text/javascript">

	/* $(document).ready(function()
	{
		// 댓글 글자 수 byte 받아오기
		$('#commentHelp').on('keyup', function()
		{
			if($(this).val().length > 500)
			{
				$(this).val($(this).val().substring(0,500));
			}
		});
		
		// 댓글 글자 수 입력 제한(1000byte)
		$(document).on('keyup', '#commentHelp', function(e)
		{
			var textarea = $(this).val();
			$('#count').text(getBytes(textarea));
		});
		
		function getBytes(str)
		{
			var count = 0;
			for(var i=0; i<str.length; i++)
			{
				count += (str.charCodeAt(i) > 500) ? 2 : 1;
			}
			
			return count;
		}
		
	}); */

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

	<br />
	<br />

	<div class="container">
		<p class="h1" style="font-weight: bold; color: black;">공모전 정보</p>
		
		<br><br>
		
		<div class="container">
			<div class="flex" style="width: 100%;">
				<p style="font-size: 40px; margin-left: 100px; margin-bottom: 20px;">세상에 없던 경북 공모전 (사진, 영상, 페인팅, 일러스트 등)</p>
			</div>
			
			<hr />
			
			<div class="flex float-left" style="width: 500px;">
				<img alt="공모전 홍보용 포스터" src="<%=cp %>/images/test.jpg" style="width: 570px; height: 505px;">
			</div>
			
			<div class="flex float-right" style="width: 500px;">		
				<p style="font-size: 20px; margin-right: 90%;">인원</p>
				<br />
				<p style="font-size: 20px; margin-right: 80%;">참가 팀 수</p>
				<br />
				<p style="font-size: 20px; margin-right: 80%;">평가 항목</p>
				<br />
				<p style="font-size: 20px; margin-right: 80%;">요구 기술</p>
				<br />
				<p style="font-size: 20px; margin-right: 80%;">모집 기간</p>
				<br />
				<p style="font-size: 20px; margin-right: 70%;">프로젝트 기간</p>
				<br />
				<p style="font-size: 20px; margin-right: 80%;">상금 유형</p>
				<br />
			</div>
			
			<div class="flex">
				<br /><br /><br /><br />
			</div>
		</div>
					
		
		
		
		<div class="flex" style="width: 100%; margin: auto;">
			<p class="h1">상세 내용</p>
		</div>
		
		
		
		<br />
		
		<div class="flex" style="width: 100%;">
			<p>로렘 입숨(lorem ipsum; 줄여서 립숨, lipsum)은 출판이나 그래픽 디자인 분야에서 폰트, 타이포그래피, 레이아웃 같은 그래픽 요소나 시각적 연출을 보여줄 때 사용하는 표준 채우기 텍스트로, 최종 결과물에 들어가는 실제적인 문장 내용이 채워지기 전에 시각 디자인 프로젝트 모형의 채움 글로도 이용된다. 이런 용도로 사용할 때 로렘 입숨을 그리킹(greeking)이라고도 부르며, 때로 로렘 입숨은 공간만 차지하는 무언가를 지칭하는 용어로도 사용된다.
			로렘 입숨은 전통 라틴어와 닮은 점 때문에 종종 호기심을 유발하기도 하지만 그 이상의 의미를 담지는 않는다. 문서에서 텍스트가 보이면 사람들은 전체적인 프레젠테이션보다는 텍스트에 담긴 뜻에 집중하는 경향이 있어서 출판사들은 서체나 디자인을 보일 때는 프레젠테이션 자체에 초점을 맞추기 위해 로렘 입숨을 사용한다.
			로렘 입숨은 영어에서 사용하는 문자들의 전형적인 분포에 근접하다고도 하는데, 이 점 때문에 프레젠테이션으로 초점을 이동하는 데에도 도움을 준다.
			로렘 입숨(lorem ipsum; 줄여서 립숨, lipsum)은 출판이나 그래픽 디자인 분야에서 폰트, 타이포그래피, 레이아웃 같은 그래픽 요소나 시각적 연출을 보여줄 때 사용하는 표준 채우기 텍스트로, 최종 결과물에 들어가는 실제적인 문장 내용이 채워지기 전에 시각 디자인 프로젝트 모형의 채움 글로도 이용된다. 이런 용도로 사용할 때 로렘 입숨을 그리킹(greeking)이라고도 부르며, 때로 로렘 입숨은 공간만 차지하는 무언가를 지칭하는 용어로도 사용된다.
			로렘 입숨은 전통 라틴어와 닮은 점 때문에 종종 호기심을 유발하기도 하지만 그 이상의 의미를 담지는 않는다. 문서에서 텍스트가 보이면 사람들은 전체적인 프레젠테이션보다는 텍스트에 담긴 뜻에 집중하는 경향이 있어서 출판사들은 서체나 디자인을 보일 때는 프레젠테이션 자체에 초점을 맞추기 위해 로렘 입숨을 사용한다.
			로렘 입숨은 영어에서 사용하는 문자들의 전형적인 분포에 근접하다고도 하는데, 이 점 때문에 프레젠테이션으로 초점을 이동하는 데에도 도움을 준다.
			로렘 입숨(lorem ipsum; 줄여서 립숨, lipsum)은 출판이나 그래픽 디자인 분야에서 폰트, 타이포그래피, 레이아웃 같은 그래픽 요소나 시각적 연출을 보여줄 때 사용하는 표준 채우기 텍스트로, 최종 결과물에 들어가는 실제적인 문장 내용이 채워지기 전에 시각 디자인 프로젝트 모형의 채움 글로도 이용된다. 이런 용도로 사용할 때 로렘 입숨을 그리킹(greeking)이라고도 부르며, 때로 로렘 입숨은 공간만 차지하는 무언가를 지칭하는 용어로도 사용된다.
			로렘 입숨은 전통 라틴어와 닮은 점 때문에 종종 호기심을 유발하기도 하지만 그 이상의 의미를 담지는 않는다. 문서에서 텍스트가 보이면 사람들은 전체적인 프레젠테이션보다는 텍스트에 담긴 뜻에 집중하는 경향이 있어서 출판사들은 서체나 디자인을 보일 때는 프레젠테이션 자체에 초점을 맞추기 위해 로렘 입숨을 사용한다.
			로렘 입숨은 영어에서 사용하는 문자들의 전형적인 분포에 근접하다고도 하는데, 이 점 때문에 프레젠테이션으로 초점을 이동하는 데에도 도움을 준다.
			로렘 입숨(lorem ipsum; 줄여서 립숨, lipsum)은 출판이나 그래픽 디자인 분야에서 폰트, 타이포그래피, 레이아웃 같은 그래픽 요소나 시각적 연출을 보여줄 때 사용하는 표준 채우기 텍스트로, 최종 결과물에 들어가는 실제적인 문장 내용이 채워지기 전에 시각 디자인 프로젝트 모형의 채움 글로도 이용된다. 이런 용도로 사용할 때 로렘 입숨을 그리킹(greeking)이라고도 부르며, 때로 로렘 입숨은 공간만 차지하는 무언가를 지칭하는 용어로도 사용된다.
			로렘 입숨은 전통 라틴어와 닮은 점 때문에 종종 호기심을 유발하기도 하지만 그 이상의 의미를 담지는 않는다. 문서에서 텍스트가 보이면 사람들은 전체적인 프레젠테이션보다는 텍스트에 담긴 뜻에 집중하는 경향이 있어서 출판사들은 서체나 디자인을 보일 때는 프레젠테이션 자체에 초점을 맞추기 위해 로렘 입숨을 사용한다.
			로렘 입숨은 영어에서 사용하는 문자들의 전형적인 분포에 근접하다고도 하는데, 이 점 때문에 프레젠테이션으로 초점을 이동하는 데에도 도움을 준다.
			</p>		
		</div>
		
		<hr />
		
		<!-- Comments Form -->
		
		<div class="container">
			<div class="card my-4">
				<h5 class="card-header">댓글 작성:</h5>
				<div class="card-body">
					<form>
						<div class="form-group">
							<textarea class="form-control" rows="3" id="commentHelp" placeholder="500자 이내만 입력하세요." maxlength="1000"></textarea>
						</div>
						
						<div >
							<p class="byte float-right"><span id="count">0</span>/1000 byte</p>
						</div>
						<br /><br />
					</form>
					<button type="button" class="btn btn-primary float-left">수정하기</button>
					<button type="button" class="btn btn-danger float-left" style="margin-right: 20px;">삭제하기</button>
					<button type="button" class="btn btn-danger float-left">신고하기</button>
					<button type="submit" class="btn float-right" style="background-color: #31314c; color: white;">등록</button>
				</div>
			</div>
		</div>
		
		
		<div class="flex" style="margin-left: 90%;">
			<button type="submit" class="btn" style="width: 90px; height: 60px; 
				background-color: #79bd9a; color: white;" onclick="location.href='ContestBoard.jsp'">목록으로</button>
		</div>
		
		<br /><br /><br /><br /><br /><br /><br />
		
	</div>




</body>
</html>