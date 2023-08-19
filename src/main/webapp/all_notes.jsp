<%@ page import="org.hibernate.Session" %>
<%@ page import="com.helper.FactoryProvider" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="com.entities.Note" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: kshit
  Date: 8/15/2023
  Time: 3:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>NoteTaker: My Notes</title>
    <%@include file="common.jsp"%>
</head>
<body>

<div class="container">
    <%@include file="navbar.jsp" %>
</div>
<br>
<div style="text-align: center">
    <h1 class="text-uppercase" style="align-items: center"> My Notes</h1>
</div>


<%
    Session s = FactoryProvider.getFactory().openSession();
    Query q = s.createQuery("from Note");
    List<Note> listNote = q.list();

    for(Note note: listNote) {
        %>

<div class="card mt-3" style="padding-left: 200px; border: 2px solid #08f3df; max-width: 1000px; margin: 0 auto;">
    <div class="row no-gutters">
        <div class="col-md-3" style="max-height: 50px; max-width: 50px; margin-top: 25px;">
            <img src="img/noteicon.png" class="card-img" alt="...">
        </div>
        <div class="col-md-9">
            <div class="card-body">
                <h5 class="card-title"><%= note.getTitle() %></h5>
                <p class="card-text"><%= note.getContent() %></p>
                <p class="card-text" style="position: absolute; top: 0; right: 0;"><b><%=new java.text.SimpleDateFormat("dd-MM-yyyy").format(note.getAddedDate())%></b></p>
                <p class="card-text" style="position: absolute; top: 20px; right: 0;"><b><%= new java.text.SimpleDateFormat("HH:mm:ss").format(note.getAddedDate()) %></b></p>
                <a href="DeleteNoteServlet?note_id=<%=note.getId()%>" class="btn btn-danger" style="margin-left: -75px">Delete</a>
                <a href="edit_notes.jsp?note_id=<%=note.getId()%>" class="btn btn-primary" >Update</a>
            </div>
        </div>
    </div>
</div>




    <%

    }

    s.close();
%>

</body>
</html>
