package project_cuoi_ky.dbcontext;

import java.sql.Connection;

public class DBContext {
	public static Connection getConnection() {
		return MySqlConnection.getConnection();
	}
}
