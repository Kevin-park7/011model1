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
	//�ѱ�ó��
	request.setCharacterEncoding("euc-kr");
	
	//Client Form Data ó��
	String userId = request.getParameter("userId");
	String userPasswd = request.getParameter("userPasswd");
	
	//Navigation ����Ʈ ������ ����
	String targetAction = "/user/logon.jsp";
	
	//Client Form Data Value Object Binding
	userVO.setUserId(userId);
	userVO.setUserPasswd(userPasswd);
	
	//Dao �̿� DB Ȯ��
	UserDao userDao = new UserDao();
	userDao.getUser(userVO);
	
	//�α��� ���� Ȯ��
	if(userVO.isActive()) {
		session.setAttribute("userVO",userVO);
		targetAction = "/user/home.jsp";
	}
	%>
	
	<!--  Navigation -->
<jsp:forward page='<%=targetAction %>'/>
