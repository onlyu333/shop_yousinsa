package com.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shop.dao.IF_ProductDAO;
import com.shop.vo.CateVO;
import com.shop.vo.PageVO;
import com.shop.vo.ProductVO;

@Service
public class ProductServiceImpl implements IF_ProductService {

	@Inject 
	private IF_ProductDAO pdao;
	
	@Override
	public void insertOne(ProductVO pvo) throws Exception {
		// TODO Auto-generated method stub
		pdao.insertOne(pvo);
		String[] fname =pvo.getFiles();
		if(fname != null) {
			for(int i=0; i< fname.length; i++) {
				if(fname[i]!=null)
				pdao.insertAttach(fname[i]);
			}
		}
	}

	@Override
	public List<CateVO> selectAll(CateVO cvo) throws Exception {
		// TODO Auto-generated method stub
		return pdao.selectAll(cvo);
	}

	@Override
	public List<ProductVO> goodsGetList(PageVO pagevo) throws Exception {
		// TODO Auto-generated method stub
		return pdao.goodsGetList(pagevo);
	}

	@Override
	public int countList() throws Exception {
		// TODO Auto-generated method stub
		return pdao.countList();
	}

	@Override
	public ProductVO selectOne(String pnum) throws Exception {
		// TODO Auto-generated method stub
		return pdao.selectOne(pnum);
	}

	@Override
	public List<String> selectAttach(String pnum) throws Exception {
		// TODO Auto-generated method stub
		return pdao.selectAttach(pnum);
	}

	@Override
	public void updateProduct(ProductVO pvo) throws Exception {
		// TODO Auto-generated method stub
		pdao.updateProduct(pvo);
	}

	@Override
	public void updateCnt(String pnum) throws Exception {
		// TODO Auto-generated method stub
		pdao.updateCnt(pnum);
	}

	@Override
	public void productDel(String pnum) throws Exception {
		// TODO Auto-generated method stub
		pdao.productDel(pnum);
	}

	/*
	 * @Override public ProductVO getGoodsInfo(String pnum)throws Exception { //
	 * TODO Auto-generated method stub ProductVO goodsInfo =
	 * pdao.getGoodsInfo(pnum); //게시글 내용을 VO에 담는 과정 List<String>
	 * temp=pdao.selectAttach(pnum); //리스트에 파일이름을 임시로 받음 String[] files=new
	 * String[temp.size()]; for(int i=0; i<temp.size();i++) {//리스트에 담긴 파일이름을 문자열배열
	 * 자료형으로 변환하기 위한 과정 files[i]=temp.get(i); //삽입 } goodsInfo.setFiles(files);
	 * //VO에 입력
	 * System.out.println(goodsInfo.getFiles().length+"---service단 파일길이테스트");
	 * 
	 * return goodsInfo; //VO리턴 }
	 */
	@Override
	public List<ProductVO> getGoodsInfo(ProductVO pvo) throws Exception {
		// TODO Auto-generated method stub
		   
	      return pdao.getGoodsInfo(pvo);
	   }

	@Override
	public void photoDel(String pnum) throws Exception {
		// TODO Auto-generated method stub
		pdao.photoDel(pnum);
	}

	


}
