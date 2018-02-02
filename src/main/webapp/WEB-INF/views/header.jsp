<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>

<style type="text/css">
header {
	background-color: orange;
	height: 50px;
}

footer {
	background-color: orange;
	height: 50px;
	text-align: center;
	line-height: 50px;
}

#container {
	height: 500px;
	width: 1200px;
	margin: 0 auto;
	overflow: auto;
}

a {
	text-decoration: none;
}
td>img{width: 15px; height: 10px;}
/*답글폼 감추기  */
#replyForm{display: none;}
</style>

</head>
<body>
	<header>
		<h1>
			<a href="anscontroller.jsp?command=boardlist">게시판 구현하기</a>
		</h1>

	</header>
</body>
</html>