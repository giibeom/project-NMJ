<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입 - 매장회원</title>
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
</head>
<body>
<script>
// form 검증
function chkSubmit(){
	frm = document.forms["frm"];
	
	var store_name = frm["store_name"].value.trim();
	var store_address = frm["store_address"].value.trim();
	var store_regNum = frm["store_regNum"].value.trim();
	var store_type = frm["store_type"].value.trim();
	var store_dtype = frm["store_dtype"].value.trim();
	var store_tel = frm["store_tel"].value.trim();
	var store_start = frm["store_start"].value.trim();
	var store_end = frm["store_end"].value.trim();
	var store_content = frm["store_content"].value.trim();
	
	if(store_name == ""){
		alert("매장명을 입력해주세요.");
		frm["store_name"].focus();
		return false;
	}
	if(store_address == ""){
		alert("매장주소를 입력해주세요.");
		frm["store_address"].focus();
		return false;
	}
	if(store_regNum == ""){
		alert("매장주소를 입력해주세요.");
		frm["store_regNum"].focus();
		return false;
	}
	if(store_type == ""){
		alert("매장주소를 입력해주세요.");
		frm["store_type"].focus();
		return false;
	}
	if(store_dtype == ""){
		alert("매장주소를 입력해주세요.");
		frm["store_dtype"].focus();
		return false;
	}
	if(store_tel == ""){
		alert("매장주소를 입력해주세요.");
		frm["store_tel"].focus();
		return false;
	}
	if(store_start == ""){
		alert("매장주소를 입력해주세요.");
		frm["store_start"].focus();
		return false;
	}
	if(store_end == ""){
		alert("매장주소를 입력해주세요.");
		frm["store_end"].focus();
		return false;
	}
	if(store_content == ""){
		alert("매장주소를 입력해주세요.");
		frm["store_content"].focus();
		return false;
	}
	
	return true;
}
</script>

	<header>
		<div class="container text-center headerContainer">
				<!-- if(Session.getAttribute("mb_uid") == null) { -->
				<div id="login_signUp">
					<span id="login">로그인</span>
					<span class="line">|</span>
					<span id="signup">회원가입</span>
				</div>
				<!-- } else { -->
				<div id="logout_mypage" style="display: none;">
					<span id="logout">로그아웃</span>
					<span class="line">|</span>
					<span id="mypage">마이페이지</span>
				</div>
				<!-- } -->
				
				<div class="fh5co-navbar-brand">
					<a href="main.nmj"><img id="logo" src="../img/logo/nmj_logo.jpg"></a>
				</div>
			<nav id="fh5co-main-nav" role="navigation">
				<ul>
					<li><a href="main.nmj">메인</a></li>
					<li><a href="findStore.nmj?store_type=1">놀자</a></li>
					<li><a href="findStore.nmj?store_type=2">먹자</a></li>
					<li><a href="findStore.nmj?store_type=3">자자</a></li>
					<li><a href="communityList.nmj">떠들자</a></li>
					
				</ul>
			</nav>
		</div>
	</header>

	<div id="fh5co-intro-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<p class="title">회원가입</h2>
					<p class="subtitle">"놀먹자의 식구가 되어보세요"</p>
				</div>
			</div>
		</div>
	</div>
	<!-- end fh5co-intro-section -->

	<div id="fh5co-contact-section">
	<div class="container">
		<div class="row">
			<div class="animate-box fadeInUp animated">
				<form name="frm" action="signUpStoreRegOk.nmj" method="post" onsubmit="return chkUpdate()" enctype="Multipart/form-data">
				 	<div class="col-md-12">
					 	<div class="form-group">
				 			<label>매장 이름 등록</label>
					 	</div>
				 	</div>
				 	<div class="col-md-12">
					 	<div class="form-group">
						 	<input class="form-control" type="text" name="store_name" placeholder="매장명..." required>
					 	</div>
				 	</div>

				 	<div class="col-md-12">
					 	<div class="form-group">
				 			<label>매장 주소 등록</label>
					 	</div>
				 	</div>
				 	<div class="col-md-10">
					 	<div class="form-group">
						 	<input class="form-control" type="text" id="sample5_address" name="store_address">
					 	</div>
				 	</div>
				 	<div class="col-md-2">
					 	<div class="form-group">
						 	<button class="btn btn-secondary btn-lg" type="button" onclick="sample5_execDaumPostcode()">주소찾기</button>
					 	</div>
				 	</div>
				 	<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
				 	
				 	<div class="col-md-12">
					 	<div class="form-group">
					 		<label>매장 사업자 등록 번호 등록</label>
					 	</div>
				 	</div>
				 	
				 	<div class="col-md-12">
					 	<div class="form-group">
				 			<input class="form-control" type="text" name="store_regNum" pattern="[0-9]{3}-[0-9]{2}-[0-9]{5}"  placeholder="사업자 등록 번호..." required>
					 	</div>
				 	</div>
				 	
				 	<div class="col-md-12">
					 	<div class="form-group">
					 		<label>매장 사업자 등록증 등록</label>
					 	</div>
				 	</div>
				 	<div class="col-md-12">
					 	<div class="form-group">
						 	<input type="file" name="upload" accept="image/*">
					 	</div>
				 	</div>
				 	
				 	<div class="col-md-12">
					 	<div class="form-group">
					 		<label>매장 종류 등록</label>
					 	</div>
				 	</div>
				 	<div class="col-md-12">
					 	<div class="form-group">
						 	<select class="store_type form-control" id="store_type" name="store_type" onchange="changeDetails()">
						 		<option value="1">놀자</option>
						 		<option value="2">먹자</option>
						 		<option value="3">자자</option>
						 	</select>
					 	</div>
				 	</div>
				 	
				 	<div class="col-md-12">
					 	<div class="form-group">
					 		<label>매장 상세 종류 등록</label>
					 	</div>
				 	</div>
				 	<div class="col-md-12">
					 	<div class="form-group">
							<select class="store_dtype form-control" name="store_dtype">
						 	</select>
					 	</div>
				 	</div>
			 		<div class="col-md-12">
					 	<div class="form-group">
				 			<label>전화번호</label>
					 	</div>
				 	</div>
			 		<div class="col-md-12">
					 	<div class="form-group">
					 		<input class="form-control" type="text" name="store_tel" value="" pattern="(^02.{0}|^01.{1}|[0-9]{3})-([0-9]+)-([0-9]{4})" placeholder="ex) 010-1234-1234" required>
					 	</div>
				 	</div>
				 	
			 		
			 		<div class="col-md-12">
					 	<div class="form-group">
				 			<label>영업시간</label>
					 	</div>
				 	</div>
			 	
			 		<div class="col-md-5">
					 	<div class="form-group">
							<select class="form-control" name="store_start" id="store_start">
								<option value="00:00">00:00</option>
								<option value="00:30">00:30</option>
								<option value="01:00">01:00</option>
								<option value="01:30">01:30</option>
								<option value="02:00">02:00</option>
								<option value="02:30">02:30</option>
								<option value="03:00">03:00</option>
								<option value="03:30">03:30</option>
								<option value="04:00">04:00</option>
								<option value="04:30">04:30</option>
								<option value="05:00">05:00</option>
								<option value="05:30">05:30</option>
								<option value="06:00">06:00</option>
								<option value="06:30">06:30</option>
								<option value="07:00">07:00</option>
								<option value="07:30">07:30</option>
								<option value="08:00">08:00</option>
								<option value="08:30">08:30</option>
								<option value="09:00">09:00</option>
								<option value="09:30">09:30</option>
								<option value="10:00">10:00</option>
								<option value="10:30">10:30</option>
								<option value="11:00">11:00</option>
								<option value="11:30">11:30</option>
								<option value="12:00">12:00</option>
								<option value="12:30">12:30</option>
								<option value="13:00">13:00</option>
								<option value="13:30">13:30</option>
								<option value="14:00">14:00</option>
								<option value="14:30">14:30</option>
								<option value="15:00">15:00</option>
								<option value="15:30">15:30</option>
								<option value="16:00">15:00</option>
								<option value="16:30">15:30</option>
								<option value="17:00">15:00</option>
								<option value="17:30">15:30</option>
								<option value="18:00">18:00</option>
								<option value="18:30">18:30</option>
								<option value="19:00">19:00</option>
								<option value="19:30">19:30</option>
								<option value="20:00">20:00</option>
								<option value="20:30">20:30</option>
								<option value="21:00">21:00</option>
								<option value="21:30">21:30</option>
								<option value="22:00">22:00</option>
								<option value="22:30">22:30</option>
								<option value="23:00">23:00</option>
								<option value="23:30">23:30</option>
							</select>
					 	</div>
				 	</div>
				 	
				 	<div class="col-md-2">
					 	<div class="form-group" style="text-align: center">
							<label>~</label>
					 	</div>
				 	</div>
				 	
				 	<div class="col-md-5">
					 	<div class="form-group">
							<select class="form-control" name="store_end" id="store_end">
								<option value="00:00">00:00</option>
								<option value="00:30">00:30</option>
								<option value="01:00">01:00</option>
								<option value="01:30">01:30</option>
								<option value="02:00">02:00</option>
								<option value="02:30">02:30</option>
								<option value="03:00">03:00</option>
								<option value="03:30">03:30</option>
								<option value="04:00">04:00</option>
								<option value="04:30">04:30</option>
								<option value="05:00">05:00</option>
								<option value="05:30">05:30</option>
								<option value="06:00">06:00</option>
								<option value="06:30">06:30</option>
								<option value="07:00">07:00</option>
								<option value="07:30">07:30</option>
								<option value="08:00">08:00</option>
								<option value="08:30">08:30</option>
								<option value="09:00">09:00</option>
								<option value="09:30">09:30</option>
								<option value="10:00">10:00</option>
								<option value="10:30">10:30</option>
								<option value="11:00">11:00</option>
								<option value="11:30">11:30</option>
								<option value="12:00">12:00</option>
								<option value="12:30">12:30</option>
								<option value="13:00">13:00</option>
								<option value="13:30">13:30</option>
								<option value="14:00">14:00</option>
								<option value="14:30">14:30</option>
								<option value="15:00">15:00</option>
								<option value="15:30">15:30</option>
								<option value="16:00">15:00</option>
								<option value="16:30">15:30</option>
								<option value="17:00">15:00</option>
								<option value="17:30">15:30</option>
								<option value="18:00">18:00</option>
								<option value="18:30">18:30</option>
								<option value="19:00">19:00</option>
								<option value="19:30">19:30</option>
								<option value="20:00">20:00</option>
								<option value="20:30">20:30</option>
								<option value="21:00">21:00</option>
								<option value="21:30">21:30</option>
								<option value="22:00">22:00</option>
								<option value="22:30">22:30</option>
								<option value="23:00">23:00</option>
								<option value="23:30">23:30</option>
								<option value="24:00">24:00</option>
							</select>
					 	</div>
				 	</div>
				 	
				 	<div class="col-md-12">
					 	<div class="form-group">
							<label>매장 설명</label>
					 	</div>
				 	</div>
					<div class="col-md-12">
					 	<div class="form-group">
				 			<textarea class="form-control" name="store_content" rows="10" cols="40"></textarea>
					 	</div>
				 	</div>
				 	
				 	<div class="col-md-12">
					 	<div class="form-group">
							<label>매장 사진 등록</label>
					 	</div>
				 	</div>
				 	<div class="col-md-12">
					 	<div class="form-group">
						 	<input type="file" name="upload" accept="image/*">
					 	</div>
				 	</div>
				 
				 <button type="submit" class="btn btn-primary btn-lg">수정</button>
				</form>
			</div>
		</div>
	</div>
</div>


<jsp:include page="../footer.jsp"></jsp:include>

<script>
$(document).ready(function(){
	$("#store_start option[value='${result.store_start}']").attr('selected', 'selected');
	$("#store_end option[value='${result.store_end}']").attr('selected', 'selected');
});
</script>
<script>

/////////////////////////////////////////////////////////////////////////////////////////////////// 상세 종류 목록 변경
$(document).ready(function(){
	$("#store_type option[value='${result.store_type}']").attr('selected', 'selected');
	getJackson(); //json
});
var jsonObj = "";
var l;
	
function changeDetails() {
	var type = $("select.store_type").children("option:selected").val() - 1;
	var dtypes = jsonObj.store_types[type].store_dtypes;
	l = dtypes.length;
	var result = "";
	for(i = 0; i < l; i++){
		
		if(dtypes[i].store_dtype == ${result.store_dtype}){
			
			result += "<option value='" + dtypes[i].store_dtype + "' selected>" + dtypes[i].store_dname + "</option>";
		}else{
			result += "<option value='" + dtypes[i].store_dtype + "'>" + dtypes[i].store_dname + "</option>";
		}
	}
	
	$("select.store_dtype").html(result);
	
}

function getJackson(){
	$.ajax({
		url : "${pageContext.servletContext.contextPath}/ajax/store/dtypeList.ajax",
		type : "GET",
		cache : false,
		success : function(data, status){
			if(status == "success"){
				jsonObj = data;
				changeDetails();
			}
		}
	})
}
//////////////////////////////////////////////////////////////////////////////////////////////	주소 api
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();

    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
                        var result = results[0]; //첫번째 결과의 값을 활용
		                document.getElementById("x").value = result.x;
		                document.getElementById("y").value = result.y;
                    }
                });
            }
        }).open();
    	}
    }

	
</script>

</body>
</html>