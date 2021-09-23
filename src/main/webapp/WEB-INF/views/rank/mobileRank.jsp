<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ page import="spring.my.project.PageNumberingManager"%>
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
		<th style="width: 7%; text-align: center;">순위</th>
		<th style="width: 10%">이미지</th>
		<th style="width: 35%">이름</th>
		<th style="width: 25%">제작사</th>
		<th style="width: 15%">장르</th>
	</tr>
	<c:forEach var="mobileRank"  items="${mobileRank}" varStatus="status">
		<tr>
			<td style="vertical-align: middle; font-size: 15pt; text-align: center;">${status.count}위</td>
			<td style="vertical-align: middle;"><img src="resources/image/mobile/<c:out value='${mobileRank.image}'/>" width="80" height="80"></td>
			<td style="vertical-align: middle;">${mobileRank.name}</td>
			<td style="vertical-align: middle;">${mobileRank.game_company}</td>
			<td style="vertical-align: middle;">${mobileRank.game_type}</td>
		</tr>	
	</c:forEach>
	<tr>
		<td colspan="5">출처 : 모바일 인덱스 (https://www.mobileindex.com/home)</td>
	</tr>
</table>
</body>
<%@ include file="footer.jsp"%>
</html>