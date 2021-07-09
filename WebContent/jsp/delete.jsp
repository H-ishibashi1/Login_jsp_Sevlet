<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザー情報削除画面</title>
<style type="text/css">
body,p,form,input{margin: 0}

	#form{
		width: 400px;
		margin: 30px auto;
		padding: 20px;
		border: 1px solid #555;
	}
	
	form p{
		font-size: 14px;
	}
	
	.title{
		text-align: center;
		border-bottom: solid 2px;
		margin-bottom: 20px;
	}
	
	.user,.uId{
		margin-bottom: 20px;
	}
	
	input[type="text"]{
		width: 300px;
		padding: 4px;
		font-size: 14px;
	}
	
	.submit{
		text-align: center;
	}
	
	/* 戻るボタン */
	#back{
		width: 100%;
		text-align: center;
	}
</style>
</head>
<body>
	<div id="form">
		<p class="title">ユーザー情報削除</p>
		<form action="../jp.co.aforce.servlets/delete" method="get">
			<p>ユーザーID</p>
			<p class="uId"><input type="text" name="uId" id="uId" required="required"></p>
			
			<p>ユーザーネーム</p>
			<p class="user"><input type="text" name="user" required="required"></p>
			
			<p class="submit"><input type="submit" value="削除"></p>
		</form>
	</div>
	<div id="back">
		<a href="../jp.co.aforce.servlets/admin"><input type="submit" class="submitAdmin" value="戻る"></a>
	</div>
</body>
</html>