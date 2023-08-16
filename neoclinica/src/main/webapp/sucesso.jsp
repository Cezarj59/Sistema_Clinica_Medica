<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sucesso</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
<main class="container bg-primary text-light">
    <h1 class="text-center">Sucesso ao <%=request.getParameter("desc")%></h1>
    <hr>
    <div class="d-flex justify-content-center align-items-center">
        <div class="spinner-border text-light" role="status">
            <span class="visually-hidden">Loading</span>
        </div>
    </div>
</main>

<script>
setTimeout(() => {
	var redirectURL = '<%= request.getParameter("redirectURL") %>';
	   window.location.href = redirectURL;
}, 3000);
</script>


<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>