package Trabalho.Postagens;

import Trabalho.Usuarios.UsuariosDAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PostagensDAO {

    private String url = "jdbc:postgresql://10.0.1.10:5432/progweb";
    private String usuario = "giordanolima";
    private String senha = "123giordano";
    private Connection conn;

    public PostagensDAO() {
        try {
            Class.forName("org.postgresql.Driver").newInstance();
            this.conn = DriverManager.getConnection(this.url, this.usuario, this.senha);
        } catch (SQLException ex) {
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        } catch (Exception e) {
            System.out.println("Problemas ao tentar conectar com o banco de dados: " + e);
        }
    }

    public ArrayList<Postagens> buscar() throws SQLException {
        
        // Criei a consulta SQL que será executada no banco
        String sql = "SELECT * FROM comentarios ORDER BY id DESC";
        
        // Criei a instância do objeto para executar o comando
        PreparedStatement consulta = this.conn.prepareStatement(sql);
        
        // Executando o comando e armazenando o resultado
        // em uma variável da classe ResultSet
        ResultSet resultado = consulta.executeQuery();
        ArrayList<Postagens> retorno = new ArrayList<Postagens>();
        
        UsuariosDAO usuariodao = new UsuariosDAO();
        
        while(resultado.next()) {
            
            int id = resultado.getInt("id");
            int usuarioId = resultado.getInt("usuario_id");
            String comentario = resultado.getString("comentario");
            
            Postagens post =  new Postagens();
            post.setId(id);
            post.setUsuarioId(usuarioId);
            post.setComentario(comentario);
            post.setUsuario(usuariodao.getById(usuarioId));
            
            retorno.add(post);
            
        }
        return retorno;
    }
    
    public void inserir(Postagens post) throws SQLException {
        
        // Consulta SQL que será executada dentro do Banco de Dados
        String consulta = "INSERT INTO comentarios (usuario_id, comentario) VALUES (?,?)";
        //Instância do PreparedStatement que executará a consulta
        PreparedStatement sql = this.conn.prepareStatement(consulta);
        
        // Setando os valores vindo dentro da instância "bebida" para dentro da consulta SQL
        sql.setInt(1, post.getUsuarioId());
        sql.setString(2, post.getComentario());
        sql.execute();
        
        
    }
    
    public Postagens getById(int id) throws SQLException {
        
        String consulta = "SELECT * FROM comentarios WHERE id = ?";
        PreparedStatement sql = this.conn.prepareStatement(consulta);
        sql.setInt(1, id);
        ResultSet resultado = sql.executeQuery();
        resultado.next();
        
        int usuarioId = resultado.getInt("usuario_id");
        String comentario = resultado.getString("comentario");

        Postagens post =  new Postagens();
        post.setId(id);
        post.setUsuarioId(usuarioId);
        post.setComentario(comentario);
        
        return post;
    }
    
    public void excluir(int id) throws SQLException {
        String consulta = "DELETE FROM comentarios WHERE id = ?";
        PreparedStatement sql = this.conn.prepareStatement(consulta);
        sql.setInt(1, id);
        sql.execute();
    }
    
}
