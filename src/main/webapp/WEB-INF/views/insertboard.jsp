<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function boardlist() {
		location.href="anscontroller.jsp?command=boardlist";
		
	}
	
	//자바스크립트에서 onsubmit의 역할
	

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="container">
<h1>게시글 작성하기</h1>
<form action="Anscontroller.do" method="post">
	<input type="hidden" name="command" value="insertboard"/>
	<table class="table table-striped">
		<tr>
			<th>아이디</th>	
			<td><input type="text" name="id"></td>
		
		</tr>
		<tr>
			<th>제목</th>	
			<td><input type="text" name="title"></td>
		
		</tr>
		<tr>
			<th>내용</th>	
			<td><textarea rows="10" cols="60" name="content"></textarea> </td>
		
		</tr>
		<tr>
			
			<td><input type="submit" value="글작성" class="btn btn-primary">
				<input type="button" value="목록" onclick="boardlist()" class="btn btn-primary">
			</td>
		
		</tr>
	</table>

</form>


</div>
<jsp:include page="footer.jsp"/>
<!--body에 script한거랑 header에 한거랑 무슨차이지 ?  -->
<script type="text/javascript">
$(function () {
		$("form").submit(function () {
			var bool=true;
			$("tr>td").each(function() {
				if($(this).children().val()==""){
					alert($(this).children().attr("name")+"을 입력하세요");
					$(this).children().focus();
					bool=false;//submit 이벤트 취소
					return false;//submit 이벤트를 취소
				}
			});
			return bool// submit에 구현된 function() 종료 --->submit이벤트가 종료
		});
	});
</script>	
</body>
</html>