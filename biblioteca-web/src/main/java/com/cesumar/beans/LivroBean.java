package com.seuprojeto.beans;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@ManagedBean(name = "livroBean")
@ViewScoped
public class LivroBean implements Serializable {

    private String titulo;
    private String autor;
    private String ano;
    private String isbn;

    private String erro;

    private static List<LivroBean> livrosCadastrados = new ArrayList<>();

    public String getTitulo() { return titulo; }
    public void setTitulo(String titulo) { this.titulo = titulo; }

    public String getAutor() { return autor; }
    public void setAutor(String autor) { this.autor = autor; }

    public String getAno() { return ano; }
    public void setAno(String ano) { this.ano = ano; }

    public String getIsbn() { return isbn; }
    public void setIsbn(String isbn) { this.isbn = isbn; }

    public String getErro() { return erro; }
    public void setErro(String erro) { this.erro = erro; }

    public String cadastrar() {
        if (titulo == null || titulo.isEmpty() ||
            autor == null || autor.isEmpty() ||
            ano == null || ano.isEmpty() ||
            isbn == null || isbn.isEmpty()) {
            erro = "Todos os campos devem ser preenchidos!";
            return null;
        }

        try {
            Integer.parseInt(ano);
        } catch (NumberFormatException e) {
            erro = "Ano deve ser um número válido.";
            return null;
        }

        LivroBean livro = new LivroBean();
        livro.setTitulo(titulo);
        livro.setAutor(autor);
        livro.setAno(ano);
        livro.setIsbn(isbn);
        livrosCadastrados.add(livro);

        titulo = autor = ano = isbn = erro = null;

        return null;
    }

    public List<LivroBean> getLivrosCadastrados() {
        return livrosCadastrados;
    }
}
