<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員登録画面</title>
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
	
	.user,.pass{
		margin-bottom: 20px;
	}
	
	input[type="text"],
	input[type="password"] {
		width: 300px;
		padding: 4px;
		font-size: 14px;
	}
	
	.submit{
		text-align: center;
	}
</style>
</head>
<body>
	<div id="form">
		<form action="../jp.co.aforce.servlets/insert" method="get">
			<p class="title">会員登録</p>
			
			<p>ユーザーネーム</p>
			<p class="user"><input type="text" name="insertUser" required="required"></p>
			
			<p>パスワード</p>
			<p class="pass">
				<input type="password" name="insertPass" id="insertPass" required="required">
				<button id="btn_passview">表示</button>
			</p>
			
			<p class="submit"><input type="submit" value="登録"></p>
		</form>
	</div>
	
	<script type="text/javascript">
	window.addEventListener('DOMContentLoaded', function(){

		  // (1)パスワード入力欄とボタンのHTMLを取得
		  let btn_passview = document.getElementById("btn_passview");
		  let insertPass = document.getElementById("insertPass");

		  // (2)ボタンのイベントリスナーを設定
		  btn_passview.addEventListener("click", (e)=>{

		    // (3)ボタンの通常の動作をキャンセル（フォーム送信をキャンセル）
		    e.preventDefault();

		    // (4)パスワード入力欄のtype属性を確認
		    if( insertPass.type === 'password' ) {

		      // (5)パスワードを表示する
		      insertPass.type = 'text';
		      btn_passview.textContent = '非表示';

		    } else {

		      // (6)パスワードを非表示にする
		      insertPass.type = 'password';
		      btn_passview.textContent = '表示';
		    }
		  });

		});
	</script>
</body>
</html>