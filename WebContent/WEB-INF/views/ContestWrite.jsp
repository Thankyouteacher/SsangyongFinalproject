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
<title>ContestWrite.jsp</title>

<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.9.2/i18n/jquery.ui.datepicker-ko.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>


<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>



<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  -->

<script type="text/javascript">
	// 체크박스 전체 선택/해제 함수
	$(document).ready(function()
	{
		$('#allCheck').click(function()
		{
			$('.custom-control-input').prop('checked', this.checked);
		});
		
		// 모집시작일자 달력 함수
		$( "#startRecruit" ).datepicker(
		{
			
		});
		
		// 모집 끝일자 달력 함수
		$('#endRecruit').datepicker(
		{
			
		});
		
		// 프로젝트 시작일자 달력 함수
		$('#startProject').datepicker(
		{
			
		});
		
		// 프로젝트 끝일자 달력 함수
		$('#endProject').datepicker(
		{
			
		});
		
		// 상금 유형 정보 hover 처리 함수
		$(function () {
			$('[data-toggle="tooltip"]').tooltip()
		});
		
		//카드번호 자릿수 byte 받아오기.
		$('#cardCheck').on('keypress', function()
		{
			if($(this).val().length > 15)
			{
				$(this).val($(this).val().substring(0,15));
			}
		});
		
		// 카드번호 자릿수 입력 제한(16byte)	
		$(document).on('keypress', '#cardCheck', function(e)
		{
			var textarea = $(this).val();
			$('#cardCheck').text(getCard(textarea));
			
			
		});
		
		function getCard(str)
		{
			count = 0;
			for(var i=0; i<str.length; i++)
			{
				count += (str.charCodeAt(i) > 15) ? 2 : 1;
			}
			
			return count;
		}
		
		//내용 글자 수 byte 받아오기.
		$('#contentHelp').on('keyup', function()
		{
			if($(this).val().length > 4000)
			{
				$(this).val($(this).val().substring(0,4000));
			}
		});
		
		// 내용 글자 수 입력 제한(4000byte)	
		$(document).on('keyup', '#contentHelp', function(e)
		{
			var textarea = $(this).val();
			$('#count').text(getBytes(textarea));
		});
		
		function getBytes(str)
		{
			var cnt = 0;
			for(var i=0; i<str.length; i++)
			{
				cnt += (str.charCodeAt(i) > 4000) ? 2 : 1;
			}
			return cnt;
		}
		
		
	});
	
	n=1;
	//기술 추가
	function add_div()
	{
		if (n < 3) // 레벨에 따라 다름.
		{
			var div = document.createElement('div');
	
			div.innerHTML = document.getElementById('room_type').innerHTML;
	
			document.getElementById('field').appendChild(div);
	
			n = n + 1;
		} else
		{
			alert("최대 갯수입니다.");
			return;
		}
	
	}
	
	// 기술 제거
	function remove_div(obj)
	{
		if (n <= 1)
		{
			alert("최소 갯수입니다.");
			return;
		} else
		{
			document.getElementById('field').removeChild(obj.parentNode);
	
			n = n - 1;
		}
	
	}
	
	
	

	
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
		<p class="h1" style="font-weight: bold; color: black;">공모글 작성</p>

	</div>

	<br />
	<br />

	<div class="container" align="center" style="font-size: 20px; color: black;">
		<p class="h3" style="color: black;" align="left">필수사항</p>

		<br />

		<div style="width: 1100px;">
			<form method="POST" action="/board/post">
				<div class="form-group" style="font-style: bold;">
					<label class="float-left">제목</label> <input type="text"
						name="subject" id="subjectHelp" class="form-control"
						placeholder="100자 이내만 입력하세요."
						style="background-color: rgba(255, 255, 255, 0.5)">
				</div>
			</form>
			<div class="float-right">
				<p class="byte">
					<span id="subject">0</span>/200 byte
				</p>
			</div>

			<br /> <br /> <br /> 
			<label class="float-left" style="font-size: 20px; color: black;">인원</label> 
			<label class="float-center" style="font-size: 20px; color: black;">참가	팀 수</label>


			<div class="float-left" style="padding-right: 40px;">
				<select style="height: 38.5px; width: 140px;">
					<option>최소 인원</option>
					<option>&nbsp;&nbsp;&nbsp;2명</option>
					<option>&nbsp;&nbsp;&nbsp;3명</option>
					<option>&nbsp;&nbsp;&nbsp;4명</option>
					<option>&nbsp;&nbsp;&nbsp;5명</option>
					<option>&nbsp;&nbsp;&nbsp;6명</option>
					<option>&nbsp;&nbsp;&nbsp;7명</option>
					<option>&nbsp;&nbsp;&nbsp;8명</option>
				</select>
			</div>



			<div class="float-left" style="padding-right: 200px;">
				<select style="height: 38.5px; width: 140px;">
					<option>최대 인원</option>
					<option>&nbsp;&nbsp;&nbsp;2명</option>
					<option>&nbsp;&nbsp;&nbsp;3명</option>
					<option>&nbsp;&nbsp;&nbsp;4명</option>
					<option>&nbsp;&nbsp;&nbsp;5명</option>
					<option>&nbsp;&nbsp;&nbsp;6명</option>
					<option>&nbsp;&nbsp;&nbsp;7명</option>
					<option>&nbsp;&nbsp;&nbsp;8명</option>
				</select>
			</div>
			
	
			<div class="float-left" style="padding-right: 40px;">
				<select style="height: 38.5px; width: 140px;">
					<option>최소 팀 수</option>
					<option>&nbsp;&nbsp;&nbsp;2팀</option>
					<option>&nbsp;&nbsp;&nbsp;3팀</option>
					<option>&nbsp;&nbsp;&nbsp;4팀</option>
					<option>&nbsp;&nbsp;&nbsp;5팀</option>
					<option>&nbsp;&nbsp;&nbsp;6팀</option>
					<option>&nbsp;&nbsp;&nbsp;7팀</option>
					<option>&nbsp;&nbsp;&nbsp;8팀</option>
				</select>
			</div>
			

			<div class="float-left">
				<select style="height: 38.5px; width: 140px;">
					<option>최대 팀 수</option>
					<option>&nbsp;&nbsp;&nbsp;2팀</option>
					<option>&nbsp;&nbsp;&nbsp;3팀</option>
					<option>&nbsp;&nbsp;&nbsp;4팀</option>
					<option>&nbsp;&nbsp;&nbsp;5팀</option>
					<option>&nbsp;&nbsp;&nbsp;6팀</option>
					<option>&nbsp;&nbsp;&nbsp;7팀</option>
					<option>&nbsp;&nbsp;&nbsp;8팀</option>
				</select>
			</div>

			<br /> <br /> <br /> <br /> 
			<label class="float-left" style="font-size: 20px; margin-bottom: 0px; color: black;">평가항목</label>
			<label class="float-center" style="font-size: 20px; color: black;">요구기술</label>


			<div class="flex float-left" style="width: 550px;" align="left">
				<div>
					<div class="custom-control custom-checkbox float-left">
					<input type="checkbox" id="allCheck" class="custom-control-input">
					<label class="custom-control-label" for="allCheck"
						style="color: black; padding-bottom: 10px;">전체선택/해제</label>
					</div>
					<br />
					<div class="custom-control custom-checkbox float-left">
						<input type="checkbox" id="plan" class="custom-control-input">
						<label class="custom-control-label" for="plan"
							style="color: black; padding-right: 70px; padding-bottom: 10px;"> 기획안 </label><input
							type="text" placeholder="배점" style="width: 75px; height: 30px;" />
					</div>
					<br />
					<div class="custom-control custom-checkbox float-left">
						<input type="checkbox" id="storyBoard" class="custom-control-input">
						<label class="custom-control-label" for="storyBoard"
							style="color: black; padding-right: 30px; padding-bottom: 10px;"> 스토리 보드 </label><input
							type="text" placeholder="배점" style="width: 75px; height: 30px;" />
					</div>
					<br />
					<div class="custom-control custom-checkbox float-left">
						<input type="checkbox" id="flowChart" class="custom-control-input">
						<label class="custom-control-label" for="flowChart"
							style="color: black; padding-right: 30px; padding-bottom: 10px;"> 플로우 차트 </label><input
							type="text" placeholder="배점" style="width: 75px; height: 30px;" />
					</div>
					<br />
					<div class="custom-control custom-checkbox float-left">
						<input type="checkbox" id="erDiagram" class="custom-control-input">
						<label class="custom-control-label" for="erDiagram"
							style="color: black; padding-right: 95px; padding-bottom: 10px;"> ERD </label><input
							type="text" placeholder="배점" style="width: 75px; height: 30px;" />
					</div>
					<br />
					<div class="custom-control custom-checkbox float-left">
						<input type="checkbox" id="finalReport"
							class="custom-control-input"> <label
							class="custom-control-label" for="finalReport"
							style="color: black; padding-right: 30px; padding-bottom: 10px;"> 최종 보고서 </label><input
							type="text" placeholder="배점" style="width: 75px; height: 30px;" />
					</div>
				</div>
			</div>
			
			
			<div class="flex float-right" style="width: 550px;" align="left">
			
				<div id="room_type">
				<select name="prjSkill" id="prjSkill" style="width: 190px;">
					<option selected="selected">없음</option>
					<option>JAVA</option>
					<option>HTML</option>
					<option>SQL</option>
					<option>C</option>
				</select> <input type="text" style="border: none; height: 40px; width: 20px;"
					disabled="disabled" value=""> <input type="button"
					value="추가" class="btn2 create" style="height: 40px;"
					onclick="add_div()"> <input type="button" value="제거"
					class="btn2 cancel" style="height: 40px;"
					onclick="remove_div(this)">
				</div>
				<div id="field"></div>
			</div>
			
			<br /><br /><br /><br /><br /><br /><br /><br /><br />
			
			<div class="flex float-left" style="width: 550px;">			
				<label style="font-size: 20px; color: black;">모집기간
				<br /><br /><input type="text" id="startRecruit" style="width: 150px; text-align: center">
				 ~ 
				<input type="text" id="endRecruit" style="width: 150px; text-align: center"></label>				
			</div>
			
			<div class="flex float-right" style="width: 550px;">			
				<label style="font-size: 20px; color: black;">프로젝트기간
				<br /><br /><input type="text" id="startProject" style="width: 150px; text-align: center">
				 ~ 
				<input type="text" id="endProject" style="width: 150px; text-align: center"></label>			
			</div>
			
			<br /><br /><br /><br /><br />
			
			<div class="flex float-left" style="width: 550px;">
				<label style="font-size: 20px; color: black;">상금 유형 선택 
				<a href="#" data-html="true" data-toggle="tooltip" title="A - 1등 : 1,000,000  <br>2등 : 700,000  <br>3등 : 500,000<br>
					&#10;B - 1등 : 700,000 <br>2등 : 500,000 <br>3등 : 300,000
					<br>C - 1등 : 500,000 <br>2등 : 300,000 <br>3등 : 100,000
					<br>D - 1등 : 300,000 <br>2등 : 150,000 <br>3등 : 50,000
					<br>E - 1등 : 150,000 <br>2등 : 70,000 <br>3등 : 30,000">
					<i class="fas fa-info-circle"></i>					
				</a>
				<br /><br /><select style="height: 38.5px; font-size: 20px;">
							<option>A</option>
							<option>B</option>
							<option>C</option>
							<option>D</option>
							<option>E</option>
						</select>
				</label>
			</div>
		</div>
		<br /><br /><br /><br /><br />
		
		<div class="form-group" style="font-size: 20px; color: black;">
			<label class="float-left">세부 내용</label>
			<textarea name="content" id="contentHelp" class="form-control"
				rows="20" placeholder="2000자 이내만 입력하세요."></textarea>
		</div>

		<div class="float-right">
			<p class="byte">
				<span id="count">0</span>/4000 byte
			</p>
		</div>
		
		<!-- 파일 업로드 부트스트랩 추가 -->
		<div class="input-group mb-3">
			<div class="input-group-prepend">
		    	<span class="input-group-text" id="inputGroupFileAddon01">Upload</span>
		    </div>
		    <div class="custom-file">
			    <input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
			    <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
		    </div>
		</div>
		
		<br />
		
		<button type="button" class="btn float-left"
			style="width: 90px; height: 40px; background: #E53A40; color: white;">다시작성</button>

		<button type="submit" class="btn float-right"
			style="width: 90px; height: 40px; background-color: #34314c; color: white;">확인</button>

		<br /><br />
		
		<div class="input-group mb-3">
		    <div class="input-group-prepend float-left" style="width: 400px;">
		    	<span class="input-group-text" id="basic-addon1">카드 번호 입력</span>
		    	<input type="text" id="cardCheck" class="form-control" placeholder="카드번호 16자리 입력 (-) 제외" 
		    		aria-label="Username" aria-describedby="basic-addon1">
		    </div>
		    <div id="cardSuccess" style="display: none;">
		    	<i class="fas fa-check" style="color: 3b8686;"></i>
		    </div>
		    <div id="cardFailed" style="display: show;">
		    	&nbsp;&nbsp;&nbsp;&nbsp;<i class="fas fa-exclamation" style="color: #E53A40; height: 40px;"></i>
		    </div>
		</div>

		<br /> <br /> <br />

		<button type="submit" class="btn float-right"
			style="width: 90px; height: 40px; background-color: #79bd9a; color: white;"
			onclick="location.href='ContestBoard.jsp'">목록으로</button>
		<br /> <br /> <br /> <br /> <br /> <br />
	</div>
	
</body>
</html>