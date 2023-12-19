package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import Entiny.DanhMuc;

public class DanhMucDao {

	private static Connection connection = DatabaseUtil.getConnection();

	public static ArrayList<DanhMuc> layTatCaDanhMuc() {
		ArrayList<DanhMuc> listDanhMuc = new ArrayList<DanhMuc>();
		try {
			PreparedStatement ps = connection.prepareStatement("select * from DanhMuc");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				DanhMuc danhMuc = new DanhMuc(rs.getInt("ma"),rs.getString("ten"));
				listDanhMuc.add(danhMuc);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		// output
		return listDanhMuc;
	}
	
	
}
