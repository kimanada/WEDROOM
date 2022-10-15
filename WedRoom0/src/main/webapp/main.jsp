<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WedRoom</title>
    <link href="css/wedroomstyle.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"/>

    
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script>
    $(function(){
        // 이미지 슬라이드
        $('.slide').slick({
            variableWidth: true, //width크기 조절
            slidesToShow: 3,
            slidesToScroll: 1,
            infinite: true,
            prevArrow:'<i class="fa-solid fa-angle-left left_arrow"/>',
            nextArrow:'<i class="fa-solid fa-angle-right right_arrow"/>',
        });

    });
    
    document.addEventListener('DOMContentLoaded', ()=>{
        var interval = window.setInterval(rollingCallback, 3000);
    })
    function rollingCallback(){
        //.prev 클래스 삭제
        document.querySelector('.rollingbanner .prev').classList.remove('prev');

        //.current -> .prev
        let current = document.querySelector('.rollingbanner .current');
        current.classList.remove('current');
        current.classList.add('prev');

        //.next -> .current
        let next = document.querySelector('.rollingbanner .next');
        //다음 목록 요소가 널인지 체크
        if(next.nextElementSibling == null){
            document.querySelector('.rollingbanner ul li:first-child').classList.add('next');
        }else{
            //목록 처음 요소를 다음 요소로 선택
            next.nextElementSibling.classList.add('next');
        }
        next.classList.remove('next');
        next.classList.add('current');
    }
    
</script>

</head>
<body>
<%
	String id=null;
	if(session.getAttribute("id") != null) {
		id=(String)session.getAttribute("id");
	}
%>
    <div class="wrap">
        <!-- 로고 -->
        <header class="hd">
            <div class="logo">
                <a href="index.html"><img src="image/logo.png" class="main-logo"></a>
            </div>
        <!-- 메뉴바 -->
        <div class="menu-bar">
            <ul class="menu">
                <li class="menu1"><a href="share_list.do">쉐어하우스</a></li>
                <li class="menu2"><a href="mate_list.do">룸메이트</a></li>
                <li><a href="free_list.do">자유게시판</a></li>
                <li><a href="#">공지사항</a></li>
                <li><a href="tendency.do">성향테스트</a></li>
            </ul>
        </div>
        </header>

        <!-- 메뉴 밑 이미지 -->
        <nav class="nav">
            <div class="img">
                <a class="imgs"><img src="image/main_img.PNG"></a>
                <button type="button" class="room_btn" onclick="location.href='mate_list.do'">바로가기</button>
            </div>
        </nav>
<%
	if(id == null) {
%>        
        <!-- 로그인 -->
        <div class="login">
            <nav class="nav2">
                <p>더 안전하고 편리하게 이용하세요!</p>
                <form name="login" method="post" action="loginAction.jsp">
                    <input type="text" name="id" placeholder="아이디"><br>
                    <input type="password" name="password" placeholder="비밀번호">
                    <button type="submit" class="login_btn" onclick="">로그인</button>
                </form>
                <br>
                <a class="text1" href="#">아이디 | 비밀번호 찾기</a>
                <a class="text2" href="#">회원가입</a>
            </nav>
        </div>
<%
	}else{
%>
        <!-- 마이페이지 -->
        <div class="mypage">
            <nav class="nav2_2">
                <p>환영합니다.</p>
                <img src="image/personal.PNG" alt="">
                <strong><%=(String)session.getAttribute("id")%>님</strong>
                <button type="button" class="logout_btn" onclick="location.href='logoutAction.jsp'">로그아웃</button>
                <br>
                <a class="text3" href="#">회원수정</a>
                <a class="text4" href="#">회원탈퇴</a>
            </nav>
        </div>
<%}%>
        <!-- 추천쉐어룸 이미지슬라이드 -->
        <article class="atc1">
            <h3 class="shareroom">추천 쉐어룸</h3>
            <div class="slider">
                <div class="container"> 
                    <div class="row slide">

                        <div class="room">
                            <img src="image/room.PNG" alt="" class="img-fluid">
                            <h3><a href="#">주소</a></h3>
                            <p>상세정보</p>
                        </div>
                   
                        <div class="room">
                            <img src="image/room2.PNG" alt="" class="img-fluid">
                            <h3><a href="#">주소</a></h3>
                            <p>상세정보</p>
                        </div>
                      
                        <div class="room">
                            <img src="image/room3.PNG" alt="" class="img-fluid">
                            <h3><a href="#">주소</a></h3>
                            <p>상세정보</p>
                        </div>
                        
                        <div class="room">
                            <img src="image/room4.PNG" alt="" class="img-fluid">
                            <h3><a href="#">주소</a></h3>
                            <p>상세정보</p>
                        </div>
                            
                    </div>
                </div>
            </div>
        </article>

        <!-- 공지사항 -->
        <article class="atc2">
            <h3 class="notice-board">공지사항</h3>
            <div class="rollingbanner">
                <div class="title">📢</div>
            <div class="notice">
                <ul>
                    <li class="current">
                        <a href="#">공지사항 내용 1입니다.</a>
                    </li>
                    <li class="next">
                        <a href="#">공지사항 내용 2입니다.</a>
                    </li>
                    <li>
                        <a href="#">공지사항 내용 3입니다.</a>
                    </li>
                    <li>
                        <a href="#">공지사항 내용 4입니다.</a>
                    </li>
                    <li class="prev">
                        <a href="#">공지사항 내용 5입니다.</a>
                    </li>
                </ul>
            </div>
            </div>
        </article>
        <!-- 꼬리말 -->
        <div class="foot">
            <footer class="ft">
                <ul>
					<li><a href="terms.html">서비스 이용약관</a></li>
					<li class="l1">l</li>
					<li><a href="#">개인정보처리 방침</a></li>
					<li class="l1">l</li>
					<li><a href="#">광고 문의</a></li>
					<li class="l1">l</li>
					<li><a href="#">고객서비스 센터</a></li>
                    <li class="l1">l</li>
					<li><a href="#">위치기반 서비스 이용약관</a></li>
				</ul>
            <br>
            <p class="p">
                <a>상호 : (주)위드룸&nbsp;|&nbsp;주소 : 서울특별시 강남구 테헤란로1길 10&nbsp;|&nbsp;팩스 : 02-123-4567</a>
                <br>
                <a>서비스 이용문의 : 1234-9876&nbsp;|&nbsp;이메일 : cs@wedroom.com</a>
            </p>
            </footer>
        </div>
    </div>
</body>
</html>