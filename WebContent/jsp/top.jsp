<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>トップ画面</title>
<style type="text/css">
	/* 一番上の余白を消す(デフォルトでは8pxで設定されている) */
	*{
		margin: 0px;
		padding: 0px;
	}
	
	/* div全体の設定 */
	#global{
		position: fixed;
		width: 100%;
		height: 50px;
		border-bottom: solid 2px #f00;
		background-color: #fff;
		text-align: center;
		z-index: 100;
	}
	
	/* 各ラベルへの設定 */
	.name{
		position: absolute;
		top: 10px;
		left: 20px;
	}
	
	.user{
		position: relative;
		top: 10px;
	}
	
	/* 2つのinputタグ共通の設定 */
	input[type="submit"]{
		top:10px;
		position: absolute; 
	}
	
	/* 各inputタグの設定 */
	.submitIn{
		right: 120px;
	}
	
	.submitOut{
		right: 20px;
	}
	
	/* 商品テーブル用 */
	.ramen{
		position: relative;
		top: 80px;
		margin-bottom: 30px;
		text-align: center;
	}
	
	table{
		text-align: center;
		margin-left: auto;
		margin-right: auto;
		border-spacing: 50px 10px;/* tdの間隔指定 左右 上下 */
	}
	
	table td{
		text-align: center;
	}

	
</style>
</head>
<body>
		<%@page import = "jp.co.aforce.bean.User, java.util.List" %>
	
		<% 
			HttpSession ses = request.getSession();
			List<User> list = (List<User>)ses.getAttribute("LIST");
		%>

	<div id="global">

		
		<label class="name">店名</label>
		
		<%if(list == null){%>
			<label class="user">ようこそ、ゲストさん！</label>
		<% 
			}else{
				for(User u : list){ 
		%>
				<label class="user">ようこそ、<%=u.getUser() %>さん！</label>
		<%
			}
		}
		%>
		
		<a href="../jp.co.aforce.servlets/login"><input type="submit" class="submitIn" value="ログイン"></a>
		<a href="../jp.co.aforce.servlets/logout"><input type="submit" class="submitOut" value="ログアウト"></a>
		
	</div>
	<div class="ramen">
		<h2>醤油ラーメン</h2>
		<table>
			<tr>
				<td><img alt="醤油ラーメン" src="../img/醤油ラーメン.jpeg" width="auto" height="250"></td>
				<td><img alt="醤油ラーメン2" src="../img/醤油ラーメン2.jpeg" width="auto" height="250"></td>
				<td><img alt="醤油ラーメン3" src="../img/醤油ラーメン3.jpeg" width="auto" height="250"></td>
			</tr>
			<tr>
				<th>醬油ラーメン</th>
				<th>醬油ラーメン2</th>
				<th>醬油ラーメン3</th>
			</tr>
			<tr>
				<td>○○○円</td>
				<td>○○○円</td>
				<td>○○○円</td>
			</tr>
		</table>
	</div>
	<div class="ramen">
		<h2>みそラーメン</h2>
		<table>
			<tr>
				<td><img alt="みそラーメン" src="../img/みそラーメン.jpeg" width="auto" height="250"></td>
				<td><img alt="札幌味噌バターラーメン" src="../img/札幌味噌バターラーメン.jpeg" width="auto" height="250"></td>
				<td><img alt="札幌味噌ラーメン" src="../img/札幌味噌ラーメン.jpeg" width="auto" height="250"></td>
			</tr>
			<tr>
				<th>みそラーメン</th>
				<th>札幌味噌バターラーメン</th>
				<th>札幌味噌ラーメン</th>
			</tr>
			<tr>
				<td>○○○円</td>
				<td>○○○円</td>
				<td>○○○円</td>
			</tr>
		</table>
	</div>
	<div class="ramen">
		<h2>塩ラーメン</h2>
		<table>
			<tr>
				<td><img alt="ねぎ塩ラーメン" src="../img/ねぎ塩ラーメン.jpeg" width="auto" height="250"></td>
				<td><img alt="塩ラーメン" src="../img/塩ラーメン.jpeg" width="auto" height="250"></td>
				<td><img alt="塩ラーメン2" src="../img/塩ラーメン2.jpeg" width="auto" height="250"></td>
			</tr>
			<tr>
				<th>ねぎ塩ラーメン</th>
				<th>塩ラーメン</th>
				<th>塩ラーメン2</th>
			</tr>
			<tr>
				<td>○○○円</td>
				<td>○○○円</td>
				<td>○○○円</td>
			</tr>
		</table>
	</div>
	<div class="ramen">
		<h2>とんこつラーメン</h2>
		<table>
			<tr>
				<td><img alt="黒豚とんこつラーメン" src="../img/黒豚とんこつラーメン.jpeg" width="auto" height="250"></td>
				<td><img alt="とんこつラーメン" src="../img/とんこつラーメン.jpeg" width="auto" height="250"></td>
				<td><img alt="とんこつラーメン2" src="../img/とんこつラーメン2.jpeg" width="auto" height="250"></td>
			</tr>
			<tr>
				<th>黒豚とんこつラーメン</th>
				<th>とんこつラーメン</th>
				<th>とんこつラーメン2</th>
			</tr>
			<tr>
				<td>○○○円</td>
				<td>○○○円</td>
				<td>○○○円</td>
			</tr>
		</table>
	</div>
	<div class="ramen">
		<h2>その他ラーメン</h2>
		<table>
			<tr>
				<td><img alt="熊本ラーメン" src="../img/熊本ラーメン.jpeg" width="auto" height="250"></td>
				<td><img alt="月見カレーラーメン" src="../img/月見カレーラーメン.jpeg" width="auto" height="250"></td>
				<td><img alt="富士ブラックラーメン" src="../img/富士ブラックラーメン.jpeg" width="auto" height="250"></td>
			</tr>
			<tr>
				<th>熊本ラーメン</th>
				<th>月見カレーラーメン</th>
				<th>富士ブラックラーメン</th>
			</tr>
			<tr>
				<td>○○○円</td>
				<td>○○○円</td>
				<td>○○○円</td>
			</tr>
			<tr>
				<td><img alt="担々麵" src="../img/担々麵.jpeg" width="auto" height="250"></td>
				<td><img alt="刀削麺" src="../img/刀削麺.jpeg" width="auto" height="250"></td>
			</tr>
			<tr>
				<th>担々麵</th>
				<th>刀削麺</th>
			</tr>
			<tr>
				<td>○○○円</td>
				<td>○○○円</td>
			</tr>
		</table>
	</div>
</body>
</html>