<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WedRoom</title>
    <link href="css/free.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="wrap">
        <!-- 로고 -->
        <header class="hd">
            <div class="logo">
                <a href="#"><img src="image/logo.png"></a>
            </div>
        </header>
        <!-- 메뉴바 -->
        <nav class="nav">
            <ul class="menu">
                <li><a href="#">쉐어하우스</a></li>
                <li><a href="#">룸메이트</a></li>
                <li><a href="free_list.do">자유게시판</a></li>
                <li><a href="#">공지사항</a></li>
                <li><a href="tendency.do">성향테스트</a></li>
            </ul>
        </nav>
        <!-- 자유게시판(본문) -->
        <article class="freeboard">
            <p class="tiele">자유게시판</p>
            <form class="form-group" name="test"  action="/WedRoom0/free_list.do">
                <div class="form-select">
                    <select id="searchSelect" name="search" title="검색 구분을 선택해 주세요">
                        <option value="all">전체</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                </div>
                <div class="form-text">
                    <input type="text" id="searchText" name="searchtext" placeholder="검색어를 입력해 주세요.">
                </div>
                <button class="btn-regular" type="submit" onclick="">조회</button>
            </form>
            <div class="board-list">
                <!-- <div class="board-detail"> -->
<%
	String id=null;
		if(session.getAttribute("id") != null) {
		id=(String)session.getAttribute("id");
	}
	if(id != null) {
%>
 				<div class="board-detail">
                    <div class="board-write">
                        <a href="/WedRoom0/free_writeForm.do">글쓰기</a>
                    </div>
                </div>
<%
	}else{
%>
				<div class="board-detail">
                    <div class="board-write" style="margin:20px;">
                        <a href="/WedRoom0/free_writeForm.do"></a>
                    </div>
                </div>
<%
	}
%>
<!--                 </div> -->
                <div class="board">
<c:if test="${pgList.count==0}">
<%
	out.println("<script>alert('게시판에 저장된 글이 없습니다.');</script>");
%>
</c:if>
                    <table class="table">
                        <thead>
                        <tr>
                            <td>번호</td>
                            <td class="td-title">제목</td>
                            <td>작성자</td>
                            <td>작성일</td>
                            <td>조회수</td>
                        </tr>
                        </thead>
                        <tbody>
                        <c:set var="number"  value="${pgList.number}" />
    					<c:forEach var="article"  items="${articleList}">
                        <tr>
                            <%-- <td><c:out value="${number}" /><c:set var="number"  value="${number-1}" /></td> --%>
                            <td>${article.free_no}</td>
                            <!-- num(게시물번호),pageNum(페이지번호) -->
                            <td><a href="/WedRoom0/free_content.do?free_no=${article.free_no}&pageNum=${pgList.currentPage}">${article.title}</a></td>
                            <td>${article.id}</td>
                            <td><fmt:formatDate value="${article.created_datetime}"  timeStyle="medium" pattern="yy.MM.dd" /></td>
                            <td>${article.views}</td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
            		<!-- 페이징 처리 -->
                    <div class="paging">
                     <%-- <c:if test="${pgList.startPage > pgList.blockSize}">
     					<a href="/WedRoom0/free_list.do?pageNum=${pgList.startPage-pgList.blockSize}&search=${search}&searchtext=${searchtext}" class="prev"><img src="./image/left-next.png"></a>
 					</c:if> --%>
 						<a href="/WedRoom0/free_list.do?pageNum=${pgList.startPage}&search=${search}&searchtext=${searchtext}" class="prev"><img src="./image/left-next.png"></a>
					
					<c:forEach var="i" begin="${pgList.startPage}" end="${pgList.endPage}">
					     <a href="/WedRoom0/free_list.do?pageNum=${i}&search=${search}&searchtext=${searchtext}" class="num">
					           <c:if test="${pgList.currentPage==i}">
					                   <b>${i}</b>
					           </c:if>
					           <c:if test="${pgList.currentPage!=i}">
					                   ${i}
					           </c:if>
					     </a>
					</c:forEach>
					
 					<%-- <c:if test="${pgList.endPage <pgList.pageCount}">
					     <a href="/WedRoom0/free_list.do?pageNum=${pgList.startPage+pgList.blockSize}&search=${search}&searchtext=${searchtext}" class="next"><img src="./image/right-next.png"></a>
 					</c:if> --%> 
 						<a href="/WedRoom0/free_list.do?pageNum=${pgList.endPage}&search=${search}&searchtext=${searchtext}" class="next"><img src="./image/right-next.png"></a>
                    </div>
                </div>
            </div>
        </article>

        <!-- 꼬리말 -->
        <footer class="ft">
            <nav class="nav2">
                <ul>
					<li><a href="#">서비스 이용약관</a></li>
					<li class="l1">l</li>
					<li><a href="#">개인정보처리 방침</a></li>
					<li class="l1">l</li>
					<li><a href="#">광고 문의</a></li>
					<li class="l1">l</li>
					<li><a href="#">고객서비스 센터</a></li>
                    <li class="l1">l</li>
					<li><a href="#">위치기반 서비스 이용약관</a></li>
				</ul>
            </nav>
            <br>
            <p class="p">
                <a>상호 : (주)위드룸&nbsp;|&nbsp;주소 : 서울특별시 강남구 테헤란로1길 10&nbsp;|&nbsp;팩스 : 02-123-4567</a>
                <br>
                <a>서비스 이용문의 : 1234-9876&nbsp;|&nbsp;이메일 : cs@wedroom.com</a>
            </p>
        </footer>
    </div>
</body>
</html>