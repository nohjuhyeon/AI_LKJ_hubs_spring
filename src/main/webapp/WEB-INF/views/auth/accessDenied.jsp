<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>접근 거부</title>
</head>
<body>
<h2>접근 거부됨</h2>
<script>
    alert('접근할 수 없는 페이지입니다. 권한이 필요합니다.');
    window.location.href = '/'; // 메인 페이지로 리다이렉트
</script>
</body>
</html>
