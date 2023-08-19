package com.servlet;

import com.entities.Note;
import com.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.IOException;
import java.util.Date;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            int noteId = Integer.parseInt(req.getParameter("noteId").trim());
            String title = req.getParameter("title");
            String content = req.getParameter("content");
            Session s = FactoryProvider.getFactory().openSession();
            Transaction txn = s.beginTransaction();
            Note note =s.get(Note.class, noteId); // adding the object to persistent state to make changes
            note.setTitle(title);
            note.setContent(content);
            note.setAddedDate(new Date());
            txn.commit();
            s.close();
            resp.sendRedirect("all_notes.jsp");
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }
}
