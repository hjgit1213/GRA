<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>GRA - Game Ranking Analysis</title>
<%@ include file="header.jsp"%>
<style type="text/css">
	#writeTable{
		width: 700px;
		margin: auto;
		margin-top: 100px;
	}
	
	#title_h3, #form_sub, #form_btn {
		font-family: 'GongGothicMedium', sans-serif;
		text-align: center;
	}
	
	#form_sub {
		vertical-align: middle;	
		height: 100px;
		vertical-align: middle;
	}
	
	#form_input{
		vertical-align: middle;
	}
	
	.form-control {
	    display: inline-block;
    }
    
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		//한글입력 안되게
		$("input[name=id]").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^a-z0-9]/gi, ''));

			}
		});
	});
	
	
	$(function() {
		//한글입력 안되게
		$('input[name=mail]').on('keyup', function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^a-z0-9@_.-]/gi, ''));
			}
		});
	});
	
	var check_id = 0;	
	function idcheck() {
		memberId = $('#id').val();

		$.ajax({
			url : "idCheck?id=" + memberId,
			type : "get",
			data : memberId,
			success : function(data) {
						
				if (data == "fail") {
					$("#id_check").text("이미 사용중인 아이디입니다.");
					$("#id_check").css("color", "red");
					check_id = 1;
				}else{
					if(memberId == ""){
						$("#id_check").text("아이디는 영문,숫자 4~12자리만 가능합니다 :)");
						$("#id_check").css("color", "red");
					}else{
						$("#id_check").text("사용가능한 아이디입니다 :)");
						$("#id_check").css("color", "green");
					}
				}
			}
		})
	}
	
	var check_name = 0;
	function namecheck() {
		memberName = $('#name').val();

		$.ajax({
			url : "nameCheck?name=" + memberName,
			type : "get",
			data : memberName,
			success : function(data) {
						
				if (data == "fail") {
					$("#name_check").text("이미 사용중인 닉네임입니다.");
					$("#name_check").css("color", "red");
					check_name = 1;
				}else{
					if(memberName == ""){
						$("#name_check").text("닉네임을 입력해주세요 :)");
						$("#name_check").css("color", "red");
					}else{						
						$("#name_check").text("사용가능한 닉네임입니다 :)");
						$("#name_check").css("color", "green");
					}
				}
			}
		})
	}
	
	
	function checks(){
		
		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);

		
		if($("#id").val() == ""){
			alert("아이디를 입력해주세요.");
			$("#id").focus();
			return false;
		}
		if($("#passwd").val() == ""){
			alert("비밀번호를 입력해주세요.");
			$("#passwd").focus();
			return false;
		}
		if($("#name").val() == ""){
			alert("닉네임을 입력해주세요.");
			$("#name").focus();
			return false;
		}
		if($("#mail").val() == ""){
			alert("이메일을 입력해주세요.");
			$("#mail").focus();
			return false;
		}
		
		//이메일 유효성 검사 		
		if (!getMail.test($("#mail").val())) {
			alert("이메일을 형식에 맞게 입력해주세요");
			$("#mail").val("");
			$("#mail").focus();
			return false;
		}
		
		if (check_id = 1) {
			alert("아이디를 다시 한번 확인해주세요.");
			$("#id").focus();
			return false;
		}
		
		if (check_name = 1) {
			alert("닉네임을 다시 한번 확인해주세요.");
			$("#name").focus();
			return false;
		}
	}
</script>
</head>
<body>

<form action="join" method="post" onsubmit="return checks()">
<table class="table table-bordered" id="writeTable">
	<tr style="height: 50px;">
		<td colspan="2">
			<h3 id="title_h3">회원가입</h3>
		</td>		
	</tr>
	<tr style="height: 50px;">
		<td id="form_sub">아이디</td>
		<td id="form_input">
			<input class="form-control" type="text" name="id" id="id" size="30" maxlength="10" minlength="4" onblur="idcheck()" placeholder="아이디를 입력해주세요. (영문, 숫자, 4~10자리 )">
			<div class="check_font" id="id_check"></div>
		</td>
	</tr>	
	<tr style="height: 50px;" >
		<td id="form_sub">패스워드</td>
		<td id="form_input"><input class="form-control" type="password" name="passwd" id="passwd" size="30" maxlength="20" minlength="8" placeholder="비밀번호를 입력해주세요. (8~20자리)"></td>
	</tr>
	<tr style="height: 50px;">
		<td id="form_sub">닉네임</td>
		<td id="form_input">
			<input class="form-control" type="text" name="name" id="name" size="30" maxlength="50" minlength="2" onblur="namecheck()" placeholder="사용할 닉네임을 입력해주세요.">
			<div class="check_font" id="name_check"></div>
		</td>
	</tr>
	<tr style="height: 50px;">
		<td id="form_sub">이메일</td>
		<td id="form_input"><input class="form-control" type="email" name="mail" id="mail" size="30" maxlength="50" placeholder="이메일을 입력해주세요."></td>
	</tr>
	<tr style="height: 50px;">
		<td colspan="2"><input id="form_btn" class="btn btn-danger" style="float: right;" type="submit" value="회원가입"></td>
	</tr>
	
</table>

</form>
<%@ include file="footer.jsp"%>
</body>
</html>