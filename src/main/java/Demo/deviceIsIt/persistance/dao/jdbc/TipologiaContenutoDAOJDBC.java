package Demo.deviceIsIt.persistance.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Demo.deviceIsIt.model.TipologiaContenuto;
import Demo.deviceIsIt.model.Utente;
import Demo.deviceIsIt.persistance.DBSource;
import Demo.deviceIsIt.persistance.dao.TipologiaContenutoDAO;

public class TipologiaContenutoDAOJDBC implements TipologiaContenutoDAO{
	
	DBSource dbSource;
	
	public TipologiaContenutoDAOJDBC(DBSource dbSource) {
		this.dbSource = dbSource;
	}

	@Override
	public void save(TipologiaContenuto tipoContenuto) {
		Connection conn;

		try {
			conn = dbSource.getConnection();

			String query = "insert into tipologiaContenuto values(?,?);"; // prendiamo la query
			PreparedStatement st = conn.prepareStatement(query); // creiamo lo statement
			st.setInt(1, tipoContenuto.getIdTipologia());
			st.setString(2, tipoContenuto.getDescrizione());
			st.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public TipologiaContenuto findByPrimaryKey(int idTipologia) {
		TipologiaContenuto tipo = null;
		
		try {
			Connection conn = dbSource.getConnection();
			String query = "select * from tipologiaContenuto where idTipologia=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, idTipologia);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				String idtipo = rs.getString("idTipologia");
				String descrizione = rs.getString("descrizione");
				
				tipo.setIdTipologia(Integer.parseInt(idtipo));
				tipo.setDescrizione(descrizione);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
	return tipo;
	}

	@Override
	public List<TipologiaContenuto> findAll() {
		List<TipologiaContenuto> tipi = new ArrayList<TipologiaContenuto>();
		
		try {
			Connection conn = dbSource.getConnection();
			String query = "select * from tipologiaContenuto";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				String idTipo = rs.getString("idTipologia");
				String descrizione = rs.getString("descrizione");
				
				TipologiaContenuto tipo = new TipologiaContenuto();
				
				tipo.setIdTipologia(Integer.parseInt(idTipo));
				tipo.setDescrizione(descrizione);
				
				tipi.add(tipo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	return tipi;
	}

	@Override
	public void update(TipologiaContenuto tipoContenuto) {
		Connection connection = null;
		try {
			connection = this.dbSource.getConnection();
			String update = "update tipologiaContenuto SET idTipologia = ?, descrizione = ? WHERE idTipologia=?";
			PreparedStatement statement = connection.prepareStatement(update);
			statement.setInt(1, tipoContenuto.getIdTipologia());
			statement.setString(2, tipoContenuto.getDescrizione());
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
	public void delete(TipologiaContenuto tipoContenuto) {
		Connection connection = null;
		
		try {
			connection = this.dbSource.getConnection();
			String delete = "delete FROM tipologiaContenuto WHERE idTipologia = ? ";
			PreparedStatement statement = connection.prepareStatement(delete);
			statement.setInt(1, tipoContenuto.getIdTipologia());
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

}
