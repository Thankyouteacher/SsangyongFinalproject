<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project_Create.jsp</title>

<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="utf-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> --> <!-- 뭔지 모르겠음... -->
<link rel="stylesheet" href="assets/css/main.css">

<style type="text/css">
	
	body
	{
		display: flex;
		/* align-content: center; */
		flex-direction: column;;
		justify-content: center;
		color: white;
	}
	
	select
	{
		height: 40px;
	}
	
	.btn1
	{
		width: 200px;
		color: white;
	}
	
	.btn2
	{
		width: 40px;
		color: white;
	}
	
	.create
	{
		background-color: #47b8e0;
		color: white; 
	}
	
	.create:hover
	{
		background-color: #34314c;
		color: white; 
	}
	
	.reset
	{
		background-color: #79bd9a;
		color: white; 
	}
	
	.reset:hover
	{
		background-color: #3b8686;
		color: white; 
	}
	
	.cancel
	{
		background-color: #ff7473;
		color: white; 
	}
	
	.cancel:hover
	{
		background-color: #E53A40;
		color: white;
	}

</style>

<script type="text/javascript">

	function create()
	{
		f = document.createPrj;
		str = f.rname.value;

		if(str==null || str=="")
		{
			alert("프로젝트 제목을 입력하세요.");
			f.rname.focus();
			return;
		}
		
		str = f.pcontents.value;
		if(str==null || str=="")
		{
			alert("프로젝트 소개글을 입력하세요.");
			f.pcontents.focus();
			return;
		}
		
		str = f.paddress.value;
		if(str==null || str=="")
		{
			alert("지역을 선택하세요.");
			f.paddress.focus();
			return;
		}

		str = f.proId.value;
		if(str=="0")
		{
			alert("기간을 선택하세요.");
			f.proId.focus();
			return;
		}
		
		str = f.peoId.value;
		if(str=="0")
		{
			alert("인원을 선택하세요.");
			f.peoId.focus();
			return;
		}
		
		str = f.link.value;
		if(str==null || str=="")
		{
			alert("외부 연락망을 입력하세요.");
			f.link.focus();
			return;
		}
		
		alert("개설 완료~");
		
		/*
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear();
		
		if(dd<10)
		    dd="0"+dd
		
		if(mm<10)
		    mm="0"+mm
		
		today = yyyy + "년" mm + "월" + dd + "일";
		
		alert(today);
		*/
		
		f.submit();
		
		//alert(f.prjTheme.value);	// 주제 내용 확인용!
	}
	
	function update()
	{
		f2 = document.updatePrj;
		str = f2.rname.value;

		if(str==null || str=="")
		{
			alert("프로젝트 제목을 입력하세요.");
			f2.rname.focus();
			return;
		}
		
		str = f2.pcontents.value;
		if(str==null || str=="")
		{
			alert("프로젝트 소개글을 입력하세요.");
			f2.pcontents.focus();
			return;
		}
		
		str = f2.paddress.value;
		if(str==null || str=="")
		{
			alert("지역을 선택하세요.");
			f2.paddress.focus();
			return;
		}

		str = f2.proId.value;
		if(str=="0")
		{
			alert("기간을 선택하세요.");
			f2.proId.focus();
			return;
		}
		
		str = f2.peoId.value;
		if(str=="0")
		{
			alert("인원을 선택하세요.");
			f2.peoId.focus();
			return;
		}
		
		str = f2.link.value;
		if(str==null || str=="")
		{
			alert("외부 연락망을 입력하세요.");
			f2.link.focus();
			return;
		}
		
		alert("수정 완료~");
		
		/*
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear();
		
		if(dd<10)
		    dd="0"+dd
		
		if(mm<10)
		    mm="0"+mm
		
		today = yyyy + "년" mm + "월" + dd + "일";
		
		alert(today);
		*/
		
		f2.submit();
		
		//alert(f.prjTheme.value);	// 주제 내용 확인용!
	}
	
	function back()
	{
		f3 = document.backPrj;
		
		f3.submit();
	}
	
	function reset() {
		
		f = document.createPrj;
		
		$("#createPrj")[0].reset();	// 입력한 폼 초기화
		
		$("#sname").css('display', 'none');
		
		//$("#prjTheme").val(null);	// 없음 클릭시 내용 비우기!
		// 어차피 폼 초기화 되서 사라지긴 함
		
		$("#field").empty();	// 추가된 필요한 기술 초기화 
		
		n = 1;	// 기술 갯수 1로 초기화
		
		f.rname.focus();
		
		return;
	}
	
	n = 1;	// 필요한 기술의 갯수
	
	// 기술 추가
	function add_div()
	{
		if(n<$("#grade").val())	// 레벨에 따라 다름.
		{
			var div = document.createElement('div');
	
			div.innerHTML = document.getElementById('room_type').innerHTML;
	
			document.getElementById('field').appendChild(div);
			
			n = n + 1;
		}
		else
		{
			alert("최대 갯수입니다.");
			return;
		}

	}
	
	// 기술 제거
	function remove_div(obj)
	{
		if(n<=1)
		{
			alert("최소 갯수입니다.");
			return;
		}
		else
		{
			document.getElementById('field').removeChild(obj.parentNode);
			
			n = n - 1;
		}

	}
	
	$(function()
	{
		// 주제. 처음엔 무조건 비활성화
		$("#sname").css('display', 'none');
		
		if($("#sname").val())
		{
			$("#sname").css('display', 'block');
		}
		
		// 주제 있음 클릭
		$("input:button[name=ok]").click(function()
		{
			$("#sname").css('display', 'block');
		});
		
		// 주제 없음 클릭
		$("input:button[name=no]").click(function()
		{
			$("#sname").css('display', 'none');
			$("#sname").val(null);	// 없음 클릭시 내용 비우기!
		});
	});
	
	// 우편번호 함수
	function searchAddress()
	{
		new daum.Postcode(
		{
			oncomplete : function(data)
			{
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R')
				{ // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else
				{ // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R')
				{
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname))
					{
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y')
					{
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '')
					{
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("paddress").value = extraAddr;

				} else
				{
					document.getElementById("paddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				//document.getElementById('uaddress1').value = data.zonecode;
				document.getElementById("paddress").value = addr;
				// 커서를 상세주소 필드로 이동한다.

				// document.getElementById("uaddress3").focus();
			}
		}).open();
	}
	
</script>

</head>
<body>

	
	<c:if test="${empty project.pid }">
	<div class="inner">
		<form action="project_create_ok.action?usId=${usId }" method="POST" id="createPrj" name="createPrj">
		<%-- <form action="Project_Create_ok.action?usId=${usId }" method="POST" id="createPrj" name="createPrj"> --%>
	</c:if>
	
	<c:if test="${not empty project.pid }">
	<div class="inner" style="width: 40.5%;">
		<form action="project_update_ok.action?pid=${project.pid }&usId=${usId}" method="POST" id="updatePrj" name="updatePrj">
		<%-- <input type="hidden" value="${project.pid }" name="pid" id="pid"> --%>
		<h4 class="modal-title">프로젝트 수정하기</h4>
	</c:if>
		<!-- 
		<div>
			<input type="hidden" value="1" name="usId" id="usId">
		</div>
		-->
		<div class="flex">
			<div>
				<input type="text" value="프로젝트 제목" disabled="disabled" style="border: none; ">
			</div>
		</div>
		
		<div>
			<input type="text" name="rname" id="rname" style="width: 100%;" value="${project.rname }"><!-- 프로젝트 제목 내용 -->
		</div>
		
		<div>
			<input type="text" value="프로젝트 소개글" disabled="disabled" style="border: none; ">
			<textarea rows="3" cols="35" name="pcontents" id="pcontents" style="width: 100%; resize: none;">${project.pcontents }</textarea>
		</div>
		
		<div>
			<input type="text" value="대표 칭호 설정" disabled="disabled" style="border: none; width: 230px;">
			<c:if test="${achCount == 0}">
				<input type="text" value="설정할 수 있는 칭호가 없습니다." style="width: 320px; height: 40px;">
			</c:if>
		</div>
		<div class="flex">
			<!-- 칭호 갯수 확인 end는 칭호 갯수로. 단, 3개 이상일 경우 3으로 -->
			
			<c:if test="${achCount >= 3}">
				<c:set var="achCount" value="3"></c:set>
			</c:if>
			
			<c:forEach var="i" begin="1" end="${achCount }" step="1" >
				<div>
					<select name="acId1" id="acId1" style="height: 40px;">
						<option value="0" selected="selected">칭호</option>
						<!-- 획득한 칭호 출력 -->
						<c:forEach var="achievement" items="${achievement }">
							<option value="${achievement.acId }">${achievement.acName }</option>
						</c:forEach>
					</select>
				</div>
			</c:forEach>
		</div>
		
		<br>
		
		<div class="flex">
			<div>
				<input type="text" value="온라인" disabled="disabled" style="border: none; width: 100px;">
			</div>
			<div>
				<!-- <input type="text" value="[ 스크롤 ]" style="width: 300px; color: gray"> -->
				<select name="oid" id="oid" style=" height: 40px;">
					<c:forEach var="onlineRate" items="${onlineRate }">
						<option value="${onlineRate.oid }" ${onlineRate.onRate == onRate ? "selected='selected'" : ""}>
							온라인 ${onlineRate.onRate } % / 오프라인 ${100-onlineRate.onRate } %
						</option>
					</c:forEach>
				</select>
			</div>
			<div>
				<input type="text" value="오프라인" disabled="disabled" style="border: none; width: 110px;">
			</div>
		</div>
		
		<div class="flex">
			<div>
				<div class="flex">
					<!-- 지 역 -->
					<div>
						<input type="text" value="지 역" disabled="disabled" style="border: none; width: 100px;">
					</div>
					<div>
						<!-- <span class="firstItem" >주소 </span> -->
						<input type="button" style="width: 60px; height: 40px; font-size: 8px;" class="btn2 create" value="검색" id="adrBtn" onclick="searchAddress()">
						<!-- <input type="text" style="width: 88px; height: 40px;" readonly="readonly" required="required" id="uaddress1" name="uaddress1"> -->
					</div>
					<div>
						<input type="text" value=" " disabled="disabled" style="width: 73px; border: none;">
					</div> 
					<div>
						<!-- <span class="firstItem" ></span> -->
						<input type="text" style="width: 530px; height: 40px;" readonly="readonly" id="paddress" name="paddress" value="${project.paddress }">
					</div> 
				</div>
			</div>
			
			<br>
			
			<div>
				<div class="flex">
					<!-- 프로젝트 기간 -->
					<div>
						<input type="text" value="프로젝트 기간" disabled="disabled" style="border: none; width: 160px;">
					</div>
					<div>
						<select name="proId" id="proId">
							<option value="0">선택</option>
							<c:forEach var="period" items="${period }">
								<option value="${period.proId }" ${period.proId == project.proId ? "selected='selected'" : ""}>${period.proPeriod }</option>
							</c:forEach>
							
						</select>
					</div>
					<div>
						<!-- 일 -->
						<input type="text" value="일" disabled="disabled" style="border: none; width: 80px;">
					</div>
				</div>
			</div>
			
			<div>
				
				<div class="flex">
				<!-- 인원 -->
					<div>
						<input type="text" value="인원" disabled="disabled" style="border: none; width: 80px;">
					</div>
					<div>
						<select name="peoId" id="peoId">
							<c:if test="${empty project.pid }">
								<option selected="selected" value="0">선택</option>
								<c:forEach var="people" items="${people }">
									<option value="${people.peoId }" ${people.peoId == project.peoId ? "selected='selected'" : ""}>${people.peoCount }</option>
								</c:forEach>
							</c:if>
							
							<c:if test="${not empty project.pid }">
								<c:forEach var="i" begin="${totProJoinCount }" end="8" step="1">
									<option value="${i-1 }" ${i-1 == project.peoId ? "selected='selected'" : ""}>${i }</option>
								</c:forEach>
							</c:if>
							
						</select>
					</div>
					<div>
						<input type="text" value="명" disabled="disabled" style="border: none; width: 60px;">
					</div>
				</div>
			</div>
		</div>
		<c:if test="${empty project.pid }">
			<div class="flex">
				<div>
					<input type="text" value="필요한 기술" disabled="disabled" style="border: none; width: 140px;"><!-- 필요한 기술 -->
				</div>
			</div>
				<div id="room_type">
					<select name="skId1" id="skId1" style="width: 190px;">
						<option value="0" selected="selected">없음</option>
						<c:forEach var="skillList" items="${skillList }">
							<option value="${skillList.skId }">${skillList.skName }</option>
						</c:forEach>
					</select>
					<input type="text" style="border: none; height: 40px; width: 20px;" disabled="disabled" value="">
					<input type="button" value="추가" class="btn2 create" style="height: 40px; width: 60px; font-size: 8pt;" onclick="add_div()">
					<input type="button" value="제거" class="btn2 cancel" style="height: 40px; width: 60px; font-size: 8pt;" onclick="remove_div(this)">
				</div>
				
				<div id="field"></div>
		</c:if>
		<br>
		<div class="flex">
			<div>
				<input type="text" value="주제" disabled="disabled" style="border: none; width: 100px;">
				<input type="button" id="ok" class="btn2 create" name="ok" value="있음" style="height: 40px; width: 60px; font-size: 8pt;">
				<input type="button" id="no" class="btn2 cancel" name="no" value="없음" style="height: 40px; width: 60px; font-size: 8pt;">
			</div> 
		</div>
		
		<div>
			<textarea name="sname" id="sname" rows="3" cols="35" style="width: 100%; resize: none;">${sname }</textarea>
		</div>
		
		<br>
		<div class="flex">
			<!-- 성별 -->
			<div>
				<input type="text" value="성별" disabled="disabled" style="border: none; width: 80px;">
			</div>
			<div>
				<select name="gid" id="gid">
					<c:if test="${empty project.pid }">
						<option value="3" selected="selected">상관없음</option>
						<!-- 자신의 성별만 선택 가능하기 때문에 -->
						<!-- 주민등록번호 뒷자리에 맨 앞자리로 구분! -->
						<option value="${getUser.ssdBack }">${getUser.ssdBack==1 || getUser.ssdBack==3 ? '남자' : '여자'}</option>
					</c:if>
					<c:if test="${not empty project.pid }">
						<option value="3" ${3 == project.gid? "selected='selected'" : ""}>상관없음</option>
						<option value="${getUser.ssdBack }" ${getUser.ssdBack == project.gid? "selected='selected'" : ""}>${getUser.ssdBack==1 || getUser.ssdBack==3 ? '남자' : '여자'}</option>
					</c:if>
				</select>
			</div>
		
			<!-- 레벨 -->
			<div>
				<input type="text" value="참여 가능 레벨" disabled="disabled" style="border: none; width: 170px;">
			</div>
			<div>
				<select name="minLevel" id="minLevel" style="width: 120px;">
					<c:forEach var="i" begin="1" end="${userLevel }" step="1"><!-- end 는 자신의 레벨까지 -->
						<c:if test="${empty project.pid }">
							<option value="${i }" ${i == "1" ? "selected='selected'" : ""}>Lv.${i }</option>
						</c:if>
						<c:if test="${not empty project.pid }">
							<option value="${i }" ${i == project.minLevel ? "selected='selected'" : ""}>Lv.${i }</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
			<div>
				<input type="text" value="~" disabled="disabled" style="border: none; width: 60px;">
			</div>
			<div>
				<select name="maxLevel" id="maxLevel" style=" width: 120px;">
					<c:choose>
						<c:when test="${userLevel <= 5 }">
							<c:set var="grade" value="1"></c:set>
						</c:when>
						
						<c:when test="${userLevel <= 10 }">
							<c:set var="grade" value="2"></c:set>
						</c:when>
						
						<c:otherwise>
							<c:set var="grade" value="3"></c:set>
						</c:otherwise>
					</c:choose>
					
					<!-- grade가 1이라는 것은 -->
					<!-- 레벨이 5보다 작거나 같다는 것이기 때문에 -->
					<!-- ~5, ~10, ~15 까지 가능 -->
					<c:if test="${grade == 1 }">
						<c:forEach var="i" begin="5" end="15" step="5">
							<c:if test="${empty project.pid }">
								<option value="${i }" ${i == "15" ? "selected='selected'" : ""}>Lv.${i }</option>
							</c:if>
							<c:if test="${not empty project.pid }">
								<option value="${i }" ${i == project.maxLevel ? "selected='selected'" : ""}>Lv.${i }</option>
							</c:if>
						</c:forEach>
					</c:if>
					
					<!-- grade가 2이라는 것은 -->
					<!-- 레벨이 5보다는 크고 10보다는 작거나 같다는 것이기 때문에 -->
					<!-- ~10, ~15 까지만 가능 -->
					<c:if test="${grade == 2 }">
						<c:forEach var="i" begin="10" end="15" step="5">
							<c:if test="${empty project.pid }">
								<option value="${i }" ${i == "15" ? "selected='selected'" : ""}>Lv.${i }</option>
							</c:if>
							<c:if test="${not empty project.pid }">
								<option value="${i }" ${i == project.maxLevel ? "selected='selected'" : ""}>Lv.${i }</option>
							</c:if>
						</c:forEach>
					</c:if>
					
					<!-- grade가 3이라는 것은 -->
					<!-- 레벨이 10보다는 크고 15보다는 작거나 같다는 것이기 때문에 -->
					<!-- ~15 만 가능 -->
					<c:if test="${grade == 3 }">
						<%-- <option value="${i }" ${i == "15" ? "selected='selected'" : ""}>Lv.${i }</option> --%>
						<option value="15" selected="selected">Lv.15</option>
					</c:if>
				</select>
				<input type="hidden" value="${grade }" id="grade" name="grade"><!-- 필요 기술 추가 갯수를 위해! -->
			</div>
		</div>	
		
		<div>
			<input type="text" value="외부 연락망" disabled="disabled" style="border: #3b8686; ">
			<textarea name="link" id="link" rows="3" cols="35" style="width: 100%; resize: none;">${project.link }</textarea>
		</div>
		
		<c:if test="${empty project.pid }">
			<div class="flex">
				<input type="text" value="프로젝트 시작일은" disabled="disabled" style="border: none; width: 200px;">
				<input type="text" value="${startDate}" readonly="readonly" style="border: none; width: 270px; color: red;" disabled="disabled">
				<input type="text" value="입니다." disabled="disabled" style="border: none; width: 100px;">
			</div>
		</c:if>
		
		<div class="flex">
		<c:if test="${not empty project.pid }">
			<input type="button" class="btn1 create" value="수정하기" onclick="update()">
			<input type="button" class="btn1 cancel" value="취소하기" onclick="back()">
			
			
		</c:if>
		</div>
	</form>
	
	<form action="recruitment_project.action?pid=${project.pid }&usId=${usId}" method="POST" id="backPrj" name="backPrj">
	</form>
</div>

</body>
</html>