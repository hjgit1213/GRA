<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>자유게시판 글 수정하기</title>
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
</style>

</head>
<body>
<%-- <form action="freeEdit?current_page=${current_page}" method="post">
	<input type="hidden" value="${freeBean.id_num }" name="id_num">
	제목: <input type="text" value="${freeBean.subject }" name="subject" id="subjects" size="50" maxlength="100"> <br>
	내용: <textarea rows="5" name="content" id="content" cols="50" maxlength="500">${freeBean.content }</textarea><br>
	<input type="submit" value="글쓰기">
</form> --%>

<form action="freeEdit?current_page=${current_page}" method="post">
	<input type="hidden" value="${freeBean.id_num }" name="id_num">
	<table class="table table-bordered" id="writeTable">
		<tr>
			<td colspan="2">
				<h3 id="title_h3">자유게시판 글 수정하기</h3>
			</td>		
		</tr>
		<tr>
			<td id="form_sub">제목</td>
			<td><input class="form-control"  value="${freeBean.subject }" type="text" name="subject" id="subject" size="50" maxlength="100"></td>
		</tr>
		<tr>
			<td id="form_sub">내용</td>
			<td><textarea class="form-control" rows="20" name="content" id="content" maxlength="500" wrap="hard">${freeBean.content }</textarea></td>
		</tr>
		<tr>
			<td colspan="2"><input id="form_btn" class="btn btn-danger" style="float: right;" type="submit" value="수정하기"></td>
		</tr>
		
	</table>
</form>
</body>
<%@ include file="footer.jsp"%>
</html>