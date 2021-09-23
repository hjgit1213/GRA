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
		//�ѱ��Է� �ȵǰ�
		$("input[name=id]").keyup(function(event) {
			if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^a-z0-9]/gi, ''));

			}
		});
	});
	
	
	$(function() {
		//�ѱ��Է� �ȵǰ�
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
					$("#id_check").text("�̹� ������� ���̵��Դϴ�.");
					$("#id_check").css("color", "red");
					check_id = 1;
				}else{
					if(memberId == ""){
						$("#id_check").text("���̵�� ����,���� 4~12�ڸ��� �����մϴ� :)");
						$("#id_check").css("color", "red");
					}else{
						$("#id_check").text("��밡���� ���̵��Դϴ� :)");
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
					$("#name_check").text("�̹� ������� �г����Դϴ�.");
					$("#name_check").css("color", "red");
					check_name = 1;
				}else{
					if(memberName == ""){
						$("#name_check").text("�г����� �Է����ּ��� :)");
						$("#name_check").css("color", "red");
					}else{						
						$("#name_check").text("��밡���� �г����Դϴ� :)");
						$("#name_check").css("color", "green");
					}
				}
			}
		})
	}
	
	
	function checks(){
		
		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);

		
		if($("#id").val() == ""){
			alert("���̵� �Է����ּ���.");
			$("#id").focus();
			return false;
		}
		if($("#passwd").val() == ""){
			alert("��й�ȣ�� �Է����ּ���.");
			$("#passwd").focus();
			return false;
		}
		if($("#name").val() == ""){
			alert("�г����� �Է����ּ���.");
			$("#name").focus();
			return false;
		}
		if($("#mail").val() == ""){
			alert("�̸����� �Է����ּ���.");
			$("#mail").focus();
			return false;
		}
		
		//�̸��� ��ȿ�� �˻� 		
		if (!getMail.test($("#mail").val())) {
			alert("�̸����� ���Ŀ� �°� �Է����ּ���");
			$("#mail").val("");
			$("#mail").focus();
			return false;
		}
		
		if (check_id = 1) {
			alert("���̵� �ٽ� �ѹ� Ȯ�����ּ���.");
			$("#id").focus();
			return false;
		}
		
		if (check_name = 1) {
			alert("�г����� �ٽ� �ѹ� Ȯ�����ּ���.");
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
			<h3 id="title_h3">ȸ������</h3>
		</td>		
	</tr>
	<tr style="height: 50px;">
		<td id="form_sub">���̵�</td>
		<td id="form_input">
			<input class="form-control" type="text" name="id" id="id" size="30" maxlength="10" minlength="4" onblur="idcheck()" placeholder="���̵� �Է����ּ���. (����, ����, 4~10�ڸ� )">
			<div class="check_font" id="id_check"></div>
		</td>
	</tr>	
	<tr style="height: 50px;" >
		<td id="form_sub">�н�����</td>
		<td id="form_input"><input class="form-control" type="password" name="passwd" id="passwd" size="30" maxlength="20" minlength="8" placeholder="��й�ȣ�� �Է����ּ���. (8~20�ڸ�)"></td>
	</tr>
	<tr style="height: 50px;">
		<td id="form_sub">�г���</td>
		<td id="form_input">
			<input class="form-control" type="text" name="name" id="name" size="30" maxlength="50" minlength="2" onblur="namecheck()" placeholder="����� �г����� �Է����ּ���.">
			<div class="check_font" id="name_check"></div>
		</td>
	</tr>
	<tr style="height: 50px;">
		<td id="form_sub">�̸���</td>
		<td id="form_input"><input class="form-control" type="email" name="mail" id="mail" size="30" maxlength="50" placeholder="�̸����� �Է����ּ���."></td>
	</tr>
	<tr style="height: 50px;">
		<td colspan="2"><input id="form_btn" class="btn btn-danger" style="float: right;" type="submit" value="ȸ������"></td>
	</tr>
	
</table>

</form>
<%@ include file="footer.jsp"%>
</body>
</html>