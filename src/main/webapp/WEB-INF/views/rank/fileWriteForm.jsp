<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>자료실 글쓰기</title>
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
<c:if test="${member.id==null}">
	<script type="text/javascript">
		alert("로그인이 필요한 서비스입니다.");
		location.href="login";
	</script>
</c:if>
<form action="fileWriteForm" method="post" enctype="multipart/form-data">
<table class="table table-bordered" id="writeTable">
	<tr>
		<td colspan="2">
			<h3 id="title_h3">자료실 글 작성하기</h3>
		</td>		
	</tr>
	<tr>
		<td id="form_sub">제목</td>
		<td><input class="form-control" type="text" name="subject" id="subjects" size="50" maxlength="100"></td>
	</tr>
	<tr>
		<td id="form_sub">첨부파일</td>
		<td><input class="form-control" type="file" name="uploadFile" id="uploadFile" size="50" maxlength="100"></td>
	</tr>
	<tr>
		<td id="form_sub">내용</td>
		<td><textarea class="form-control" rows="20" name="content" id="content" maxlength="500" wrap="hard"></textarea></td>
	</tr>
	<tr>
		<td colspan="2"><input id="form_btn" class="btn btn-danger" style="float: right;" type="submit" value="글쓰기"></td>
	</tr>
	
</table>
<input type="hidden" value="${member.name}" name="name">
</form>
</body>
<%@ include file="footer.jsp"%>
</html>