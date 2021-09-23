<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result==1}">
		<script type="text/javascript">
			alert('  글이 수정 되었습니다. ');
			location.href = 'fileList?current_page=1';
		</script>
	</c:if>
	<c:if test="${result!=1}">
		<script type="text/javascript">
			alert('글 수정에 실패하였습니다.');
			history.back();
		</script>
	</c:if>
</body>
</html>