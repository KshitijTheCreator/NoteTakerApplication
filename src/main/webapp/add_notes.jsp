<%--
  Created by IntelliJ IDEA.
  User: kshit
  Date: 8/13/2023
  Time: 1:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>NoteTaker: Add Notes</title>
  <%@include file="common.jsp"%>

</head>
<body>
<div class="container">
    <%@include file="navbar.jsp" %>
</div>

<%--add form util bootstrap--%>
<div style="text-align: center">
    <h1 class="text-uppercase"> Enter Your Notes Here</h1>
</div>
<br>

<form action = "SaveNoteServlet" method="post" style="padding-left: 50px;  max-width: 1000px; margin: 0 auto;">
    <div class="form-group">
        <label for="title" class="form-label">Note Title</label>
        <input name="title"
                required
               type="text"
               class="form-control"
               id="title"
               aria-describedby="emailHelp"
               placeholder="Note Title"
        />

    </div>
    <div class="form-group">
        <label for="content">Note Content</label>
        <textarea
                name = "content"
                required
                  id="content"
                  placeholder="Notes Details Section "
                  class="form-control"
                  style="height: 300px"></textarea>
    </div>
    <div class="container text-center" >
        <button type="submit" class="btn btn-primary">Add</button>
    </div>
</form>


</body>
</html>
