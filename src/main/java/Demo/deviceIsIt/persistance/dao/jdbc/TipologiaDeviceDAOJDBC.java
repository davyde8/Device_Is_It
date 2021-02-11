package Demo.deviceIsIt.persistance.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Demo.deviceIsIt.model.TipologiaDevice;
import Demo.deviceIsIt.persistance.DBSource;
import Demo.deviceIsIt.persistance.dao.TipologiaDeviceDAO;

public class TipologiaDeviceDAOJDBC implements TipologiaDeviceDAO {
	DBSource dbSource;
	
	public TipologiaDeviceDAOJDBC(DBSource dbSource) {
		this.dbSource = dbSource;
	}
	
	@Override
	public void save(TipologiaDevice tipoDevice) {
		Connection con;
		try {
			con = dbSource.getConnection();
			String query = "insert into tipologiaDevice values(?,?);"; // prendiamo la query
			PreparedStatement st = con.prepareStatement(query); // creiamo lo statement
			st.setInt(1, tipoDevice.getIdTipologia());
			st.setString(2, tipoDevice.getDescrizione());
			st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public TipologiaDevice findByPrimaryKey(int idTipologia) {
		TipologiaDevice tipo = null;
		try {
			Connection con = dbSource.getConnection();
			String query = "select * from tipologiaDevice where idTipologia=?";
			PreparedStatement st = con.prepareStatement(query);
			st.setInt(1,idTipologia);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				int id = rs.getInt("idTipologia");
				String desc = rs.getString("descrizione");
				tipo.setIdTipologia(id);
				tipo.setDescrizione(desc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tipo;
	}

	@Override
	public List<TipologiaDevice> findAll() {
		List <TipologiaDevice> tipologie = new ArrayList<TipologiaDevice>();
		try {
			Connection con = dbSource.getConnection();
			String query = "select * from tipologiaDevice";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			if(rs.next()) {
				TipologiaDevice t = new TipologiaDevice();
				int id = rs.getInt("idTipologia");
				String desc = rs.getString("descrizione");
				t.setIdTipologia(id);
				t.setDescrizione(desc);
				tipologie.add(t);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tipologie;
	}

	@Override
	public void update(TipologiaDevice tipoDevice) {
		Connection connection = null;
		try {
			connection = this.dbSource.getConnection();
			String update = "update tipologiaDevice SET descrizione = ? WHERE idTipologia=?";
			PreparedStatement st = connection.prepareStatement(update);
			st.setInt(1, tipoDevice.getIdTipologia());
			st.setString(2,tipoDevice.getDescrizione());
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
	public void delete(TipologiaDevice tipoDevice) {
		Connection connection = null;
		try {
			connection = this.dbSource.getConnection();
			String delete = "delete FROM tipologiaDevice WHERE idTipologia = ? ";
			PreparedStatement statement = connection.prepareStatement(delete);
			statement.setInt(1, tipoDevice.getIdTipologia());
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
