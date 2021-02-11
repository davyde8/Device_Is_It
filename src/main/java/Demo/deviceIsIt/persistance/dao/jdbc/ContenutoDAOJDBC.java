package Demo.deviceIsIt.persistance.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Demo.deviceIsIt.model.Contenuto;
import Demo.deviceIsIt.persistance.DBSource;
import Demo.deviceIsIt.persistance.dao.ContenutoDAO;

public class ContenutoDAOJDBC implements ContenutoDAO {

	DBSource dbSource;
	
	public ContenutoDAOJDBC(DBSource dbSource) {
		this.dbSource= dbSource;
	}

	@Override
	public void save(Contenuto contenuto) {
		
		try {
			Connection conn = dbSource.getConnection();

			String query = "insert into contenuto values(DEFAULT,?,?,?,?,?,?,?);"; // prendiamo la query
			PreparedStatement st = conn.prepareStatement(query); // creiamo lo statement
			st.setDate(1, contenuto.getData());
			st.setInt(2, contenuto.getTipo());
			st.setInt(3, contenuto.getDevice());
			st.setString(4, contenuto.getTesto());
			st.setString(5, contenuto.getTitolo());
			st.setString(6, contenuto.getImg());
			st.setString(7, contenuto.getAnteprima());
			st.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

	@Override
	public boolean existRecensione(Integer idDevice) {
			Contenuto contenuto = new Contenuto();			
			try {
				Connection conn = dbSource.getConnection();
				String query = "select * from contenuto where device=? and tipologia=2;";
				PreparedStatement st = conn.prepareStatement(query);
				st.setInt(1, idDevice);
				ResultSet rs = st.executeQuery();
				if (rs.next()) {
					contenuto.setIdContenuto(rs.getInt("id"));
					contenuto.setData(rs.getDate("data"));
					contenuto.setTipo(rs.getInt("tipologia"));
					contenuto.setDevice(rs.getInt("device"));
					contenuto.setTesto(rs.getString("testo"));
					contenuto.setTitolo(rs.getString("titolo"));
					contenuto.setImg(rs.getString("img"));	
					contenuto.setAnteprima(rs.getString("anteprima"));
					return true;
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}	
			return false;		
	}

	
	
	@Override
	public Contenuto getRecensioneByDevice(Integer idDevice) {
			Contenuto contenuto = new Contenuto();			
			try {
				Connection conn = dbSource.getConnection();
				String query = "select * from contenuto where device=? and tipologia=2;";
				PreparedStatement st = conn.prepareStatement(query);
				st.setInt(1, idDevice);
				ResultSet rs = st.executeQuery();
				if (rs.next()) {
					contenuto.setIdContenuto(rs.getInt("id"));
					contenuto.setData(rs.getDate("data"));
					contenuto.setTipo(rs.getInt("tipologia"));
					contenuto.setDevice(rs.getInt("device"));
					contenuto.setTesto(rs.getString("testo"));
					contenuto.setTitolo(rs.getString("titolo"));
					contenuto.setImg(rs.getString("img"));	
					contenuto.setAnteprima(rs.getString("anteprima"));					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}	
			return contenuto;		
	}
	
	
	
	@Override
	public void saveWithoutDevice(Contenuto contenuto) {
		
		try {
			Connection conn = dbSource.getConnection();

			String query = "insert into contenuto values(DEFAULT,?,?,null,?,?,?,?);"; // prendiamo la query
			PreparedStatement st = conn.prepareStatement(query); // creiamo lo statement
			st.setDate(1, contenuto.getData());
			st.setInt(2, contenuto.getTipo());
			st.setString(3, contenuto.getTesto());
			st.setString(4, contenuto.getTitolo());
			st.setString(5, contenuto.getImg());
			st.setString(6, contenuto.getAnteprima());
			st.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public Contenuto findByPrimaryKey(int idContenuto) {
		Contenuto contenuto = new Contenuto();
		
		try {
			Connection conn = dbSource.getConnection();
			String query = "select * from contenuto where id=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, idContenuto);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				contenuto.setIdContenuto(rs.getInt("id"));
				contenuto.setData(rs.getDate("data"));
				contenuto.setTipo(rs.getInt("tipologia"));
				contenuto.setDevice(rs.getInt("device"));
				contenuto.setTesto(rs.getString("testo"));
				contenuto.setTitolo(rs.getString("titolo"));
				contenuto.setImg(rs.getString("img"));	
				contenuto.setAnteprima(rs.getString("anteprima"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	return contenuto;
	}

	@Override
	public List<Contenuto> findAll() {
		List<Contenuto> contenuti = new ArrayList <Contenuto>();
		try {
			Connection con = dbSource.getConnection();
			String query = "select * from contenuto";
			PreparedStatement st = con.prepareStatement(query);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {				
				Contenuto contenuto= new Contenuto();						
				contenuto.setIdContenuto(rs.getInt("id"));		
				contenuto.setData(rs.getDate("data"));
				contenuto.setTipo(rs.getInt("tipologia"));
				contenuto.setDevice(rs.getInt("device"));
				contenuto.setTesto(rs.getString("testo"));
				contenuto.setTitolo(rs.getString("titolo"));	
				contenuto.setImg(rs.getString("img"));
				contenuto.setAnteprima(rs.getString("anteprima"));
				contenuti.add(contenuto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return contenuti;
	}

	@Override
	public void update(Contenuto c) {
		Connection connection = null;
		
		try {
			connection = this.dbSource.getConnection();
			String update = "update contenuto SET data=?, tipologia=?, device=?, testo=?, titolo=?, img=?, anteprima=? WHERE id=?";
			PreparedStatement statement = connection.prepareStatement(update);
			statement.setDate(1, c.getData());
			statement.setInt(2, c.getTipo());
			statement.setInt(3, c.getDevice());
			statement.setString(4, c.getTesto());
			statement.setString(5, c.getTitolo());
			statement.setString(6, c.getImg());
			statement.setString(7, c.getAnteprima());
			statement.setInt(8, c.getid());
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
	public void updateWithoutDevice(Contenuto c) {
	Connection connection = null;
		
		try {
			connection = this.dbSource.getConnection();
			String update = "update contenuto SET data=?, tipologia=?, testo=?, titolo=?, img=?, anteprima=? WHERE id=?";
			PreparedStatement statement = connection.prepareStatement(update);
			statement.setDate(1, c.getData());
			statement.setInt(2, c.getTipo());
			statement.setString(3, c.getTesto());
			statement.setString(4, c.getTitolo());
			statement.setString(5, c.getImg());
			statement.setString(6, c.getAnteprima());
			statement.setInt(7,c.getid());
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
	public void delete(int  idContenuto) {
		Connection connection = null;
		
		try {
			connection = this.dbSource.getConnection();
			String delete = "delete FROM contenuto WHERE id=? ";
			PreparedStatement statement = connection.prepareStatement(delete);
			statement.setInt(1, idContenuto);
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
	public List<Contenuto> findByTipology(Integer tipologia) {
		List<Contenuto> contenuti = new ArrayList <Contenuto>();
		try {
			Connection conn = dbSource.getConnection();
			String query = "select * from contenuto where id=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, tipologia);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {				
				Contenuto contenuto= new Contenuto();	
				contenuto.setIdContenuto(rs.getInt("id"));
				contenuto.setData(rs.getDate("data"));
				contenuto.setTipo(rs.getInt("tipologia"));
				contenuto.setDevice(rs.getInt("device"));
				contenuto.setTesto(rs.getString("testo"));
				contenuto.setTitolo(rs.getString("titolo"));
				contenuto.setImg(rs.getString("img"));
				contenuto.setAnteprima(rs.getString("anteprima"));

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return contenuti;
	}

	@Override
	public List<Contenuto> findRecensioniPc() {
		List<Contenuto> contenuti = new ArrayList <Contenuto>();
		try {
			Connection conn = dbSource.getConnection();
			String query = "select contenuto.* from contenuto, device where contenuto.tipologia=2 and contenuto.device=device.id and device.tipodevice=2;";
			PreparedStatement st = conn.prepareStatement(query);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {				
				Contenuto contenuto= new Contenuto();	
				contenuto.setIdContenuto(rs.getInt("id"));
				contenuto.setData(rs.getDate("data"));
				contenuto.setTipo(rs.getInt("tipologia"));
				contenuto.setDevice(rs.getInt("device"));
				contenuto.setTesto(rs.getString("testo"));
				contenuto.setTitolo(rs.getString("titolo"));
				contenuto.setImg(rs.getString("img"));
				contenuto.setAnteprima(rs.getString("anteprima"));

				contenuti.add(contenuto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return contenuti;
	}

	@Override
	public List<Contenuto> findRecensioniSmartphone() {
		List<Contenuto> contenuti = new ArrayList <Contenuto>();
		try {
			Connection conn = dbSource.getConnection();
			String query ="select contenuto.* from contenuto, device where contenuto.tipologia=2 and contenuto.device=device.id and device.tipodevice=1;";
			PreparedStatement st = conn.prepareStatement(query);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {				
				Contenuto contenuto= new Contenuto();	
				contenuto.setIdContenuto(rs.getInt("id"));
				contenuto.setData(rs.getDate("data"));
				contenuto.setTipo(rs.getInt("tipologia"));
				contenuto.setDevice(rs.getInt("device"));
				contenuto.setTesto(rs.getString("testo"));
				contenuto.setTitolo(rs.getString("titolo"));
				contenuto.setImg(rs.getString("img"));	
				contenuto.setAnteprima(rs.getString("anteprima"));

				contenuti.add(contenuto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return contenuti;
	}

	
	
	@Override
	public List<Contenuto> findArticoli() {
		List<Contenuto> contenuti = new ArrayList <Contenuto>();
		try {
			Connection conn = dbSource.getConnection();
			String query = "select * from contenuto where tipologia=1 order by data desc;";
			PreparedStatement st = conn.prepareStatement(query);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {				
				Contenuto contenuto= new Contenuto();	
				contenuto.setIdContenuto(rs.getInt("id"));
				contenuto.setData(rs.getDate("data"));
				contenuto.setTipo(rs.getInt("tipologia"));
				contenuto.setDevice(rs.getInt("device"));
				contenuto.setTesto(rs.getString("testo"));
				contenuto.setTitolo(rs.getString("titolo"));
				contenuto.setImg(rs.getString("img"));
				contenuto.setAnteprima(rs.getString("anteprima"));

				contenuti.add(contenuto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return contenuti;
	}

	@Override
	public List<Contenuto> findRecensioni() {
		List<Contenuto> contenuti = new ArrayList <Contenuto>();
		try {
			Connection conn = dbSource.getConnection();
			String query = "select * from contenuto where tipologia=2 order by data desc;";
			PreparedStatement st = conn.prepareStatement(query);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {				
				Contenuto contenuto= new Contenuto();	
				contenuto.setIdContenuto(rs.getInt("id"));
				contenuto.setData(rs.getDate("data"));
				contenuto.setTipo(rs.getInt("tipologia"));
				contenuto.setDevice(rs.getInt("device"));
				contenuto.setTesto(rs.getString("testo"));
				contenuto.setTitolo(rs.getString("titolo"));
				contenuto.setImg(rs.getString("img"));
				contenuto.setAnteprima(rs.getString("anteprima"));

				contenuti.add(contenuto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return contenuti;
	}

	@Override
	public List<Contenuto> findLastThreeArticoli() {
		List<Contenuto> contenuti = new ArrayList <Contenuto>();
		try {
			Connection conn = dbSource.getConnection();
			String query = "select * from contenuto where tipologia=1 order by data desc limit 3";
			PreparedStatement st = conn.prepareStatement(query);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {				
				Contenuto contenuto= new Contenuto();	
				contenuto.setIdContenuto(rs.getInt("id"));
				contenuto.setData(rs.getDate("data"));
				contenuto.setTipo(rs.getInt("tipologia"));
				contenuto.setDevice(rs.getInt("device"));
				contenuto.setTesto(rs.getString("testo"));
				contenuto.setTitolo(rs.getString("titolo"));
				contenuto.setImg(rs.getString("img"));
				contenuto.setAnteprima(rs.getString("anteprima"));

				contenuti.add(contenuto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return contenuti;
	}
	
	

	@Override
	public List<Contenuto> findLastThreeRecensioni() {
		List<Contenuto> contenuti = new ArrayList <Contenuto>();
		try {
			Connection conn = dbSource.getConnection();
			String query = "select * from contenuto where tipologia=2 order by data desc limit 3";
			PreparedStatement st = conn.prepareStatement(query);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {				
				Contenuto contenuto= new Contenuto();	
				contenuto.setIdContenuto(rs.getInt("id"));
				contenuto.setData(rs.getDate("data"));
				contenuto.setTipo(rs.getInt("tipologia"));
				contenuto.setDevice(rs.getInt("device"));
				contenuto.setTesto(rs.getString("testo"));
				contenuto.setTitolo(rs.getString("titolo"));
				contenuto.setImg(rs.getString("img"));
				contenuto.setAnteprima(rs.getString("anteprima"));

				contenuti.add(contenuto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return contenuti;
	}
	

	@Override
	public List<Contenuto> researchResultArticoli(String string) {
		List<Contenuto> contenuti = new ArrayList <Contenuto>();
		try {
			Connection conn = dbSource.getConnection();
			String query = "select * from contenuto where titolo ILIKE ? or testo ILIKE ? group by(id) having tipologia=1;";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, string);
			st.setString(2, string);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {				
				Contenuto contenuto= new Contenuto();	
				contenuto.setIdContenuto(rs.getInt("id"));
				contenuto.setData(rs.getDate("data"));
				contenuto.setTipo(rs.getInt("tipologia"));
				contenuto.setDevice(rs.getInt("device"));
				contenuto.setTesto(rs.getString("testo"));
				contenuto.setTitolo(rs.getString("titolo"));
				contenuto.setImg(rs.getString("img"));
				contenuto.setAnteprima(rs.getString("anteprima"));
				contenuti.add(contenuto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return contenuti;
	}

	@Override
	public List<Contenuto> researchResultRecensioni(String string) {
		List<Contenuto> contenuti = new ArrayList <Contenuto>();
		try {
			Connection conn = dbSource.getConnection();
			String query = "select * from contenuto where titolo ILIKE ? or testo ILIKE ? group by(id) having tipologia=2;";
			PreparedStatement st = conn.prepareStatement(query);
			st.setString(1, string);
			st.setString(2, string);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {				
				Contenuto contenuto= new Contenuto();	
				contenuto.setIdContenuto(rs.getInt("id"));
				contenuto.setData(rs.getDate("data"));
				contenuto.setTipo(rs.getInt("tipologia"));
				contenuto.setDevice(rs.getInt("device"));
				contenuto.setTesto(rs.getString("testo"));
				contenuto.setTitolo(rs.getString("titolo"));
				contenuto.setImg(rs.getString("img"));
				contenuto.setAnteprima(rs.getString("anteprima"));
				contenuti.add(contenuto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return contenuti;
	}

	@Override
	public int getNumCommenti(int idContenuto) {
		
		int numCommenti=0;
		try {
			Connection conn = dbSource.getConnection();
			String query = "select count(commento.*) from commento, contenuto where contenuto.id=commento.contenuto and contenuto.id=?";
			PreparedStatement st = conn.prepareStatement(query);
			st.setInt(1, idContenuto);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				numCommenti=(rs.getInt("count"));				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return numCommenti;
		
	}

	
	


}
