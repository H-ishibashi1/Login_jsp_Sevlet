<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者画面</title>
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
	
	/* inputタグ共通の設定 */
	.submitOut{
		top:10px;
		position: absolute; 
	}
	
	/* 各inputタグの設定 */
	
	.submitOut{
		right: 20px;
	}
	
	/* 見出しをセンターに */
	h1{
		text-align: center;
	}
	
	/* テーブル全体 */
	table{
		position: relative;
		margin-left: auto;
		margin-right: auto;
		text-align: center;
		top: 50px;
	}
	
	/* テーブル列 */
	table tr td:nth-of-type(1) {
		width: 100px;
	}
	table tr td:nth-of-type(2) {
		width: 200px;
	}
	table tr td:nth-of-type(3) {
		width: 200px;
	}
	
	/* テーブル枠線 */
	table{
		border-collapse: collapse;
		border: 2px #000 solid;
	}
	
	th,td{
		border: 1px #000 solid;
	}
	
	thead{
		border-bottom: 3px #000 double;
	}
	
	#delsubmit{
	text-align: center;
	position: relative;
	top: 100px;
	}
	
 	#del{
 		text-align: center;
 		position: relative;
 	    top: 40px;
 	}
	</style>
</head>
<body>
	<%@page import = "jp.co.aforce.bean.User, java.util.List" %>

	<%List<User> allList = (List<User>)request.getAttribute("ALLLIST"); %>
	
	<div id="global">

		
		<label class="name">店名</label>
		
		<label class="user">ようこそ、管理者さん！</label>
	
		<a href="../jp.co.aforce.servlets/logout"><input type="submit" class="submitOut" value="ログアウト"></a>
		
	</div>
	
	<h1>ユーザー一覧</h1>
	
	<table>
		<thead>
			<tr>
				<th>ユーザーID</th>
				<th>ユーザー名</th>
				<th>パスワード</th>
			</tr>
		</thead>
		<tbody>
			<%for(User u : allList){ %>
				<tr>
					<td><%=u.getId() %></td>
					<td><%=u.getUser() %></td>
					<td><%=u.getPass() %></td>
				</tr>
			<%} %>
		</tbody>
	</table>
	<div id="delsubmit">
		<form action="../jsp/delete.jsp">
			<input type="submit" value="ユーザー情報削除">
		</form>
	</div>
	<div id="del">
		<%
			String del = (String) request.getAttribute("DELETE");
			if (del != null) {
				if(del.equals("true")){
		%>
				<label>削除に成功しました。</label>
				<%}else if(del.equals("false")) {%>	
				<label>削除に失敗しました。</label>
		<%		
				}
			}
		%>
	</div>
</body>
</html>