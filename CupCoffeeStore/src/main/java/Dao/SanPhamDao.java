package Dao;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import Entiny.SanPham;
public class SanPhamDao {

	private static Connection connection = DatabaseUtil.getConnection();
	
	public static int layTongSanPham() {
		try {
			PreparedStatement ps = connection.prepareStatement("select count(*) from SanPham");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				return rs.getInt(1);

			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return 0;
	}
	
	public static ArrayList<SanPham> layTatCaSanPham(int currentPage, int perPage) {
		ArrayList<SanPham> listSanPham = new ArrayList<SanPham>();

		try {
			PreparedStatement ps = connection.prepareStatement("select * from SanPham ORDER BY ma DESC limit ?,? ");
			ps.setInt(1, currentPage);
			ps.setInt(2, perPage);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				SanPham sanPham = new SanPham(rs.getInt("ma"), rs.getString("ten"), rs.getString("hinh"),rs.getString("xuatXu"), rs.getInt("gia"), rs.getString("moTa"),rs.getInt("maDanhMuc"));
				listSanPham.add(sanPham);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listSanPham;
	}
	
	public static boolean themSanPham(SanPham sanPham) {
		try {
			PreparedStatement ps = connection.prepareStatement(
					"INSERT INTO `SanPham`(`ten`, `hinh`, `xuatXu`, `gia`, `moTa`, `maDanhMuc`) VALUES (?,?,?,?,?,?)");

			ps.setString(1, sanPham.getTen());
			ps.setString(2, sanPham.getHinh());
			ps.setString(3, sanPham.getXuatXu());
			ps.setInt(4,sanPham.getGia());
			ps.setString(5,sanPham.getMoTa());
			ps.setInt(6, sanPham.getMaDanhMuc());
			
			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			
		}

		return false;
	}
	
	public static boolean xoaSanPham(int ma)
	{
		try {
			PreparedStatement ps = connection.prepareStatement("delete from SanPham where ma =?");
			ps.setInt(1, ma);
			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			
		}
		return false;
	}
	
	public static String layAnhBangMaSanPham(int ma) {
		try {
			PreparedStatement ps = connection.prepareStatement("select hinh from SanPham where ma = ?");
			ps.setInt(1, ma);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getString("hinh");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return null;
	}
	
	public static SanPham laySanPhamBangMa(int ma) {
		try {
			PreparedStatement ps = connection.prepareStatement("select * from SanPham where ma = ?");
			ps.setInt(1, ma);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				SanPham sanPham = new SanPham(rs.getInt("ma"), rs.getString("ten"), rs.getString("hinh"),rs.getString("xuatXu"), rs.getInt("gia"), rs.getString("moTa"),rs.getInt("maDanhMuc"));
				return sanPham;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return null;
	}
	
	public static boolean capNhatSanPham(SanPham sanPham) {
		try {
			PreparedStatement ps = connection.prepareStatement("UPDATE `SanPham` SET `ten`= ?,`hinh`= ?,`xuatXu`=?,`gia`=?,`moTa`= ?,`maDanhMuc`= ? WHERE ma = ?");
			ps.setString(1, sanPham.getTen());
			ps.setString(2, sanPham.getHinh());
			ps.setString(3, sanPham.getXuatXu());
			ps.setInt(4,sanPham.getGia());
			ps.setString(5,sanPham.getMoTa());
			ps.setInt(6, sanPham.getMaDanhMuc());
			ps.setInt(7, sanPham.getMa());
			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return false;
	}
	
	
	
		public static int layTongSanPhamTheoTuKhoa(String keyWord) {
			try {
				PreparedStatement ps = connection
						.prepareStatement("select count(*) from SanPham where ten like ? or moTa like ?");
				ps.setString(1, "%" + keyWord + "%");
				ps.setString(2, "%" + keyWord + "%");
				ResultSet rs = ps.executeQuery();

				while (rs.next()) {
					return rs.getInt(1);

				}
			} catch (Exception e) {
				// TODO: handle exception
			}

			return 0;
		}
		
		
		public static ArrayList<SanPham> laySanPhamTheoTuKhoa(int currentPage, int perPage, String keyWord) {
			ArrayList<SanPham> listSanPham = new ArrayList<SanPham>();
			try {
				PreparedStatement ps = connection
						.prepareStatement("select * from SanPham where ten like ? or moTa like ? limit ?,?");
				ps.setString(1, "%" + keyWord + "%");
				ps.setString(2, "%" + keyWord + "%");
				ps.setInt(3, currentPage);
				ps.setInt(4, perPage);

				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					SanPham sanPham = new SanPham(rs.getInt("ma"), rs.getString("ten"), rs.getString("hinh"),rs.getString("xuatXu"), rs.getInt("gia"), rs.getString("moTa"),rs.getInt("maDanhMuc"));
					listSanPham.add(sanPham);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}

			return listSanPham;
		}
		
		public static ArrayList<SanPham> layDanhSachSanPhamTheoDanhMuc(int maDanhMuc, int currentPage, int perPage) {
			ArrayList<SanPham> listSanPham = new ArrayList<SanPham>();
			try {
				Connection conn = DatabaseUtil.getConnection();
				PreparedStatement ps = conn.prepareStatement("select * from SanPham where maDanhMuc = ? limit ?,?");
				ps.setInt(1, maDanhMuc);
				ps.setInt(2, currentPage);
				ps.setInt(3, perPage);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					SanPham sanPham = new SanPham(rs.getInt("ma"), rs.getString("ten"), rs.getString("hinh"),rs.getString("xuatXu"), rs.getInt("gia"), rs.getString("moTa"),rs.getInt("maDanhMuc"));
					listSanPham.add(sanPham);
					
				}

			} catch (Exception e) {
				// TODO: handle exception
			}
			return listSanPham;
		}
		
		public static int layTongSanPhamTheoDanhMuc(int maDanhMuc) {
			try {
				PreparedStatement ps = connection
						.prepareStatement("select count(*) from SanPham where maDanhMuc=?");
				ps.setInt(1, maDanhMuc);
				ResultSet rs = ps.executeQuery();

				while (rs.next()) {
					return rs.getInt(1);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}

			return 0;
		}
		
		public static void main(String[] args) {
			System.out.println(layDanhSachSanPhamTheoDanhMuc(1,0,2));
		}
	
	
}
