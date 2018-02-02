<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 합쳐지고 최소화된 최신 CSS -->

<html>
<head>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
	
<script type="text/javascript">

	function insertForm() {
		location.href="Anscontroller.do?command=insertform";
	}
	$(function () {
		$("h1").click(function() {
			$("th").slice(6,10).toggle();
			$("tr").each(function() {
				$(this).children("td").slice(6, 10).toggle();
			});
		})
		
		$(".detailAjax").hover(function() {
			
		var seq=$(this).parent().prev().prev().text();//${dto.seq}
		
		
		$.ajax({
			url:"DetailAjax.do",
			data:"seq="+seq,
			type: "post",
			datatype:"json",
			success:function name(obj) {
				
				var dto =obj["dto"];
				
				$("textarea[name=textAjax]").val(dto["content"]);
				
			}
		});
			
			
		}, function() {
			$("textarea[name=textAjax]").val("");
		});
		
		
		
		
		
		
	});
	
	//전체선택 체크박스 구현
	function allSel(bool) {
		$("input[name=chk]").prop("checked", bool)
		
		
	}
	
	
	
	

</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>

<body>
<%-- <%@ include file="header.jsp"%> --%> <!--정적include  -->
<jsp:include page="header.jsp"/> <!--동적include  -->
<div id="contaner">
<jsp:useBean id="util" class="com.hk.answerboard.dbinfo.Util"/> <!--class는 패키지명.클래스  -->

<h1>답변형게시판 <small> 글목록보기 </small></h1>
<textarea rows="2" cols="60" name="textAjax"></textarea>

<form action="Anscontroller.do" method="post">
<input type="hidden" name="command" value="muldel">
<table class="table table-hover">

	<col width="50px"><col width="50px"><col width="100px"><col width="200px">
	<col width="100px"><col width="50px"><col width="50px"><col width="50px">
	<col width="50px"><col width="50px">
	
	<tr>
		<th><input type="checkbox" name="all" onclick="allSel(this.checked)"> </th>
		<th>번호</th>
		<th>작성자</th>
		<th>제목</th>
		<th>작성일</th>
		<th>조회수</th>
		<th>refer</th>
		<th>step</th>
		<th>depth</th>
		<th>삭제</th>
	</tr>
	<c:choose>		
	<c:when test="${empty lists}"> 	<%-- ${empty lists} = lists객체가 비어있다면  --%>
			<tr><td colspan="10">-------작성된 글이 없습니다.-------</td></tr>
	</c:when>
	<c:otherwise>	
		<c:forEach items="${lists}" var="dto"> <!--lists의 길이만큼 반복  -->
			<tr>
				<td><input type="checkbox" name="chk" value="${dto.seq}"/></td>
				<td>${dto.seq}</td>
				<td>${dto.id}</td>
					<c:choose>	
						<c:when test="${dto.delFlag=='Y'}">
						<td>-------삭제된 글 입니다---------</td>
				
						</c:when>
						<c:otherwise> <!--이러한 c:otherwise같은경우는 html이 아니므로 dom탐색 요소가 아니다. 돔 탐색할때 없다고 생각하면된다. -->
							<td>
								
								<jsp:setProperty property="arrowNbsp" name="util" value="${dto.depth}"/> 
								<!--설명 :객체명(usebean에 설정된 id)이 util이고 그 클래스의 맴버필드가 arrowNbsp의 파라미터에 value값을 넣어준다. -->
								<jsp:getProperty property="arrowNbsp" name="util"/>
								<!--설명  :객체명이(usebean에 설정된 id) util이고 그 클래스의 맴버필드가 arrowNbsp에 값을 가져온다.-->
								<a class="detailAjax" href="Anscontroller.do?count=count&command=detailboard&seq=${dto.seq}">${dto.title}</a>
							</td>
						</c:otherwise>	
					</c:choose>
				<td><f:formatDate value="${dto.regDate}" pattern="yyyy년 MM월 DD일"/></td> <!--value에는 DATE타입이 들어가야한다.-->		
				<td>${dto.readCount}</td>
				<td>${dto.refer}</td>
				<td>${dto.step}</td>
				<td>${dto.depth}</td>
				<td>${dto.delFlag}</td>
			</tr>
		</c:forEach>	
	</c:otherwise>			
	</c:choose>
			
	<tr>
	<td colspan="10">
		<input type="button" value="글추가" onclick="insertForm()">
		<input type="submit" value="삭제" >
	</td>
	</tr>
</table>
</form>
</div>
<jsp:include page="footer.jsp"/>

</body>
</html>