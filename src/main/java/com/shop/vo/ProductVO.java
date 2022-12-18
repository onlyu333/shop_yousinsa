package com.shop.vo;

public class ProductVO {
   private int pnum;
   private String cate1;
   private String cate2;
   private String pname;
   private String brand;
   private int price;
   private int stock;
   private String pDate;
   private String pinformation;
   private String pexplain;
   private String[] files;
   private String fnum;
   private String filename;
   public String getFnum() {
      return fnum;
   }
   public void setFnum(String fnum) {
      this.fnum = fnum;
   }
   public String getFilename() {
      return filename;
   }
   public void setFilename(String filename) {
      this.filename = filename;
   }
   
   
   public String[] getFiles() {
      return files;
   }
   public void setFiles(String[] files) {
      this.files = files;
   }
   public String getPinformation() {
      return pinformation;
   }
   public void setPinformation(String pinformation) {
      this.pinformation = pinformation;
   }
   public String getPexplain() {
      return pexplain;
   }
   public void setPexplain(String pexplain) {
      this.pexplain = pexplain;
   }
   public int getPnum() {
      return pnum;
   }
   public void setPnum(int pnum) {
      this.pnum = pnum;
   }
   public String getPname() {
      return pname;
   }
   public void setPname(String pname) {
      this.pname = pname;
   }
   public String getBrand() {
      return brand;
   }
   public void setBrand(String brand) {
      this.brand = brand;
   }
   public int getPrice() {
      return price;
   }
   public void setPrice(int price) {
      this.price = price;
   }
   public int getStock() {
      return stock;
   }
   public void setStock(int stock) {
      this.stock = stock;
   }
   public String getpDate() {
      return pDate;
   }
   public void setpDate(String pDate) {
      this.pDate = pDate;
   }
   public String getCate1() {
      return cate1;
   }
   public void setCate1(String cate1) {
      this.cate1 = cate1;
   }
   public String getCate2() {
      return cate2;
   }
   public void setCate2(String cate2) {
      this.cate2 = cate2;
   }
}