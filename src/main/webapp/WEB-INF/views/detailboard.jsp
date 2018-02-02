<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="header.jsp"/>    
<!DOCTYPE html>
<html>

<head>
<script type="text/javascript">

	function updateForm(seq) {
		location.href="Anscontroller.do?command=updateform&seq="+seq;
	}
	
	function delBoard(seq) {
		//글 여러개 삭제하는 기능을 사용할거라서 "chk"이름으로 seq를 전달함
		location.href="Anscontroller.do?command=muldel&chk="+seq;
	}
	
	$(function () {
		$("#replyForm form").submit(function () {
			var bool=true;
			$("#replyForm tr>td").each(function() {
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
	
	//답글 폼 보여주기 : show(),offset(),aniate(),css속성(scrollTop)
	//http://itjunijuni.tistory.com/19 scrollTop에 대한이해
	function replyForm() {
		$("#replyForm").show();
		var replyPosition = $("#replyForm").offset().top; //#replyForm의 위쪽여백을 구하겟다.
		
		/* $("#container").scrollTop(); */ //이렇게 스크롤 탑이라는게 있는데 animate를 적용안하면 지연시간없이 확내려간다.
		
		$("#container").animate({
			"scrollTop":replyPosition //그 댓글의 위쪽여백만큼 scrollTop을 해준다.
		},2000);
		
	}


</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>

<div id="container">
<table class="table table-striped">
	<h2>게시글 상세보기</h2>
	<tr>
		<th>번호</th>
		<td>${dto.seq}</td>
	</tr>
	<tr>
		<th>아이디</th>
		<td>${dto.id}</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>${dto.regDate}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${dto.title}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="10" cols="60" class="form-control" placeholder="Readonly input here…" readonly>${dto.content}</textarea></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" value="수정" onclick="updateForm(${dto.seq})" class="btn btn-default">
			<input type="button" value="삭제" onclick="delBoard(${dto.seq})" class="btn btn-primary">
			<input type="button" value="답글" onclick="replyForm()" class="btn btn-success">
		</td>
	</tr>
	


</table>
<div id ="replyForm">
	<hr>
	<h2>답글달기</h2>
	<form action="Anscontroller.do" method="post">
		<input type="hidden" name="command" value="replyboard">
		<input type="hidden" name="seq" value="${dto.seq}">
		<table class="table table-striped">

	<tr>
		<th>아이디</th>
		<td><input type="text" name="id"  class="form-control"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="title"  class="form-control"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="10" cols="60" class="form-control" name="content"></textarea></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="답글" class="btn btn-success">
		</td>
	</tr>
	
</table>
	</form>

</div>

</div>
<jsp:include page="footer.jsp"/>
</body>

</html>