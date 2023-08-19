package com.servlet;

import com.entities.Note;
import com.helper.FactoryProvider;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet("/SaveNoteServlet")
public class SaveNoteServlet extends HttpServlet {
    public SaveNoteServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            //fetching the note created details
            String title = req.getParameter("title");
            String content = req.getParameter("content");
            Note note = new Note(title, content, new Date());
            System.out.println("Successful");

            //once fetched the data . It will be stored to our DB
            Session s =FactoryProvider.getFactory().openSession();
            Transaction txn = s.beginTransaction();
            s.save(note);
            txn.commit();
            s.close();

            resp.setContentType("text/html");
            PrintWriter out = resp.getWriter();
            out.println("<h1 style='text-align: center;'>Note is Added to the DB</h1>");
            out.println("<h1 style='text-align: center;'><a href='all_notes.jsp'>Redirect To My Notes</a></h1>");

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
