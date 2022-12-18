package com.shop.dao;

import java.util.List;

import com.shop.vo.CartVO;

public interface IF_CartDAO {
	/* 카트 추가 */
	public void addCart(CartVO cart) throws Exception;
	
	/* 카트 삭제 */
	public int deleteCart(int cartid) throws Exception;
	
	/* 카트 수량 수정 */
	public int modifyCount(CartVO cart) throws Exception;
	
	/* 카트 목록 */
	public List<CartVO> getCart(String mnum) throws Exception;	
	
	/* 카트 정보 */
	public List<CartVO> getCartList(String mid) throws Exception;
}
