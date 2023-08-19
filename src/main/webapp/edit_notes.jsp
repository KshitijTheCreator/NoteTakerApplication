<%@ page import="com.helper.FactoryProvider" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="com.entities.Note" %><%--
  Created by IntelliJ IDEA.
  User: kshit
  Date: 8/15/2023
  Time: 1:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>NoteTaker: Edit_notes</title>
    <%@include file="common.jsp"%>

</head>
<body>
<div class="container">
    <%@include file="navbar.jsp" %>
    <h1>Edit Your Notes Here</h1>
    <br>
    <%
        String getNote = request.getParameter("note_id").trim();
        int noteId = Integer.parseInt(getNote);
        Session s = FactoryProvider.getFactory().openSession();

        Note note = (Note)s.get(Note.class, noteId);
    %>
    <form action = "UpdateServlet" method="post">
        <input value="<%=note.getId()%>" name="noteId" type="hidden"/>
        <div class="form-group">
            <label for="title" class="form-label">Note Title</label>
            <input name="title"
                   required
                   type="text"
                   class="form-control"
                   id="title"
                   aria-describedby="emailHelp"
                   placeholder="Note Title"
                   value="<%=note.getTitle()%>" />

        </div>
        <div class="form-group">
            <label for="content">Note Content</label>
            <textarea
                    name = "content"
                    required
                    id="content"
                    placeholder="Notes Details Section "
                    class="form-control"
                    style="height: 300px;"><%=note.getContent()%></textarea>
        </div>
        <div class="container text-center" >
            <button type="submit" class="btn btn-success">Save</button>
        </div>
    </form>
</div>


</body>
</html>
