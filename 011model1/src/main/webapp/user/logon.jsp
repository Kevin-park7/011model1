<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

<%@ page import="spring.model1.service.user.vo.UserVO" %>

<% 
	UserVO userVO = (UserVO)session.getAttribute("userVO");
%>

<html>
<head></head>
<body>
		
<h2>Login 화면</h2>
		
	<%	if(userVO==null||userVO.isActive()!=true){%>
	
		<form id = "login" method="post" action="/011model1/user/logonAction.jsp">
		
			아 이 디 : <input id="userId" type="text" name="userId" value=""><br><br/>
			패스워드 : <input id="userId" type="text" name="userPasswd" value=""><br><br/>
			<input id="submit" type="submit" name="submit" value="Enter"/>
			
		</form>
	
	<%} else {%>
		
		<%= userVO.getUserId() %>님은 이미 로그인 하셨습니다.
			
	<%}%>
		

</body>
</html>
	