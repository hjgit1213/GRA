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
			location.href = 'freeView?id_num=${id_num}&current_page=${current_page}&searchStr=${searchStr}';
		</script>
	</c:if>
	<c:if test="${result!=1}">
		<script type="text/javascript">
			alert('  �� ������ �����Ͽ����ϴ�.    ');
			history.back();
		</script>
	</c:if>
</body>
</html>