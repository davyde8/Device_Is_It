package Demo.deviceIsIt.persistance.dao.jdbc;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Demo.deviceIsIt.model.Commento;
import Demo.deviceIsIt.persistance.DBSource;
import Demo.deviceIsIt.persistance.dao.CommentoDAO;

public class CommentoDAOJDBC implements CommentoDAO {
	DBSource dbSource;
	
	public CommentoDAOJDBC(DBSource dbSource) {
		this.dbSource = dbSource;
	}
	
	
	@Override
	public void save(Commento commento) {
		Connection conn;
		try {
			conn = dbSource.getConnection();
			String query = "insert into commento values(DEFAULT,?,?,?,?,0);"; // prendiamo la query
			PreparedStatement st = conn.prepareStatement(query); // creiamo lo statement
			st.setInt(1, commento.getcontenuto());
			st.setString(2, commento.getutente());
			st.setDate(3, commento.getData());
			st.setString(4, commento.getTesto());
			st.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	@Override
	public Commento findByPrimaryKey(int idcommento) {
		Commento commento=null;		
		try {
			Connection conn = dbSource.getConnection();
			String query = "select * from commento where idcommento=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, idcommento);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				int id = rs.getInt("idcommento");
				int contenuto = rs.getInt("contenuto");
				String utente = rs.getString("utente");
				Date data = rs.getDate("data");
				String testo = rs.getString("testo");
				int mipiace = rs.getInt("mipiace");
				commento = new Commento();
				commento.setidcommento(id);
				commento.setcontenuto(contenuto);
				commento.setutente(utente);
				commento.setData(data);
				commento.setTesto(testo);
				commento.setmipiace(mipiace);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
	return commento;

	}

	@Override
	public List<Commento> findAll() {
			List<Commento> commenti = new ArrayList<Commento>();
			
			try {
				Connection conn = dbSource.getConnection();
				String query = "select * from commento";
				Statement st = conn.createStatement();
				ResultSet rs = st.executeQuery(query);
				while (rs.next()) {
					int idcommento = rs.getInt("idcommento");
					int contenuto = rs.getInt("contenuto");
					String utente = rs.getString("utente");
					Date data = rs.getDate("data");
					String testo = rs.getString("testo");
					int mipiace = rs.getInt("mipiace");
					
					System.out.println(idcommento + contenuto + utente + data+testo);
					Commento commento = new Commento();
					commento.setidcommento(idcommento);
					commento.setcontenuto(contenuto);
					commento.setutente(utente);
					commento.setData(data);
					commento.setTesto(testo);
					commento.setmipiace(mipiace);
					
					commenti.add(commento);
					System.out.println("creato");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return commenti;
	}

	@Override
	public void update(Commento commento) {
		Connection connection = null;
		try {
			connection = this.dbSource.getConnection();
			String update = "update commento SET contenuto = ?, utente = ?, data = ?, testo = ?, mipiace = ? WHERE idCommento=?";
			PreparedStatement st = connection.prepareStatement(update);
			st.setInt(1, commento.getidcommento());
			st.setInt(2, commento.getcontenuto());
			st.setString(3, commento.getutente());
			st.setDate(4, commento.getData());
			st.setString(5, commento.getTesto());
			st.setInt(6, commento.getmipiace());
			st.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}

	@Override
	public void delete(int idcommento) {
		Connection connection = null;
		try {
			connection = this.dbSource.getConnection();
			String delete = "delete FROM commento WHERE idcommento = ? ";
			PreparedStatement statement = connection.prepareStatement(delete);
			statement.setInt(1, idcommento);
			statement.executeUpdate();
			
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}


	@Override
	public List<Commento> findByContenuto(int idcontenuto) {
		List<Commento> commenti = new ArrayList<Commento>();
		try {
			Connection conn = dbSource.getConnection();
			String query = "Select commento.* from commento,contenuto where commento.contenuto=contenuto.id and contenuto.id=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, idcontenuto);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int idcommento = rs.getInt("idcommento");
				int contenuto = rs.getInt("contenuto");
				String utente = rs.getString("utente");
				Date data = rs.getDate("data");
				String testo = rs.getString("testo");
				int mipiace = rs.getInt("mipiace");
				Commento commento = new Commento();
				commento.setidcommento(idcommento);
				commento.setcontenuto(contenuto);
				commento.setutente(utente);
				commento.setData(data);
				commento.setTesto(testo);
				commento.setmipiace(mipiace);
				
				commenti.add(commento);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	return commenti;
	}
	
	@Override
	public List<Commento> findByUser(String email) {
		List<Commento> commenti = new ArrayList<Commento>();
		try {
			Connection conn = dbSource.getConnection();
			String query = "Select commento.* from commento,utente where commento.utente=utente.email and email=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, email);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				int idcommento = rs.getInt("idcommento");
				int contenuto = rs.getInt("contenuto");
				String utente = rs.getString("utente");
				Date data = rs.getDate("data");
				String testo = rs.getString("testo");
				int mipiace = rs.getInt("mipiace");
				
				Commento commento = new Commento();
				
				commento.setidcommento(idcommento);
				commento.setcontenuto(contenuto);
				commento.setutente(utente);
				commento.setData(data);
				commento.setTesto(testo);
				commento.setmipiace(mipiace);
				
				commenti.add(commento);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	return commenti;
	}


	@Override
	public void addmipiace(int idcommento) {
		try {
			Connection conn = dbSource.getConnection();
			String query = "update commento SET mipiace = mipiace+1 WHERE idcommento=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, idcommento);
			st.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

		


}
