package Demo.deviceIsIt.persistance;

import Demo.deviceIsIt.persistance.dao.CommentoDAO;
import Demo.deviceIsIt.persistance.dao.ContenutoDAO;
import Demo.deviceIsIt.persistance.dao.DeviceDAO;
import Demo.deviceIsIt.persistance.dao.ListaPreferitiDAO;
import Demo.deviceIsIt.persistance.dao.UtenteDAO;
import Demo.deviceIsIt.persistance.dao.jdbc.CommentoDAOJDBC;
import Demo.deviceIsIt.persistance.dao.jdbc.ContenutoDAOJDBC;
import Demo.deviceIsIt.persistance.dao.jdbc.DeviceDAOJDBC;
import Demo.deviceIsIt.persistance.dao.jdbc.ListaPreferitiDAOJDBC;
import Demo.deviceIsIt.persistance.dao.jdbc.UtenteDAOJDBC;

public class DBManager {
	
	private static DBManager instance = null;
	static DBSource dataSource;
	
	static {
		try {
			Class.forName("org.postgresql.Driver");
			dataSource=new DBSource("jdbc:postgresql://localhost:5432/deviceIsIt","postgres","postgres");
		} 
		catch (Exception e) {
			System.err.println("PostgresDAOFactory.class: failed to load MySQL JDBC driver\n"+e);
			e.printStackTrace();
		}
	}
	
	public static DBManager getInstance() {
		if (instance == null) {
			instance = new DBManager();
		}
		return instance;
	}
	
	private DBManager() {}
	
	public static DBSource getDataSource() {
		return dataSource;
	}
	
	public UtenteDAO utenteDAO() {
		return new UtenteDAOJDBC(dataSource);
	}
	
	public DeviceDAO deviceDAO() {
		return new DeviceDAOJDBC(dataSource);
	}
	
	public ContenutoDAO ContenutoDAO() {
		return new ContenutoDAOJDBC(dataSource);
	}
	
	public CommentoDAO CommentoDAO() {
		return new CommentoDAOJDBC(dataSource);
	}
	
	public ListaPreferitiDAO ListaPreferitiDAO() {
		return new ListaPreferitiDAOJDBC(dataSource);
	}

}
