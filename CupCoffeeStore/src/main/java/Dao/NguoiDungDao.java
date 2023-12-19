package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Entiny.NguoiDung;

public class NguoiDungDao {

	private static Connection connection = DatabaseUtil.getConnection();
	
	public static boolean kiemTraDangNhap(String tenDangNhap,String matKhau) {
		try {
			PreparedStatement ps = connection.prepareStatement("select * from NguoiDung where tenDangNhap = ?");
			ps.setString(1,tenDangNhap);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				
				if (rs.getString("matKhau").equals(matKhau))
				{
					return true;
				}
			}
		} catch (Exception e) {
			System.out.println("test");
		}
		
		return false;
	}
	
	public static boolean dangKiTaiKhoan(String tenDangNhap,String matKhau) {
		try {
			PreparedStatement ps = connection.prepareStatement("INSERT INTO `NguoiDung` (tenDangNhap,matKhau) values (?,?)");;
			ps.setString(1, tenDangNhap);
			ps.setString(2, matKhau);
			
			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return false;
	}
	
	public static NguoiDung layNguoiDungBangTenDangNhap(String tenDangNhap) {
		try {
			PreparedStatement ps = connection.prepareStatement("SELECT * from NguoiDung where tenDangNhap = ?");
			ps.setString(1,tenDangNhap);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				NguoiDung nguoiDung = new NguoiDung(rs.getString("tenDangNhap"),rs.getString("matKhau"),rs.getInt("quyen"));
				return nguoiDung;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return null;
	}
	public static void main(String[] args) {
		System.out.println(dangKiTaiKhoan("admin2", "1"));
	}
}
