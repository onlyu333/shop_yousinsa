package com.shop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shop.vo.CartVO;
@Repository
public class CartDAOImpl implements IF_CartDAO {
	 private static String mapperQuery= "com.shop.dao.IF_CartDAO";

	   @Inject
	  private SqlSession sqlSession;
	   
	@Override
	public void addCart(CartVO cart) throws Exception {
		sqlSession.insert(mapperQuery+".addCart",cart);
	}

	@Override
	public int deleteCart(int cartid) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyCount(CartVO cart) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CartVO> getCart(String mnum) throws Exception {
		// TODO Auto-generated method stub
		return  sqlSession.selectList(mapperQuery+ ".getCart", mnum);
	}

	@Override
	public List<CartVO> getCartList(String mid) throws Exception {
		// TODO Auto-generated method stub
		 return sqlSession.selectList(mapperQuery+ ".getCartList", mid);
	}

}
