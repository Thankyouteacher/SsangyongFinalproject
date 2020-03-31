<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); // 서블릿 컨텍스트페쓰

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<style type="text/css">

.universal
{
	/* border : 1px solid black; */
	margin-top: 100px;
	display: flex;
	flex-direction: column;
	margin-bottom: 300px;
	
}
.container
{
	/* border : 1px solid gray; */
	display: flex;
	/* align-items: center; */	/*세로축에서 중앙*/
	justify-content: center; /*가로축에서 중앙*/
}

/* select,
textarea */
input[type="text"],
input[type="password"],
input[type="email"],
input[type="tel"]
{
	width: 200px;
	margin-left: 10px;
	margin-right: 10px; 
}

	
.inputBtn
{
	background-color: #34314c;
	color: white;
	width: 90px;
	padding: 0px 0px 0px 0px;
}

.inputBtn:hover 
{
	background-color: rgba(52, 49, 76, 0.80); 
}


.items
{
	display: flex;
	/* align-items: center; */
	margin-bottom: 15px;
}

.borderDiv
{
	border : 2px solid #34314c ;
	border-radius: 5px;
	padding: 0px 20px 0px 35px;
}
.firstItem
{
	/* border: 1px solid gray; */
	width: 150px;
	align-self: center;
	text-align: left;
}

.sklabel
{
	margin-left: 10px; 
	margin-right: 15px; 
	margin-top: 10px; 
	color:#353535
}

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
/* pwdConfirm userPwd */

$().ready(function()
{
	idDuplicate = false;
	nickDuplicate = false;
	
	$("#bankQues").hover(function()
	{
		$("#accountInfo").css("display", "block");
	});
	
	$("#bankQues").mouseleave(function()
	{
		$("#accountInfo").css("display", "none");
	});
	
	$("#subBtn").click(function()
	{
		$("#pwdWarning").css("display", "none");	// 비밀번호 일치하지 않는다는 문장 보이지 않도록 함
		$("#idWarning").css("display", "none");		// 아이디 중복 체크 문장 보이지 않도록 함
		$("#nickWarning").css("display", "none");	// 닉네임 중복 체크 문장 보이지 않도록 함
		
		// 아이디와 닉네임 입력했는지 검사
		if($("#userId").val()=="")
		{
			alert("아이디를 입력해주세요.");
			$("#userId").focus()
			return;
		}
		
		if($("#nickName").val()=="")
		{
			alert("닉네임을 입력해주세요.");
			$("#nickName").focus()
			return;
		}
		
		// 아이디 닉네임 중복 검사
		if(!idDuplicate)
		{
			alert("아이디 중복 검사를 해주세요.");
			$("#userId").focus()
			return;
		}
		
		if(!nickDuplicate)
		{
			alert("닉네임 중복 검사를 해주세요.");
			$("#nickName").focus()
			return;
		}
		
		// 비밀번호 검사
		var str = $("#password").val();
		
		if(str.length < 8 || str.length > 15)
		{
			alert("비밀번호는 8자 이상 15자 이하로 설정 가능합니다.");
			$("#password").focus();
			return;
		}
		
		if($("#password").val() != $("#pwdConfirm").val())
		{
			alert("비밀번호와 일치하지 않습니다.");
			$("#pwdWarning").css("display", "inline");
			$("#pwdConfirm").focus();
			return;
		}
		
		// 이름 입력 검사
		if($("#uname").val()=="")
		{
			alert("이름을 입력해주세요.");
			$("#uname").focus()
			return;
		}
		
		var ssd = $("#ssdFront").val() + "-" + $("#ssdBack").val();
		var ssdPattern = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;
		/* 해당 정규표현식은 완벽하지 않고, xxxxxx-x 까지만 검사하므로 나중에 더 정확한 걸 찾아서 바꿀 것. */
		
		if(ssd.length<14)
		{
			alert("주민등록번호를 정확히 입력해주세요.");
			$("#ssdFront").focus();
			return;
		}
		
		//alert(ssdPattern.test(ssd));
		if(!ssdPattern.test(ssd))
		{
			alert("유효하지 않은 주민등록번호입니다.");
			$("#ssdFront").focus();
			return;
		}
		
		// 주소 입력 검사
		if($("#uaddress1").val()=="")
		{
			alert("주소를 입력해주세요.");
			$("#uaddress3").focus();
			return;
		}
		
		// 관심 기술 1개~10개
		var leng = $("input[name=skId]:checked").length;
		if(leng<1 || leng >10)
		{
			alert("관심 기술은 최소 한 개, 최대 열 개까지 선택 가능합니다.");
			return;
		}
		
		var skillarr = new Array(); //배열선언
		
		var chbox = $(".skId");
		//	alert(chbox.length); 25
		
		for (var i = 0; i < chbox.length; i++)
		{
			if(chbox[i].checked)
			{
				skillarr.push(chbox[i].value);
			}
		}
		
		
		
		
		joinForm.submit();
		
	});
	
	$("#checkId").click(function()
	{
		// 영어만 가능
		var idPattern = /^[a-zA-Z]+$/;
		
		if($("#userId").val().length<4)
		{
			alert("아이디는 네 글자 이상의 영어로 입력해주세요.");
			$("#userId").focus();
			return;
		}
		
		if(!idPattern.test($("#userId").val()) )
		{
			alert("아이디는 네 글자 이상의 영어로 입력해주세요.");
			$("#userId").focus();
			return;
		}
		
		ajaxRequest_id();
	});
	
	$("#checkNick").click(function()
	{
		// 한글과 영어만 가능
		var nickPattern = /^[가-힣a-zA-Z]+$/;
		
		if($("#nickName").val().length<2)
		{
			alert("닉네임은 두 글자 이상 입력해주세요.");
			$("#nickName").focus();
			return;
		}
		
		if(!nickPattern.test($("#nickName").val()) )
		{
			alert("닉네임에 특수문자는 포함될 수 없습니다.");
			$("#nickName").focus();
			return;
		}
		
		ajaxRequest_nick();
	});
	
	$("#adrBtn").click(function()
	{
		// uaddress1 uaddress2 uaddress3
		searchAddress();
	});
	
});

// 테스트 함수
$(function()
{
	$("#testBtn").click(function()
	{
		//alert("아오");
		// 관심 기술 받아오려고 하는데 안 되는 중
		//alert($('input[name=skId]:checked').val());
		var chbox = $(".skId");
		//alert(chbox.length);
		//alert(chbox[0].value); // BASIC → 1
		//alert(chbox[0].checked); // false
		//alert($('input[name=skId]:checked').length); // 체크하면 그거만큼 수 나옴
		var skillarr = new Array();
		
		for (var i = 0; i < chbox.length; i++)
		{
			if(chbox[i].checked)
			{
				alert(chbox[i].value);
				skillarr.push(chbox[i].value);
			}
				
		}
		
		//alert(skillarr);
		


	});
});

// 우편번호 함수
function searchAddress() 
{
  	new daum.Postcode(
  	{
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("uaddress2").value = extraAddr;
            
            } else {
                document.getElementById("uaddress2").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('uaddress1').value = data.zonecode;
            document.getElementById("uaddress2").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("uaddress3").focus();
        }
    }).open();
}


// Ajax 함수들 ---------------------------------
function ajaxRequest_id()
{
	// jquery.post(), jquery.get() / $.post(), $.get()
	//-- jQuery 에서 AJAX를 써야 할 경우 지원해주는 함수. (서버 측에서 요청한 데이터를 받아오는 기능의 함수)
	// $.post(요청 주소, 전송 데이터, 응답 액션 처리)
	$.post("idcheck.action", {userId: $("#userId").val()}, function(data)
	{
		$("#idWarning").css("display", "inline");
		
		//alert(data);
		if(data=="\r\ntrue")
		{
			//alert(data);
			$("#idWarning").html("사용 가능한 아이디입니다.");
			idDuplicate = true;
		}
		else
		{
			//alert(data);
			$("#idWarning").html("중복된 아이디입니다.");
		}
				
	});
	
}

function ajaxRequest_nick()
{
	// jquery.post(), jquery.get() / $.post(), $.get()
	//-- jQuery 에서 AJAX를 써야 할 경우 지원해주는 함수. (서버 측에서 요청한 데이터를 받아오는 기능의 함수)
	// $.post(요청 주소, 전송 데이터, 응답 액션 처리)
	$.post("nickcheck.action", {nickName: $("#nickName").val()}, function(data)
	{
		$("#nickWarning").css("display", "inline");
		
		//alert(data=="\r\nfalse");
		if(data=="\r\ntrue")
		{
			//alert(data);
			$("#nickWarning").html("사용 가능한 닉네임입니다.");
			nickDuplicate = true;
		}
		else
		{
			//alert(data);
			$("#nickWarning").html("중복된 닉네임입니다.");
		}
	});
}


</script>

</head>
<body style="font-size: 17px;">
<div style="background-color: #34314c ; height: 115px;" ></div>
<div class="">
	<header>
		<!-- <h1 >헤더</h1> -->
		<jsp:include page="Header.jsp" />
	</header>
</div>

<div class="universal">
<div class="container">
	<section class="content">
	<form action="join.action" id="joinForm" method="get">
		<div class="items">
			<span class="firstItem" >아이디 </span> 
			<input type="text" required="required" id="userId" name="userId"> 
			<input type="hidden" value="${isCheck_id}" id="isCheck_id">
			<input type="button" class="inputBtn" style="padding: 0 0 0 0;" value="중복검사" id="checkId">
			
			<span class="" style="font-size: 9pt; color: red; margin-left: 10px; margin-top: 12px; margin-right:0px; display: none;" id="idWarning">
			</span> 
		</div> 
		
		<div class="items">
			<span class="firstItem" >닉네임 </span> 
			<input type="text" required="required" id="nickName" name="nickName" maxlength="4"> 
			<input type="hidden" value="${isCheck_nick}" id="isCheck_nick">
			<input type="button" class="inputBtn" style="padding: 0 0 0 0;" value="중복검사" id="checkNick">
			
			<span class="" style="font-size: 9pt; color: red; margin-left: 10px; margin-top: 12px; margin-right:0px; display: none;" id="nickWarning">
			</span> 
		</div> 
		
		<div class="items">
			<span class="firstItem" >비밀번호 </span> 
			<input type="password" required="required" id="password" name="password" maxlength="15">
		</div> 
		
		<div class="items">
			<span class="firstItem" >비밀번호 확인 </span> 
			<input type="password" required="required" id="pwdConfirm" name="pwdConfirm" maxlength="15">
		
			<span class="" style="font-size: 9pt; color: red; margin-left: 5px; margin-top: 12px; display: none;" id="pwdWarning">
			 비밀번호와 일치하지 않습니다.</span> 
		</div> 
		
		<div class="items">
			<span class="firstItem" >이름 </span>
			<input type="text" required="required" id="uname" name="uname" value="${uname }" readonly="readonly">
		</div> 
		
		<div class="items">
			<span class="firstItem" >주민등록번호 </span>
			<input type="text" style="width: 138px;" required="required" id="ssdFront" name="ssdFront" value="${ssdFront }" readonly="readonly" maxlength="6">-
			<input type="password" style="width: 138px;" required="required" id="ssdBack" name="ssdBack" value="${ssdBack }" readonly="readonly" maxlength="7">
		</div> 

		<div class="items">
			<span class="firstItem" >주소 </span>
			<input type="text" style="width: 88px;" readonly="readonly" required="required" id="uaddress1" name="uaddress1">
			<input type="button" style="margin-left: 102px; width: 100px;" class="inputBtn" value="우편번호검색" id="adrBtn">
		</div> 
		<div class="items">
			<span class="firstItem" ></span>
			<input type="text" style="width: 300px;" readonly="readonly" id="uaddress2" name="uaddress2">
		</div> 
		<div class="items">
			<span class="firstItem" >상세 주소 </span>
			<input type="text" style="width: 300px;" id="uaddress3" name="uaddress3">
		</div> 
		
		<div class="items" >
			<span class="firstItem" style="text-align: left;" >핸드폰 번호(선택)</span>
			<!-- <input type="text" style="width: 70px;" required="required" id="telephone1" name="telephone1"> -->
			<select style="width: 85px; margin-left: 10px; margin-right: 10px; padding-left: 15x;" required="required" id="telephone1" name="telephone1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="019">019</option>
			</select> -
			<input type="text" style="width: 83px;" required="required" id="telephone2" name="telephone2">-
			<input type="text" style="width: 83px;" required="required" id="telephone3" name="telephone3">
		</div>
		
		<div class="items"><span class="firstItem" >관심 기술 </span> </div>
		
		<div class="items borderDiv" style="width: 580px; flex-direction: column;">
			<div class="items" style="margin-top: 10px;">
			
				<c:set var="i" value="0"/>
				<c:forEach var="sitem" items="${slist }">
					<span style="width: 150px;">
					<input type="checkbox" class="firstItem skId" name="skId" value="${i+1 }" id="${sitem }" style="display: none;">
					<label for="${sitem }" style="margin-left: 10px; margin-right: 15px; margin-top: 10px;">${sitem }</label>
					</span>
					<c:set var="i" value="${i+1 }"/>
					
					<c:if test="${i%3==0 }">
						</div>
						<div class="items" style="margin-top: 10px;">
					</c:if>
					
				</c:forEach>		
			</div>      
		</div>
		<!-- <button type="button" id="testBtn">테스트</button> -->
		
		<div class="items" style="margin-top: 50px;">
			<span class="firstItem" >계좌 번호(선택) </span>
			<span class="far fa-question-circle" style="color: #FFCD12; margin-left: -25px; margin-bottom: -15px;" id="bankQues"></span>
			<span id="accountInfo" style="display:none; margin-top: -25px; margin-left: 5px; z-index: 5; border-radius:10px; width: 320px; height: 50px; background-color: #FFFFC5; 
				padding-top: 10px; padding-left: 10px; ">
			<p style="font-size: 8pt; color: #353535;">
			계좌번호가 없다면 공모전에 참여하실 수 없습니다.<br>
			공모전의 상금이 입금되며,마이페이지에서 수정할 수 있습니다.
			</p>
			</span>
		</div>
		<div class="items" >
			<select id="bkId" name="bkId" style="">
			<c:set var="i" value="1"/>
				<c:forEach var="item" items="${blist }">
					<option value="${i }">${item }</option>
					<c:set var="i" value="${i+1 }"/> 
				</c:forEach>
			</select>
			<input type="text" style="width: 450px;" placeholder="-없이 입력해주세요" id="account" name="account">
		</div>
		
		
		
		<input type="button" class="inputBtn" id="subBtn" style="width:100%; margin-top: 70px" value="회원 가입">
	</form>
	</section>
	
	<footer></footer>
</div>
</div>


</body>
</html>