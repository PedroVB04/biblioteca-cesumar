<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cadastro de Livros</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            text-align: center;
            margin-top: 50px;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            display: inline-block;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        input[type="text"] {
            width: 250px;
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            margin-top: 10px;
            cursor: pointer;
            border-radius: 4px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        a {
            display: block;
            margin-top: 20px;
            color: #333;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .error {
            color: red;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<h2>Cadastro de Livros</h2>

<% if (request.getAttribute("erro") != null) { %>
    <div class="error"><%= request.getAttribute("erro") %></div>
<% } %>

<form action="livros" method="post">
    <input type="text" name="titulo" placeholder="Título"><br>
    <input type="text" name="autor" placeholder="Autor"><br>
    <input type="text" name="ano" placeholder="Ano de publicação"><br>
    <input type="text" name="isbn" placeholder="ISBN"><br>
    <input type="submit" value="Cadastrar">
</form>

<a href="livros">Ver livros cadastrados</a>

</body>
</html>
