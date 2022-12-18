package com.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shop.dao.IF_CartDAO;
import com.shop.vo.CartVO;

@Service
public class CartServiceImpl implements IF_CartService {
	@Inject
	private IF_CartDAO cdao;

	@Override
	public void addCart(CartVO cart) throws Exception {
		// TODO Auto-generated method stub
		// 장바구니 데이터 체크
		cdao.addCart(cart);
	}
	@Override
	public List<CartVO> getCartList(String mid) throws Exception {
		// TODO Auto-generated method stub
        List<CartVO> cart = cdao.getCart(mid);
		
		for(CartVO dto : cart) {
			dto.initSaleTotal();
		}
		
		return cart;
	}
	@Override
	public List<CartVO> getCart(String mnum) throws Exception {
		// TODO Auto-generated method stub
		return cdao.getCart(mnum);
	}

}
