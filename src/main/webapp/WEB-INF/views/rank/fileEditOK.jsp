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
			alert('  ���� ���� �Ǿ����ϴ�. ');
			location.href = 'fileList?current_page=1';
		</script>
	</c:if>
	<c:if test="${result!=1}">
		<script type="text/javascript">
			alert('�� ������ �����Ͽ����ϴ�.');
			history.back();
		</script>
	</c:if>
</body>
</html>