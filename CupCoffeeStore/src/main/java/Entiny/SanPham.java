package Entiny;

public class SanPham {

	private int ma;
	private String ten;
	private String hinh;
	private String xuatXu;
	private int gia;
	private String moTa;
	private int maDanhMuc;
	public int getMa() {
		return ma;
	}
	public void setMa(int ma) {
		this.ma = ma;
	}
	public String getTen() {
		return ten;
	}
	public void setTen(String ten) {
		this.ten = ten;
	}
	public String getHinh() {
		return hinh;
	}
	public void setHinh(String hinh) {
		this.hinh = hinh;
	}
	public String getXuatXu() {
		return xuatXu;
	}
	public void setXuatXu(String xuatXu) {
		this.xuatXu = xuatXu;
	}
	public int getGia() {
		return gia;
	}
	public void setGia(int gia) {
		this.gia = gia;
	}
	public String getMoTa() {
		return moTa;
	}
	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}
	public int getMaDanhMuc() {
		return maDanhMuc;
	}
	public void setMaDanhMuc(int maDanhMuc) {
		this.maDanhMuc = maDanhMuc;
	}
	public SanPham(int ma, String ten, String hinh, String xuatXu, int gia, String moTa, int maDanhMuc) {
		this.ma = ma;
		this.ten = ten;
		this.hinh = hinh;
		this.xuatXu = xuatXu;
		this.gia = gia;
		this.moTa = moTa;
		this.maDanhMuc = maDanhMuc;
	}
	public SanPham(String ten, String hinh, String xuatXu, int gia, String moTa, int maDanhMuc) {
		this.ten = ten;
		this.hinh = hinh;
		this.xuatXu = xuatXu;
		this.gia = gia;
		this.moTa = moTa;
		this.maDanhMuc = maDanhMuc;
	}
	
	
	
	
}
