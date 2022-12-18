package com.shop.vo;

public class CartVO {
	private int cartid;
	private String mnum;
	private int pnum;
	private int pcount;
	// book
	private String pname;
	private int price;
	// private double bookDiscount;
	// 추가
	private int salePrice;
	private int totalPrice;

	public int getCartid() {
		return cartid;
	}

	public void setCartid(int cartid) {
		this.cartid = cartid;
	}

	public String getMnum() {
		return mnum;
	}

	public void setMnum(String mnum) {
		this.mnum = mnum;
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	public int getPcount() {
		return pcount;
	}

	public void setPcount(int pcount) {
		this.pcount = pcount;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public void initSaleTotal() {
		
		this.totalPrice = this.salePrice*this.pcount;
	}
	@Override
	public String toString() {
		return "CartVO [cartid=" + cartid + ", mnum=" + mnum + ", pnum=" + pnum + ", pcount=" + pcount + ", pname="
				+ pname + ", price=" + price + ", salePrice=" + salePrice + ", totalPrice=" + totalPrice + "]";

	}
}
