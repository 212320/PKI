package pl.test;

import java.sql.*;
import java.util.*;
import java.util.stream.Collectors;

public class DbUtils {
    private static Connection connection = null;

    public static Connection polacz() {
        if (connection == null) {
            try {
                Class.forName("org.postgresql.Driver");
                System.out.println("Zaladowano sterowniki do postgresa");
                connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/test", "postgres", "test");
                System.out.println("Polaczono z postgresem");
            } catch (Exception e) {
                System.err.println("error " + e.getMessage());
            }
        }
        return connection;
    }

    public static List<Object> przemapujNaWiersz(Map<String, Object> dane, List<String> kolumny) {
            return kolumny.stream().map(dane::get).collect(Collectors.toList());
    }

    public static boolean dodajRekord(String tabela, Map<String, Object> params) {
        polacz();
        try {
            List<String> pola = new ArrayList<>();
            List<Object> wartosci = new ArrayList<>();
            for (Map.Entry<String, Object> param: params.entrySet()) {
                if (param.getKey().equals("id") || param.getKey().equals("tabela"))
                    continue;

                pola.add(param.getKey());
                wartosci.add(param.getValue());
            }

            String sql = "INSERT INTO " + tabela + " (" + String.join(",", pola) + ") VALUES (";
            boolean first = true;
            for (int i = 0; i < wartosci.size(); i++) {
                if (first)
                    sql += "?";
                else
                    sql += ",?";
                first = false;
            }
            sql += ");";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            for (int i = 0; i < pola.size(); i++) {
                preparedStatement.setObject(i + 1, wartosci.get(i));
            }
            return preparedStatement.executeUpdate() > 0;
        } catch (Exception e) {
            System.err.println("error " + e.getMessage());
            return false;
        }
    }

    public static boolean edytujRekord(String tabela, Map<String, Object> params, Integer id) {
        polacz();
        try {
            List<String> pola = new ArrayList<>();
            List<Object> wartosci = new ArrayList<>();
            for (Map.Entry<String, Object> param: params.entrySet()) {
                if (param.getKey().equals("id") || param.getKey().equals("tabela"))
                    continue;

                pola.add(param.getKey());
                wartosci.add(param.getValue());
            }

            String sql = "UPDATE " + tabela + " SET " + String.join(", ", pola.stream().map(pole -> pole + " = ?").collect(Collectors.toList()))
                    + " WHERE id = ?";


            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            for (int i = 0; i < pola.size(); i++) {
                preparedStatement.setObject(i + 1, wartosci.get(i));
            }
            preparedStatement.setObject(pola.size() + 1, id);
            return preparedStatement.executeUpdate() > 0;
        } catch (Exception e) {
            System.err.println("error " + e.getMessage());
            return false;
        }
    }

    public static List<Map<String, Object>> pobierzRekordy(String sql, List<Object> parametry) throws SQLException {
        polacz();
        List<Map<String, Object>> rekordy = new ArrayList<>();
        ResultSet rs = null;
        if (parametry != null && parametry.size() > 0) {
            PreparedStatement stmt = null;
            stmt = connection.prepareStatement(sql);
            for (int i = 0; i < parametry.size(); i++)
                stmt.setObject(i + 1, parametry.get(i));
            rs = stmt.executeQuery();
        } else {
            rs = connection.createStatement().executeQuery(sql);
        }

        if (rs != null) {
            List<String> kolumny = listaKolumn(rs);
            while(rs.next()) {
                Map<String, Object> wiersz = new HashMap<>();
                for (int i = 0; i < kolumny.size(); i++) {
                    Object komorka = rs.getObject(i + 1);
                    wiersz.put(kolumny.get(i), komorka);
                }
                rekordy.add(wiersz);
            }
            rs.close();
        }

        return rekordy;
    }

    private static List<String> listaKolumn(ResultSet rs) throws SQLException {
        polacz();
        List<String> kolumny = new ArrayList<>();
        for (int i = 0; i < rs.getMetaData().getColumnCount(); i++)
            kolumny.add(rs.getMetaData().getColumnName(i + 1));

        return kolumny;
    }

    public static List<String> listaKolumn(String sql) {
        polacz();
        try {
            ResultSet rs = connection.createStatement().executeQuery(sql);
            return listaKolumn(rs);
        } catch (Exception e) {
            System.err.println("error " + e.getMessage());
            return new ArrayList<>();
        }
    }

    public static List<String> listaTabel() {
        polacz();
        try {
            List<String> tabele = new ArrayList<>();
            List<Map<String, Object>> wynik = pobierzRekordy("SELECT table_name FROM information_schema.tables WHERE table_schema='public'", null);
            for (Map<String, Object> tabela: wynik) {
                tabele.add((String) tabela.get("table_name"));
            }
            return tabele;
        } catch (Exception e) {
            System.err.println("error " + e.getMessage());
            return new ArrayList<>();
        }
    }

    public static void usunRekord(String tabela, int id) {
        polacz();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM " + tabela + " WHERE id = ?");
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.err.println("error " + e.getMessage());
        }
    }
}
