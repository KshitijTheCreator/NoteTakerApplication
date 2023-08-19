<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <%@include file="common.jsp"%>
    <title>NoteTaker: Home</title>
</head>
<body>
<div class="container">
    <%@include file="navbar.jsp"%>
    <br>

    <div class="card my-5">
        <img class="img-fluid mx-auto" style="max-width: 400px; max-height: 200px" src="img/noteicon.png" >
        <h1 class="text-primary text-uppercase text-center mt-5">Welcome to note taker</h1>
        <div class="container text-center" >
            <a href="add_notes.jsp" class="btn btn-outline-primary text-center my-2">CREATE NOTE</a>
        </div>
        <div class="container text-center">
            <a href="all_notes.jsp" class="btn btn-outline-primary text-center my-2">MY SAVED NOTES</a>
        </div>

    </div>
</div>

</body>
</html>