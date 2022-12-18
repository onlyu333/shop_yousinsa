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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.service.IF_MemberService;
import com.shop.service.MemberServiceImpl;
import com.shop.vo.MemberVO;

@Controller
public class UserLogin {
	@Inject
	private IF_MemberService msrv;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) throws Exception {

		return "bbs/login";
	}
	  @RequestMapping(value="/loginAction", method=RequestMethod.POST)
	    public String loginPOST(HttpServletRequest request, MemberVO mvo, RedirectAttributes rttr) throws Exception{
		  HttpSession session = request.getSession();
		  MemberVO lvo = msrv.memberLogin(mvo);
	        System.out.println("login 메서드 진입");
	        System.out.println("전달된 데이터 : " + mvo.getAdminCK());
	        if(lvo == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우
	            
	            int result = 0;
	            rttr.addFlashAttribute("result", result);
	            return "redirect:/login";
	            
	        }
	        
	        session.setAttribute("member", lvo);// 일치하는 아이디, 비밀번호 경우 (로그인 성공)
		/*
		 * session.setAttribute("id",mvo.getMid());//세션처리// 일치하는 아이디, 비밀번호 경우 (로그인 성공)
		 * session.setAttribute("grade",mvo.getGrade());
		 * session.setAttribute("adminCK",mvo.getAdminCK());
		 */
	        return "redirect:/";
	 
	    }
	  @RequestMapping(value = "/logout", method = RequestMethod.GET)
		public String logout(HttpSession session) throws Exception {
			session.invalidate();//세션무력화
			return "redirect:/";
		}
	  @RequestMapping(value = "/account", method = RequestMethod.GET)

	   public String memberupdate(Locale locale, Model model, HttpSession session) throws Exception {
	      
	      return "bbs/account";
	   }

	   @RequestMapping(value = "/accountmodiAction", method = RequestMethod.POST)
	   public String memmodi(Locale locale, Model model, MemberVO mvo) throws Exception {

	      System.out.println(mvo.getMnum());
	      System.out.println(mvo.getMname());
	      System.out.println(mvo.getMid());
	      System.out.println(mvo.getMpw());
	      System.out.println(mvo.getEmail());
	      System.out.println(mvo.getMaddr());
	      System.out.println(mvo.getGrade());
	      msrv.memberUpdate(mvo);
	      return "redirect:/account?mid=" + mvo.getMid();

	   }
	   @RequestMapping(value = "/memDel", method = RequestMethod.GET)
	   public String memDel(Locale locale, Model model, @RequestParam("mid") String mid,HttpSession session) throws Exception {
	          
	      System.out.println(mid);
	      msrv.memDel(mid);
	      session.invalidate();// 세션무력화
	      return "redirect:/";
	   
	   }
	  
}
