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
<title>�ڷ��</title>
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
		out.println("<script>alert('�α����� �ʿ��� ���� �Դϴ�. \\n�α��� �� �̿����ּ���.');</script>");
		out.println("<script>location.href='login';</script>");
	}else{
%>
<table class="table table-bordered" id="writeTable">
	<tr>
		<td colspan="4">
			<h3 id="title_h3">�� �󼼺���</h3>
		</td>		
	</tr>
	
	<tr>
		<td id="form_sub">�۹�ȣ</td>
		<td id="form_val">${fileBean.id_num}</td>
		<td id="form_sub">�ۼ���</td>
		<td id="form_val">${fileBean.name}</td>
	</tr>
	<tr>
		<td id="form_sub">�Խó�¥</td>
		<td id="form_val">${fileBean.create_date}</td>
		<td id="form_sub">��ȸ��</td>
		<td id="form_val">${fileBean.hits}</td>
	</tr>
	<tr>
		<td id="form_sub">����</td>
		<td colspan="3">${fileBean.subject}</td>
	</tr>
	<tr>
		<td id="form_sub">����</td>
		<td colspan="3" style="height: 450px;"><pre>${fileBean.content}</pre></td>
	</tr>
	<c:if test="${fileBean.fileName != null}">
			<tr>
				<td id="form_sub">÷������</td>
				<td colspan="3"><a href="fileDownload?fileName=${fileBean.fileName}&originFileName=${fileBean.realFileName}">${fileBean.realFileName}</a></td>
			</tr>
	</c:if>
	<tr>
		<td colspan="4" style="text-align: center;">
			<c:set var="s_name" value="<%=session_user.getName()%>"></c:set>
			<c:if test= "${fileBean.name == s_name}" >
				<input type="button" class="btn btn-default" id="form_btn" value="�ۼ����ϱ�" onclick="editSend()" > &nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-default" id="form_btn" value="�ۻ����ϱ�" onclick="deleteSend()" > &nbsp;&nbsp;&nbsp;
			</c:if>
			<input type="button" class="btn btn-default" id="form_btn" value="����������" onclick="listSend()" >
		</td>
	</tr>
</table>

<%
	}
%>

</body>
<%@ include file="footer.jsp"%>
</html>