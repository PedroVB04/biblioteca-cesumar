package com.cesumar.biblioteca.controller;

import com.cesumar.biblioteca.model.Livro;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/livros")
public class LivroServlet extends HttpServlet {

    private List<Livro> livros = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        
        if ("delete".equals(action)) {
            String isbnToDelete = req.getParameter("isbn");
            System.out.println("🔍 Tentando excluir ISBN: " + isbnToDelete);

            boolean removed = livros.removeIf(livro -> livro.getIsbn().trim().equals(isbnToDelete.trim()));
            System.out.println("✅ Livro removido? " + removed);

            resp.sendRedirect("livros");
            return;
        }

        req.setAttribute("livros", livros);
        req.getRequestDispatcher("listagem.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String titulo = req.getParameter("titulo");
        String autor = req.getParameter("autor");
        String anoStr = req.getParameter("ano");
        String isbn = req.getParameter("isbn");

        if (titulo == null || autor == null || anoStr == null || isbn == null ||
            titulo.isEmpty() || autor.isEmpty() || anoStr.isEmpty() || isbn.isEmpty()) {
            req.setAttribute("erro", "Todos os campos são obrigatórios!");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
            return;
        }

        try {
            int ano = Integer.parseInt(anoStr);
            Livro livro = new Livro(titulo, autor, ano, isbn);
            livros.add(livro);
            resp.sendRedirect("livros");
        } catch (NumberFormatException e) {
            req.setAttribute("erro", "Ano inválido!");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
    }
}
