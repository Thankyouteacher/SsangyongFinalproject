<%@page import="com.team1.pro.ing.FileManager"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); // 서블릿 컨텍스트페쓰

%>
<%
	String root = request.getServletContext().getRealPath("/");

	String saveFileName = request.getParameter("saveFileName");
	String originalFileName = request.getParameter("originamFileName");

	String savePath = root + File.separator + "reportFile" + File.separator + "report";
	
	System.out.println(savePath);
	
	
	
	out.clear();
	out = pageContext.pushBody(); // 안정성 확보를 위한 추가 코드
								  // 원래는 얘가 default 로 실행됐었다.
	
	// 파일 다운로드
	boolean flag = FileManager.doFileDownload(saveFileName, originalFileName, savePath, response);
	
	
	/* 
		JSP 파일에서 Download 기능을 구현하거나 이와 관련한 유사한 기능을 적용하는
		과정에서 자주 발생하는 에러가 있다.
		
		『java.lang.IllegalStateException: 이 응답을 위해 getOutputStream()이 이미 호출되었습니다.』
		
		이 에러는 
		『OutputStream os = response.getOuputStream();』
		구문과 관련된 예외이며,
		
		이 같은 상황 발생 시 JspWriter 인 『out.clear();』를
		『OutputStream os = response.getOuputStream();』 구문에 대한 처리를 
		수행하기 전에 먼저 처리해 주면 된다.
		
		이전에 ouputStream 을 사용했던 리소스(doFileDownload 메소드)를 그대로 로그로 가지고 있기 때문에 이를 비워줘야 한다.
		
	*/
	
	
%>