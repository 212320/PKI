package pl.test;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class RecordList extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<Map<String, Object>> dane = DbUtils.pobierzRekordy("SELECT * FROM " + req.getParameter("table"), null);
            List<String> kolumny = DbUtils.listaKolumn("SELECT * FROM " + req.getParameter("table"));

            req.setAttribute("tabela", req.getParameter("table"));
            req.setAttribute("kolumny", kolumny);
            req.setAttribute("dane", dane.stream().map(wiersz -> DbUtils.przemapujNaWiersz(wiersz, kolumny)).collect(Collectors.toList()));

            req.getRequestDispatcher("/rekordy.jsp").forward(req, resp);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
