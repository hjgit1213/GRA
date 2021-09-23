<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
/* 전체영역에서 여백을 없애줌 */
	* {
		margin: 0;
		padding: 0;
	}
/* ul li태그에 리스트 스타일을 없앰 */
	ul li{
		list-style: none;
	}
/* a태그에 텍스트 밑줄을 없애고 색상을 #333 */
	a {
		text-decoration: none;
		color:#333;
	}
/* 글자크기를 16px 맑은 고딕 굵게하고 width넓이 700, 높이 50만큼 배경색은 #ccc, 글자색은 검정색, 라인높이50px
menu박스 가운데정렬, 글자가운데 정렬 */
	#menu {
		font: 18px "GongGothicMedium";
	    width: 100%;
	    height: 50px;
	    background: black;
	    color: black;
	    line-height: 50px;
	    margin: 0 auto;
	    text-align: center;
	}

/* menu태그 자식의 ul의 자식 li를 왼쪽정렬과 넓이 140설정 */
	#menu > ul > li {
		float:left;
		width:400px;
		position:relative;
	}
	
	#menu > ul > li > ul {
		width:400px;
		/*display:none;*/
		visibility: hidden;
		position: absolute;
		font-size:16px;
		background: #860000;
		opacity: 0.7;
	}
	
	#menu > ul > li:hover > ul {
		visibility: visible;
	}
</style>

</head>
<body>
<div id="menu">
	<ul style="width: 1200px; margin: auto;">
		<li><a href="PCRank">월간PC게임랭킹</a></li>
		<li><a href="mobileRank">월간모바일게임랭킹</a></li>

		<li><a>커뮤니티</a>
			<ul>
				<li><a href="freeList?current_page=1">자유게시판</a></li>
				<li><a href="fileList?current_page=1">자료실</a></li>
			</ul>
		</li>
	</ul>
</div>
</body>
</html>