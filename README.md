# PKI
Aby uruchomić aplikację należy zainstalować serwer tomcat orz bazę danych Postgresql. Przy instalacji bazy hasło użytkownika
postgres ustawić jako "test".  
Następnie należy utworzyć na bazie postgres bazę danych o nazwie test.  
`create database test;`  

Należy wgrać plik "struktura_i_dane.sql" do bazy danych np. narzędziemy phpPgAdmin lub wbudowanym narzędziem psql  
`psql -U postgres -d test -f struktura_i_dane.sql`  
Na koniec wrzucamy plik "pki-projekt.war" do folderu "webapps" w serwerze tomcat.  
Aplikacja powinna być dostępna pod adresem http://localhost:8080/pki-projekt