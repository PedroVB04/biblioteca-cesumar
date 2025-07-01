<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cesumar.biblioteca.model.Livro" %>
<html>
<head>
    <title>Lista de Livros</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f3;
            text-align: center;
            margin-top: 40px;
        }

        table {
            margin: 0 auto;
            border-collapse: collapse;
            width: 80%;
            background-color: #fff;
            box-shadow: 0 0 8px rgba(0,0,0,0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px 15px;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        td {
            text-align: center;
        }

        a {
            color: #0066cc;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .btn-delete {
            color: red;
        }

        .btn-back {
            margin-top: 20px;
            display: inline-block;
            background-color: #555;
            color: white;
            padding: 10px 15px;
            border-radius: 4px;
            text-decoration: none;
        }

        .btn-back:hover {
            background-color: #333;
        }
    </style>
</head>
<body>

<h2>Livros Cadastrados</h2>

<%
    List<Livro> livros = (List<Livro>) request.getAttribute("livros");
    if (livros != null && !livros.isEmpty()) {
%>
    <table>
        <tr>
            <th>Título</th>
            <th>Autor</th>
            <th>Ano</th>
            <th>ISBN</th>
            <th>Ações</th>
        </tr>
        <% for (Livro livro : livros) { %>
            <tr>
                <td><%= livro.getTitulo() %></td>
                <td><%= livro.getAutor() %></td>
                <td><%= livro.getAno() %></td>
                <td><%= livro.getIsbn() %></td>
                <td>
                    <a href="livros?action=delete&isbn=<%= livro.getIsbn() %>" class="btn-delete" onclick="return confirm('Tem certeza que deseja excluir este livro?');">Excluir</a>
                </td>
            </tr>
        <% } %>
    </table>
<% } else { %>
    <p>Nenhum livro cadastrado ainda.</p>
<% } %>

<a href="index.jsp" class="btn-back">Voltar</a>

</body>
</html>
