<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${empty result || result == 0 }">
	<script>
		alert("신고 실패");
		history.back();
	</script>
	</c:when>
	<c:otherwise>
	<script>
		alert("신고 성공");
		location.href = "communityView2.nmj?review_uid=" + ${ review_uid};
	</script>
	</c:otherwise>
</c:choose>


