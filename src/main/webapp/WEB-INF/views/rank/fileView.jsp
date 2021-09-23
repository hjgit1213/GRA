<%@page import="javax.tools.DocumentationTool.Location"%>
<%@page import="spring.my.project.RankBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>자료실</title>
<script type="text/javascript">
	function editSend() {	
		location.href="fileEdit?id_num=${id_num}&current_page=${current_page}&fileName=${fileBean.fileName}";	
	}
	
	function deleteSend() {
		
		location.href="fileDelete?id_num=${id_num}&current_page=${current_page}&fileName=${fileBean.fileName}";
	}
	function listSend() {
		
		location.href="javascript:history.back();";
	}
</script>
<%@ include file="header.jsp"%>
<style type="text/css">
	#writeTable{
		width: 50%;
		margin: auto;
		margin-top: 100px;
	}
	
	#title_h3, #form_sub, #form_btn {
		font-family: 'GongGothicMedium', sans-serif;
		text-align: center;
	}
	
	#form_sub {
		vertical-align: middle;
	}
	
	#form_val, #form_sub{
		width: 25%;
	}
</style>
</head>
<body>
<%
	RankBean session_user = (RankBean)session.getAttribute("member"); 
	//String ss= (String)session.getAttribute("member");
	if(session_user == null){
		out.println("<script>alert('로그인이 필요한 서비스 입니다. \\n로그인 후 이용해주세요.');</script>");
		out.println("<script>location.href='login';</script>");
	}else{
%>
<table class="table table-bordered" id="writeTable">
	<tr>
		<td colspan="4">
			<h3 id="title_h3">글 상세보기</h3>
		</td>		
	</tr>
	
	<tr>
		<td id="form_sub">글번호</td>
		<td id="form_val">${fileBean.id_num}</td>
		<td id="form_sub">작성자</td>
		<td id="form_val">${fileBean.name}</td>
	</tr>
	<tr>
		<td id="form_sub">게시날짜</td>
		<td id="form_val">${fileBean.create_date}</td>
		<td id="form_sub">조회수</td>
		<td id="form_val">${fileBean.hits}</td>
	</tr>
	<tr>
		<td id="form_sub">제목</td>
		<td colspan="3">${fileBean.subject}</td>
	</tr>
	<tr>
		<td id="form_sub">내용</td>
		<td colspan="3" style="height: 450px;"><pre>${fileBean.content}</pre></td>
	</tr>
	<c:if test="${fileBean.fileName != null}">
			<tr>
				<td id="form_sub">첨부파일</td>
				<td colspan="3"><a href="fileDownload?fileName=${fileBean.fileName}&originFileName=${fileBean.realFileName}">${fileBean.realFileName}</a></td>
			</tr>
	</c:if>
	<tr>
		<td colspan="4" style="text-align: center;">
			<c:set var="s_name" value="<%=session_user.getName()%>"></c:set>
			<c:if test= "${fileBean.name == s_name}" >
				<input type="button" class="btn btn-default" id="form_btn" value="글수정하기" onclick="editSend()" > &nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-default" id="form_btn" value="글삭제하기" onclick="deleteSend()" > &nbsp;&nbsp;&nbsp;
			</c:if>
			<input type="button" class="btn btn-default" id="form_btn" value="이전페이지" onclick="listSend()" >
		</td>
	</tr>
</table>

<%
	}
%>

</body>
<%@ include file="footer.jsp"%>
</html>