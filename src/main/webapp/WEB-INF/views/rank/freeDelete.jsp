<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result==1}">
		<script type="text/javascript">
			alert('�����Խ��� ���� �����Ǿ����ϴ�.');
			location.href = 'freeList?current_page=${current_page}';
		</script>
	</c:if>
	<c:if test="${result!=1}">
		<script type="text/javascript">
			alert('�����Խ��� �� ������ �����Ͽ����ϴ�.');
			history.back();
		</script>
	</c:if>
</body>
</html>