package Entiny;

import java.util.ArrayList;

public class Order {
	private int ma;
	private SanPham sanPham;
	private int soLuong;
	private int gia;
	public int getMa() {
		return ma;
	}
	public void setMa(int ma) {
		this.ma = ma;
	}
	public SanPham getSanPham() {
		return sanPham;
	}
	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public int getGia() {
		return gia;
	}
	public void setGia(int gia) {
		this.gia = gia;
	}
	public Order(int ma, SanPham sanPham, int soLuong, int gia) {
		this.ma = ma;
		this.sanPham = sanPham;
		this.soLuong = soLuong;
		this.gia = gia;
	}
	
	
	
	
}
