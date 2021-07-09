<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="get" action="">
		<label for="input_color">パスワード</label> <input type="password"
			id="input_pass" name="input_pass" value="">
		<button id="btn_passview">表示</button>
	</form>
	<script type="text/javascript">
	window.addEventListener('DOMContentLoaded', function(){

		  // (1)パスワード入力欄とボタンのHTMLを取得
		  let btn_passview = document.getElementById("btn_passview");
		  let input_pass = document.getElementById("input_pass");

		  // (2)ボタンのイベントリスナーを設定
		  btn_passview.addEventListener("click", (e)=>{

		    // (3)ボタンの通常の動作をキャンセル（フォーム送信をキャンセル）
		    e.preventDefault();

		    // (4)パスワード入力欄のtype属性を確認
		    if( input_pass.type === 'password' ) {

		      // (5)パスワードを表示する
		      input_pass.type = 'text';
		      btn_passview.textContent = '非表示';

		    } else {

		      // (6)パスワードを非表示にする
		      input_pass.type = 'password';
		      btn_passview.textContent = '表示';
		    }
		  });

		});
	</script>
</body>
</html>