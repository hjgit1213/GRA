<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
/* ��ü�������� ������ ������ */
	* {
		margin: 0;
		padding: 0;
	}
/* ul li�±׿� ����Ʈ ��Ÿ���� ���� */
	ul li{
		list-style: none;
	}
/* a�±׿� �ؽ�Ʈ ������ ���ְ� ������ #333 */
	a {
		text-decoration: none;
		color:#333;
	}
/* ����ũ�⸦ 16px ���� ��� �����ϰ� width���� 700, ���� 50��ŭ ������ #ccc, ���ڻ��� ������, ���γ���50px
menu�ڽ� �������, ���ڰ�� ���� */
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

/* menu�±� �ڽ��� ul�� �ڽ� li�� �������İ� ���� 140���� */
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
		<li><a href="PCRank">����PC���ӷ�ŷ</a></li>
		<li><a href="mobileRank">��������ϰ��ӷ�ŷ</a></li>

		<li><a>Ŀ�´�Ƽ</a>
			<ul>
				<li><a href="freeList?current_page=1">�����Խ���</a></li>
				<li><a href="fileList?current_page=1">�ڷ��</a></li>
			</ul>
		</li>
	</ul>
</div>
</body>
</html>