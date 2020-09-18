<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="pl">
    <head>
        <title>.: Tabele :.</title>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col s12">
                    <h2>Lista tabel</h2>
                </div>
            </div>
            <div class="row">
                <form action="widok">
                    <div class="input-field col s12">
                        <select name="table" >
                          <option value="" disabled selected>Wybierz</option>
                          <c:forEach items="${tabele}" var="nazwaTabeli">
                             <option value="${nazwaTabeli}">${nazwaTabeli}</option>
                          </c:forEach>
                        </select>
                        <label>Tabela do wyświetlenia</label>
                    </div>
                </form>
          </div>
      </div>

      <!-- Compiled and minified JavaScript -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
      <script>
        document.addEventListener('DOMContentLoaded', function() {
            var elems = document.querySelectorAll('select');
            var instances = M.FormSelect.init(elems);
          });

          document.querySelector('select').addEventListener('change', () => document.forms[0].submit());
      </script>
    </body>
</html>