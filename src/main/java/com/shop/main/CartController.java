package com.shop.main;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.service.IF_CartService;
import com.shop.vo.CartVO;
import com.shop.vo.MemberVO;

@Controller
public class CartController {
 @Inject
 private IF_CartService csrv;
 
 @RequestMapping(value = "cartadd", method = RequestMethod.POST)
 @ResponseBody
	public String cartadd(Locale locale, Model model, CartVO cart,HttpServletRequest request) throws Exception {
		// 로그인 체크
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		if(mvo == null) {
			return "5";
		}
		// 카트 등록
		System.err.println(mvo.getMnum()); //100011
		System.out.println(cart.getPnum()); //300011
		if(cart != null) {
			csrv.addCart(cart);
			return "1";
		}else {
			return "0";
		}
	}	
	
 @RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(Locale locale, Model model, @RequestParam("mnum") String mnum)throws Exception {
		
		try {
			model.addAttribute("cartInfo", csrv.getCart(mnum));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "bbs/cart";
	}
}
