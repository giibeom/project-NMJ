<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
    int writePages = 10;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>커뮤니티 - 자유글목록</title>

<link rel="shortcut icon" href="favicon.ico">

<!-- Animate.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootstrap.css">
<!-- Owl Carousel -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/owl.theme.default.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootswatch.css">

<!-- 새힘 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/myCSS_sam.css">

<!-- Modernizr JS -->
<script src="${pageContext.request.contextPath}/js/modernizr-2.6.2.min.js"></script>

<!-- 페이징 -->
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>

<script>
//페이지 최초 로딩되면 게시글 목록 첫페이지분 로딩

 $(document).ready(function(){
    $("input#page").val(1);   // 페이지 최초 로딩되면 1페이지
    loadPage(1) // n Page 읽어오기

   var html = "<ul class='pagination'>";
   var curPage = parseInt($("input#page").val());

   if(curPage != 1) {
      html += "<li class='back'><a class='fas fa-angle-double-left'></a></li>";
   }
   var calPage = parseInt(curPage / 10); 
   var pagesize = 0;
   
   if((calPage+1)*10 > ${totalPage}/10){
	   pagesize = ${totalPage}/10 - (calPage)*10 +1;
   }else{
	   pagesize = 10;
   }
   
   for(var i = 1; i <=  pagesize; i++){
      html +=   "<li class='page-item'><a class='page-link'>"+ (calPage*10 + i) + "</a></li>";
      
   }
      
      
   if(curPage < ${totalPage}){
      html += "<li class='next'><a class='fas fa-angle-double-right'></a></li>";
   }
   $("#pagination").html(html);
   $(".page-item").click(function(){   
      var pagetext = $(this).text();
      loadPage(pagetext);
   });
   
   $(".next").click(function(){   
	  loadPage(pagesize);
   });
   
   $(".back").click(function(){   
      loadPage(1);
   });

 });

 // page번째 페이지 목록 로딩
 function loadPage(page) {
    
    $.ajax({
       url : "${pageContext.request.contextPath}/memberAjax/communityList2.nmj/<%= writePages%>/" + page,
       type : "GET",
       cache : false,
       success : function(data, status) {
          if(status == "success") {
             
             if(updateList(data)) { // 페이지 업데이트
                // 페이지 로딩이 성공한 후에야 현재 페이지 정보 업데이트
                $("input#page").val(page);
             }
          }
       }
       
    });
 } // end loadPage()


 function updateList(jsonObj) {
  	var result = '<tr>';
       result += '<th>no.</th>';
       result += '<th>아이디</th>';
       result += '<th>내용</th>';
       result += '<th>조회수</th>';
       result += '<th>작성일</th>';
       result += '</tr>';
    
    if(jsonObj.status == "OK") {
       
       var count = jsonObj.count; // 글 개수
       var items = jsonObj.list; // 글 목록
       
       if(count == 0){
    	   result += '첫번째 게시글을 남겨보세요!<br>';
       }
       
       var i;
       for(i = 0; i < count; i++) {
       	  result += '<tr>';
       	  var k = i + 1;
    	  result += '<td>'+ k + '</td>';
    	  result += '<td>' + items[i].mb_id + '</td>';
    	   if(items[i].review_ban == 0){
    		   result += '<td><a href="communityView2.nmj?review_uid=' + items[i].review_uid;
    		   result += '">' + items[i].review_content + '</a></td>';
    	   } else {
    		   result += '<td>관리자에 의해 삭제된 글입니다.</td>';
    	   }
    	   result += '<td>' + items[i].review_viewCount + '</td>';
   		   result += '<td>' + items[i].review_date + '</td>';
   		   result += '</tr>';
       }
       
       $("#communityList").html(result); // 테이블 내용 업데이트
       
       return true;
    } else {
       return false;
    }
    
    return false;
 }

 </script>


<body>
	<input type="hidden" id="page" value="1">
	<jsp:include page="normalHeader.jsp"></jsp:include>
	
		<div id="fh5co-intro-section">
    		<div class="row">
				<div class="col-md-12 text-center">
					<h2>자유글 목록</h2>
				</div>
			</div>
		</div>
	
	<div class="div-relative">
	<div class="show_list_container">
	
	<button class="btn btn-secondary btn-lg" onclick="location.href='communityList.nmj'">후기글</button>
    <button class="btn btn-secondary active btn-lg" onclick="location.href='communityList2.nmj'">자유글</button>
        <br><br>
			
		<table id="communityList">
          


		</table>

	<ul class="pagination" id="pagination"></ul>

	<c:choose>
	 	<c:when test="${sessonScope.mb_uid != null }">
		<button class="btn btn-primary btn-lg" onclick="location.href='writeReview2.nmj?mb_uid=${sessonScope.mb_uid}'">자유글 작성</button>
		</c:when>
	</c:choose>

	</div>
	</div>
	
	<br><br>
	
<footer>
		<div id="footer" class="fh5co-border-line">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center">
						<p>
							Copyright 2020 Team <a href="#">Q&A</a>. All Rights
							Reserved. <br>Made with <i class="icon-heart3 love"></i> by
							<a href="#" target="_blank">Korea IT Academy</a> /
							Images: <a href="https://www.pexels.com/" target="_blank">Pexels</a>
							&amp; <a href="http://plmd.me/" target="_blank">PLMD</a>
						</p>
						<p class="fh5co-social-icons">
							<a href="#"><i class="icon-twitter-with-circle"></i></a> <a
								href="#"><i class="icon-facebook-with-circle"></i></a> <a
								href="#"><i class="icon-instagram-with-circle"></i></a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="${pageContext.request.contextPath}/js/jquery.waypoints.min.js"></script>
	<!-- Owl carousel -->
	<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
	<!-- Stellar -->
	<script src="${pageContext.request.contextPath}/js/jquery.stellar.min.js"></script>

	<!-- Main JS (Do not remove) -->
	<script src="${pageContext.request.contextPath}/js/main.js"></script>

</body>
</html>