<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

<%@ page import="spring.model1.service.user.vo.UserVO" %>
<%@ page import="spring.model1.service.user.dao.UserDao" %>

<% 
	UserVO userVO = (UserVO)session.getAttribute("userVO");
	if(userVO==null) {
		userVO = new UserVO();
	}
%>

<%
	if(userVO.isActive()) {%>
	<jsp:forward page="home.jsp"/>
<% } %>

<%
	//한글처리
	request.setCharacterEncoding("euc-kr");
	
	//Client Form Data 처리
	String userId = request.getParameter("userId");
	String userPasswd = request.getParameter("userPasswd");
	
	//Navigation 디폴트 페이지 지정
	String targetAction = "/user/logon.jsp";
	
	//Client Form Data Value Object Binding
	userVO.setUserId(userId);
	userVO.setUserPasswd(userPasswd);
	
	//Dao 이용 DB 확인
	UserDao userDao = new UserDao();
	userDao.getUser(userVO);
	
	//로그인 유무 확인
	if(userVO.isActive()) {
		session.setAttribute("userVO",userVO);
		targetAction = "/user/home.jsp";
	}
	%>
	
	<!--  Navigation -->
<jsp:forward page='<%=targetAction %>'/>
