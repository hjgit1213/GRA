<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ page import="spring.my.project.PageNumberingManager"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">


<title>�ڷ��</title>
<style type="text/css">
.table{
	width: 70%;
	margin: auto;
}
#list_table{
    width: 50%;
    max-width: 100%;
    margin-top: 50px;
}

#page{
	text-align: center;
}

#search_input{
	width: 20%;
    display: inline;
    vertical-align: middle;
}

#h1{
	font-family: 'GongGothicMedium', sans-serif;
}

</style>
<%@ include file="header.jsp"%>
</head>

<c:set var="current_page" value="${current_page}" />
<c:set var="total_cnt" value="${totalCnt}" />

<body>
<h1 id="h1" style="text-align: center; margin-top: 100px;">�ڷ��</h1>
<table class="table table-hover" id="list_table">
	<tr>
		<td colspan="4">�ѰԽù� �� [<c:out value="${total_cnt}" />]</td>
		<td>���������� [<c:out value="${current_page}" />]</td>
	</tr>
	
	<tr>
		<th style="width: 7%">�۹�ȣ</th>
		<th style="width: 10%">�ۼ���</th>
		<th style="width: 35%">����</th>
		<th style="width: 20%">�����</th>
		<th style="width: 8%">��ȸ��</th>
	</tr>
	
	<c:forEach  var="board"  items="${fileList}">
		<tr>
			<td>${board.id_num}</td>
			<td>${board.name} </td>
			<td><a href="fileView?id_num=${board.id_num}&current_page=${current_page}&searchStr=">${board.subject}</a></td>
			<td>${board.create_date} </td>
			<td>${board.hits} <br></td>	
		</tr>	
	</c:forEach>
	
	<tr>
		<td id="page" colspan="5">
		<!-- ����¡ �غ� -->   
		<%
			int rowsPerPage = 10 ; //������ ������ ����
			int total_cnt = ((Integer)(pageContext.getAttribute("total_cnt"))).intValue();
			
			//��ü ������
			int total_pages = PageNumberingManager.getInstance().getTotalPage(total_cnt, rowsPerPage);
			pageContext.setAttribute("t_pages",total_pages);
		%>
		<!-- ����¡ ó�� -->
		<c:forEach var="i" begin="1" end="${t_pages}">
			<a href="fileList?current_page=${i}&searchStr=<c:out value="${searchStr}"/>">
			[
			<b><c:if test="${i==c_page}"></c:if>
			${i}
			<c:if test="${i==c_page}"></c:if></b>
			]</a>
		</c:forEach>
		</td>
	</tr>
	<tr>
		<td>
			<a class="btn btn-default" href="fileWriteForm">�۾���</a>
		</td>
		<td colspan="4" style="text-align: right;">
			<form action="fileSearch" method="post">			
				<input class="form-control" id="search_input" type="text" name="searchStr" size="50" maxlength="100">
				<input type="hidden" name="current_page" value="${current_page}">
				<input type="submit" class="btn btn-default" value="�˻�">
			</form>
		</td>
	</tr>
	
</table>

</body>
<%@ include file="footer.jsp"%>
</html>