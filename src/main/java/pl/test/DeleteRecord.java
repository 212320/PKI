package pl.test;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DeleteRecord extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            DbUtils.usunRekord(req.getParameter("tabela"), Integer.parseInt(req.getParameter("id")));
            resp.sendRedirect("widok?table=" + req.getParameter("tabela"));
        } catch (Exception e) {
            resp.getWriter().println(e.getMessage());
        }
    }
}
