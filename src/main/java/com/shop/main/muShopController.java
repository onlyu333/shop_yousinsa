package com.shop.main;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.service.IF_MemberService;
import com.shop.service.IF_ProductService;
import com.shop.vo.MemberVO;



@Controller
public class muShopController {
	@Inject
	private IF_MemberService msrv;
	@Inject
	private IF_ProductService psrv;
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm(Locale locale, Model model) {
		
		
		return "bbs/joinForm";
	}
	@RequestMapping(value = "/joinAction", method = RequestMethod.POST)
	public String joinAction(Locale locale, Model model,MemberVO mvo) throws Exception {
		System.out.println("asdafasaf");
        msrv.insertOne(mvo);
        System.out.println("asdafasaf");
		return "redirect:/";
	}
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChk(Locale locale, Model model,String mid) throws Exception {
     System.out.println(mid);
		
		int result = msrv.idCheck(mid);
		if(result != 0) {
			
			return "fail";	// 중복 아이디가 존재
			
		} else {
			
			return "success";	// 중복 아이디 x
			
		}
	}
	/* 상품 상세 */
	
	/*
	 * @RequestMapping(value = "/goodsDetail", method = RequestMethod.POST) public
	 * String goodsDetailGET(@PathVariable("pnum")String pnum, Model model) throws
	 * Exception {
	 * 
	 * //logger.info("goodsDetailGET()..........");
	 * 
	 * model.addAttribute("goodsInfo", psrv.getGoodsInfo(pnum));
	 * 
	 * return "bbs/goodsDetail"; }
	 */
	
}
