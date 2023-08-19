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

@WebServlet("/DeleteNoteServlet")
public class DeleteNoteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            Integer noteId = Integer.parseInt(req.getParameter("note_id").trim());
            Session s = FactoryProvider.getFactory().openSession();
            Transaction txn = s.beginTransaction();
            Note note = (Note)s.get(Note.class, noteId);
            s.delete(note);
            txn.commit();
            s.close();
            resp.sendRedirect("all_notes.jsp");
        }catch(Exception e) {

        }
    }
}
