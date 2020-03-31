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
<title>Insert title here</title>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">	
		$(document).ready(function()
		{
			str = null;
			
			$("#findList").click(function()
			{
				findCategory = $("#findCategory").val();
			    findValue = $("#findValue").val();
				
				if(findCategory == "skName")
					str = 'findlistfinish.action?acContent=null&suContent=null&skContent=' + findValue;
				else if(findCategory == "acName")
					str = 'findlistfinish.action?suContent=null&skContent=null&acContent=' + findValue;
				else if(findCategory == "sname")
					str = 'findlistfinish.action?skContent=null&acContent=null&suContent=' + findValue;
				else
					str = 'findlistfinish.action?findCategory=' + findCategory + "&findValue=" + findValue;
				
			    $(location).attr('href', str);
			 });
		});
</script>
</head>
<body>
	<div class="float-right">
	<form name="searchForm" method="post" style="display: flex; margin-left: 1500px; width: 325px;">
		<select name="findCategory" class="col-md-5" id="findCategory" class="findCategory">
            <option id="rname" value="rname">방제</option>
            <option id="sname" value="sname">주제</option>
            <option id="acName" value="acName">칭호</option>
            <option id="nickName" value="nickName">작성자</option>
            <option id="gselect" value="gselect">성별</option>
            <option id="ppDate" value="ppDate">시작일</option>
            <option id="peDate" value="peDate">종료일</option>
            <option id="properiod" value="properiod">기간</option>
            <option id="minLevel" value="minLevel">최소레벨</option>
            <option id="maxLevel" value="maxLevel">최대레벨</option>
            <option id="peoCount" value="peoCount">모집인원</option>
            <option id="paddress" value="paddress">지역</option>
            <option id="onRate" value="onRate">온라인비율</option>
            <option id="skName" value="skName">필요기술</option>
		</select>
		<div style="display: flex;">  
			<input id="findValue" name="findValue" type="text" class="form-control col-md-5" placeholder="Search" style="background-color: rgba( 255, 255, 255, 0.5 ); pointer-events: auto; width: 200px;">
			<i class="fas fa-search fa-2x" id="findList" style="color: #34314c"></i>			
		</div>
	</form>
	</div>
</body>
</html>