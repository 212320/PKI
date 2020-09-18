<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>${tabela}</title>
        <meta charset="UTF-8" />
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    </head>
    <body>
        <div style="width: 100%">
            <div class="row">
                <div class="col s12">
                    <h4>Tabela "${tabela}"</h4>
                </div>
            </div>
            <div class="row">
                <div class="col s12">
                    <table class="highlight">
                        <thead>
                            <tr>
                                <c:forEach items="${kolumny}" var="kolumna">
                                    <th>${kolumna}</th>
                                </c:forEach>
                                <th />
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach items="${dane}" var="wiersz">
                                <tr>
                                    <c:forEach items="${wiersz}" var="komorka">
                                        <td>${komorka}</td>
                                    </c:forEach>
                                    <td>
                                        <a class="waves-effect waves-light btn" href="edycja?tabela=${tabela}&id=${wiersz[0]}">EDYTUJ</a>
                                        <a class="waves-effect waves-light btn" href="usun?tabela=${tabela}&id=${wiersz[0]}">USUN</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="row">
                <div class="col s12">
                    <a href="nowy?tabela=${tabela}" class="waves-effect waves-light btn">DODAJ</a>&nbsp;
                    <a href="./" class="waves-effect waves-light btn">POWRÓT</a>
                </div>
            </div>
        </div>

       <!-- Compiled and minified JavaScript -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    </body>
</html>