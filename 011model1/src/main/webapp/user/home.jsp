<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

<%@ page import="spring.model1.service.user.vo.UserVO" %>


<% 
	UserVO userVO = (UserVO)session.getAttribute("userVO");
	
%>

<!-- �̷α��� ȸ�� -->
<%
	if(userVO==null||!userVO.isActive()){%>
		<jsp:forward page="logon.jsp"/>
	<%}%>
	
<!-- �α��� ȸ�� -->
	
<html>
	<head></head>
	<body>
		<p>Simple Model2 Examples</p>
		<p> ȯ���մϴ�. : <%=userVO.getUserId() %>��</p>
	</body>
</html>