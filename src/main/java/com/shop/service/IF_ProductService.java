package com.shop.service;

import java.util.List;

import com.shop.vo.CateVO;
import com.shop.vo.PageVO;
import com.shop.vo.ProductVO;

public interface IF_ProductService {
	public void insertOne(ProductVO pvo)throws Exception;
	public List<CateVO>selectAll(CateVO cvo) throws Exception;
	public List<ProductVO>goodsGetList(PageVO pagevo) throws Exception;
	 public int countList() throws Exception;
	 public ProductVO selectOne(String pnum)throws Exception;
	 public List<String> selectAttach(String pnum) throws Exception;
	 public void updateProduct(ProductVO pvo) throws Exception; 
	 public void updateCnt(String pnum) throws Exception;
	 public void photoDel(String pnum) throws Exception;
	 public void productDel(String pnum) throws Exception;
	public List<ProductVO> getGoodsInfo(ProductVO pvo) throws Exception;;
}
