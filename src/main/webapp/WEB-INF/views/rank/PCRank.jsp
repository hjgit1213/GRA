<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<title>GRA - Game Ranking Analysis</title>
<style type="text/css">
.table{
	width: 70%;
	margin: auto;
	font-family: 'GongGothicMedium', sans-serif;
	font-size: 10pt;
}
#list_table{
    width: 50%;
    max-width: 100%;
    margin-top: 100px;
}

#page{
	text-align: center;
}

#search_input{
	width: 20%;
    display: inline;
    vertical-align: middle;
}


</style>
<%@ include file="header.jsp"%>
</head>

<body>
<table class="table table-hover" id="list_table">
	
	<tr>
		<th style="width: 10%; text-align: center; ">����</th>
		<th style="width: 10%">�̹���</th>
		<th style="width: 35%">�̸�</th>
		<th style="width: 25%">���ۻ�</th>
		<th style="width: 10%">�帣</th>
		<th style="width: 8%">������</th>
	</tr>
	<c:forEach var="PCRank"  items="${PCRank}" varStatus="status">
		<tr>
			<td style="vertical-align: middle; font-size: 15pt; text-align: center;">${status.count}��</td>
			<td style="vertical-align: middle;"><img src="resources/image/PC/<c:out value='${PCRank.image}'/>" width="80" height="80"></td>
			<td style="vertical-align: middle;"><a href="${PCRank.link }" target="_blank" data-toggle="tooltip" data-placement="right" title="Ŭ�� �� ���Ļ���Ʈ�� �̵��մϴ�.">${PCRank.name}</a></td>
			<td style="vertical-align: middle;">${PCRank.game_company}</td>
			<td style="vertical-align: middle;">${PCRank.game_type}</td>
			<td style="vertical-align: middle;">${PCRank.m_share}%</td>
		</tr>	
	</c:forEach>
	<tr>
		<td colspan="6">��ó : ���α� (https://www.thelog.co.kr/index.do)</td>
	</tr>
</table>

</body>
<%@ include file="footer.jsp"%>
</html>