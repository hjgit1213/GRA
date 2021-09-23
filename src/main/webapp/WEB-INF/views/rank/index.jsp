<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>GRA - Game Ranking Analysis</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<%@ include file="header.jsp"%>
<script type="text/javascript">
$('.btn.danger').button('toggle').addClass('fat')
$('.carousel').carousel()
</script>

<style type="text/css">
	body{
		font-family: 'GongGothicMedium', sans-serif;
	}
	
	.table{
		width: 70%;
		margin: auto;
		font-family: 'GongGothicMedium', sans-serif;
		font-size: 10pt;
	}
	
	#list_table{
	    width: 100%;
	    max-width: 100%;
	    display: inline-block;
	}
	
	#page{
		text-align: center;
	}
	
	#search_input{
		width: 20%;
	    display: inline;
	    vertical-align: middle;
	}
	
	.carousel{
		width: 55%;
		margin: auto;
	}
	
	.thumb{
		margin: auto;
		width: 100%;
	}
	
</style>
</head>
<body>
<br>
<br>
<br>
<h1 style="text-align: center;">8�� ȭ���� ����</h1>
<br>
	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0"
				class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			<li data-target="#carousel-example-generic" data-slide-to="3"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img class="thumb" src="resources/image/thumb/league of legends3.jpg" alt="...">
				<div class="carousel-caption">
					<h2>���� ���� ������</h2>
					<p>���̾������� / RTS</p>
				</div>
			</div>
			<div class="item">
				<img class="thumb" src="resources/image/thumb/battleground.jpg">
				<div class="carousel-caption">
					<h2>��Ʋ�׶���</h2>
					<p>īī��,���� / FPS</p>
				</div>
			</div>
			<div class="item">
				<img class="thumb" src="resources/image/thumb/brawl stars.jpg">
				<div class="carousel-caption">
					<h2>��ѽ�Ÿ��</h2>
					<p>Supercell / �׼�</p>
				</div>
			</div>
			<div class="item">
				<img class="thumb" src="resources/image/thumb/cookierun kingdom.jpg">
				<div class="carousel-caption">
					<h2>��Ű�� ŷ��</h2>
					<p>Devsisters / ���÷���</p>
				</div>
			</div>
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"> <span
			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	
	<table style="margin: auto; width: 55%; margin-top: 100px; text-align: center;">
	
	<tr>
		<td><h1>PC TOP 10</h1></td>
		<td><h1>Mobile TOP 10</h1></td>
	</tr>
	<tr>
		<td width="50%">
			<table class="table table-hover" id="list_table" style="padding-right: 40px;">		
			<tr>
				<th style="text-align: center; ">����</th>
				<th style="text-align: center;">�̸�</th>
				<th style="text-align: center;">���ۻ�</th>
				<th style="text-align: center;">�帣</th>
			</tr>
			<c:forEach var="PCRank"  items="${PCRank}" varStatus="status" end="9">
				<tr>
					<td style="vertical-align: middle; font-size: 13pt; text-align: center;">${status.count}��</td>
					<td style="vertical-align: middle;">${PCRank.name}</td>
					<td style="vertical-align: middle;">${PCRank.game_company}</td>
					<td style="vertical-align: middle;">${PCRank.game_type}</td>
				</tr>	
			</c:forEach>
			<tr>
				<td colspan="5" style="width: 109%;">��ó : ���α� (https://www.thelog.co.kr/index.do)</td>
			</tr>
			
			</table>
		</td>
		
		<td width="50%">
			<table class="table table-hover" id="list_table" style="padding-left: 40px;">	
				<tr>
					<th style="text-align: center;">����</th>
					<th style="text-align: center;">�̸�</th>
					<th style="text-align: center;">���ۻ�</th>
					<th style="text-align: center;">�帣</th>
				</tr>
				<c:forEach var="mobileRank"  items="${mobileRank}" varStatus="status" end="9">
					<tr>
						<td style="vertical-align: middle; font-size: 13pt; text-align: center;">${status.count}��</td>
						<td style="vertical-align: middle;">${mobileRank.name}</td>
						<td style="vertical-align: middle;">${mobileRank.game_company}</td>
						<td style="vertical-align: middle;">${mobileRank.game_type}</td>
					</tr>	
				</c:forEach>
				<tr>
					<td colspan="5" style="width: 102.5%;">��ó : ����� �ε��� (https://www.mobileindex.com/home)</td>
				</tr>
			</table>
		</td>		
	</table>
</body>
<%@ include file="footer.jsp"%>
</html>