package com.shop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shop.vo.CateVO;
import com.shop.vo.PageVO;
import com.shop.vo.ProductVO;

@Repository
public class ProductDAOImpl implements IF_ProductDAO{
	
	private static String mapperQuery= "com.shop.dao.IF_ProductDAO";
	 @Inject
	   private SqlSession sqlSession;

	@Override
	public void insertOne(ProductVO pvo) throws Exception {
		// TODO Auto-generated method stub
		 sqlSession.insert(mapperQuery+".insertOne",pvo);
	}

	@Override
	public List<CateVO> selectAll(CateVO cvo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".selectAll",cvo);
	}

	@Override
	public void insertAttach(String filename) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(mapperQuery+".photoAttach1",filename);
	}

	@Override
	public List<ProductVO> goodsGetList(PageVO pagevo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".goodsGetList",pagevo);
	}

	@Override
	public int countList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery+".countList");
	}

	@Override
	public ProductVO selectOne(String pnum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(mapperQuery+".selectOne",pnum);
	}

	@Override
	public List<String> selectAttach(String pnum) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(mapperQuery+".selectAttach",pnum);
	}

	@Override
	public void updateProduct(ProductVO pvo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(mapperQuery+".productUpdate",pvo);
	}

	@Override
	public void updateCnt(String pnum) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(mapperQuery+".cntplus",pnum);
	}

	@Override
	public void productDel(String pnum) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(mapperQuery+".productDel",pnum);
	}

	@Override
	public List<ProductVO> getGoodsInfo(ProductVO pvo) throws Exception {
		// TODO Auto-generated method stub
	      
	      return sqlSession.selectList(mapperQuery+ ".getGoodsInfo", pvo);
	   
	   }

	@Override
	public void photoDel(String pnum) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(mapperQuery+".photoDel",pnum);
	}
	}

	
