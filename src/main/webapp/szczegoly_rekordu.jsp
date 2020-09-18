<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />

        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    </head>
    <body>
        <div class="container">
            <form method="post">
                <c:forEach items="${kolumny}" var="kolumna">
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="${kolumna}" name="${kolumna}" value="${dane[kolumna]}" />
                            <label class="active" for="${kolumna}">${kolumna}</label>
                        </div>
                    </div>
                </c:forEach>
                <div class="row">
                    <div class="col s12">
                        <input class="waves-effect waves-light btn" type="submit" value="ZAPISZ" />
                        <a href="widok?table=${tabela}" class="waves-effect waves-light btn">POWRÓT</a>
                    </div>
                </div>
            </form>
        </div>
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
          <script>
            document.addEventListener('DOMContentLoaded', function() {
                M.AutoInit();
                M.updateTextFields();
            });
          </script>
    </body>
</html>