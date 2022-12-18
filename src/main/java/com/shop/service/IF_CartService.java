package com.shop.service;

import java.util.List;

import com.shop.vo.CartVO;

public interface IF_CartService {
	public void addCart(CartVO cart) throws Exception;
	public List<CartVO> getCart(String mnum) throws Exception;	
	public List<CartVO> getCartList(String mid)throws Exception;
}
