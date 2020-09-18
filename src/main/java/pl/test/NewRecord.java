package pl.test;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class NewRecord extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String tabela = req.getParameter("tabela");
            List<String> kolumny = DbUtils.listaKolumn("SELECT * FROM " + tabela)
                    .stream().filter(kolumna -> !kolumna.equals("id")).collect(Collectors.toList());
            req.setAttribute("kolumny", kolumny);
            req.setAttribute("tabela", tabela);
            req.getRequestDispatcher("/szczegoly_rekordu.jsp").forward(req, resp);
        } catch (Exception e) {
            resp.getWriter().println(e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Map<String, Object> pola = new HashMap<>();
            for (Map.Entry<String, String[]> dane: req.getParameterMap().entrySet()) {
                pola.put(dane.getKey(), dane.getValue()[0]);
            }

            DbUtils.dodajRekord(req.getParameter("tabela"), pola);
            resp.sendRedirect("widok?table=" + req.getParameter("tabela"));
        } catch (Exception e) {
            resp.getWriter().println(e.getMessage());
        }
    }
}
