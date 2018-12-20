package Trabalho.Usuarios;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuariosDAO {

    private String url = "jdbc:postgresql://10.0.1.10:5432/progweb";
    private String usuario = "giordanolima";
    private String senha = "123giordano";
    private Connection conn;

    public UsuariosDAO() {
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
    
    public void inserir(Usuarios usuario) throws SQLException {
        
        // Consulta SQL que será executada dentro do Banco de Dados
        String consulta = "INSERT INTO usuarios (nome, senha, email) VALUES (?,?,?)";
        //Instância do PreparedStatement que executará a consulta
        PreparedStatement sql = this.conn.prepareStatement(consulta);
        
        // Setando os valores vindo dentro da instância "bebida" para dentro da consulta SQL
        sql.setString(1, usuario.getNome());
        sql.setString(2, usuario.getSenha());
        sql.setString(3, usuario.getEmail());
        
        sql.execute();
        
        
    }
    
    public Usuarios login(String email, String senha) throws SQLException {
        // Consulta SQL que será executada dentro do Banco de Dados
        String consulta = "SELECT * FROM usuarios WHERE email = ? AND senha = ?";
        //Instância do PreparedStatement que executará a consulta
        PreparedStatement sql = this.conn.prepareStatement(consulta);
        sql.setString(1, email);
        sql.setString(2, senha);
        ResultSet resultado = sql.executeQuery();
        
        if(!resultado.next()) {
            return null;
        }
        
        Usuarios retorno = new Usuarios();
        retorno.setId(resultado.getInt("id"));
        retorno.setNome(resultado.getString("nome"));
        retorno.setEmail(resultado.getString("email"));
        retorno.setSenha(resultado.getString("senha"));
        return retorno;
        
    }
    
    public Usuarios getById(int id) throws SQLException {
        
        String consulta = "SELECT * FROM usuarios WHERE id = ?";
        PreparedStatement sql = this.conn.prepareStatement(consulta);
        sql.setInt(1, id);
        ResultSet resultado = sql.executeQuery();
        resultado.next();
        
        String nome = resultado.getString("nome");
        String email = resultado.getString("email");
        String senha = resultado.getString("senha");
        
        Usuarios retorno = new Usuarios();
        retorno.setId(id);
        retorno.setNome(nome);
        retorno.setEmail(email);
        retorno.setSenha(senha);
        
        return retorno;
    }
    
    public void editar(Usuarios usuario) throws SQLException {
        
        String consulta = "UPDATE usuarios SET nome = ?, email = ?, senha = ? WHERE id = ?";
        PreparedStatement sql = this.conn.prepareStatement(consulta);
        sql.setString(1, usuario.getNome());
        sql.setString(2, usuario.getEmail());
        sql.setString(3, usuario.getSenha());
        sql.setInt(4, usuario.getId());
        sql.execute();
        
    }
    
}
