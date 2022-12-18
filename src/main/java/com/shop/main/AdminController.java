package com.shop.main;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.shop.service.IF_ProductService;
import com.shop.util.FileDataUtil;
import com.shop.vo.CateVO;
import com.shop.vo.PageVO;
import com.shop.vo.ProductVO;

@Controller
public class AdminController {

	@Inject
	private IF_ProductService psrv;

	@Inject
	private FileDataUtil FileDataUtil;

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	/* 관리자 메인 페이지 이동 */
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminMainGET() throws Exception {

		logger.info("관리자 페이지 이동");
		return "bbs/admin";
	}

	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String admin() throws Exception {

		return "bbs/product";
	}

	@RequestMapping(value = "/pGetAction", method = RequestMethod.POST)
	public String productGet(Locale locale, Model model, ProductVO pvo, MultipartFile[] file) throws Exception {

		System.out.println(file.length);
		String[] fileNames = FileDataUtil.fileUpload(file);
		System.out.println(fileNames[0] + "/" + fileNames[1]);
		pvo.setFiles(fileNames);

		psrv.insertOne(pvo);
		return "bbs/product";
	}

	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public String productList(Locale locale, Model model, @ModelAttribute("pagevo") PageVO pagevo, ProductVO pvo)
			throws Exception {
		int totalpageCnt = psrv.countList(); 
		if (pagevo.getPage() == null) {
			pagevo.setPage(1);
		}
		pagevo.setTotalCount(totalpageCnt);
		System.out.println("페이지" + pagevo.getStartNo());
		List<ProductVO> list = psrv.goodsGetList(pagevo);
		model.addAttribute("list", list);
		model.addAttribute("pagevo", pagevo);
		return "bbs/productList";
	}

	@RequestMapping(value = "/ProductView", method = RequestMethod.GET)
	public String ProductView(Locale locale, Model model, @RequestParam("pnum") String pnum) throws Exception {

		ProductVO tempvo = psrv.selectOne(pnum);
		System.out.println(pnum);
		List<String> attachList = psrv.selectAttach(pnum);
		model.addAttribute("pnum", tempvo);
		model.addAttribute("attachList", attachList);
		return "bbs/productView";
	}
	@RequestMapping(value = "/productMod", method = RequestMethod.GET)
	public String bbsMod(Locale locale, Model model, @RequestParam("pnum") String pnum) throws Exception {
          ProductVO tempvo =psrv.selectOne(pnum);
           model.addAttribute("pvo",tempvo);
		return "bbs/productMod";
	}

	@RequestMapping(value = "/modipyAction", method = RequestMethod.POST)
	public String bbsModAction(Locale locale, Model model, ProductVO pvo) throws Exception {
		System.out.println(pvo.getPnum());
		System.out.println(pvo.getCate1());
		System.out.println(pvo.getCate2());
		System.out.println(pvo.getPname());
		System.out.println(pvo.getBrand());
		System.out.println(pvo.getPrice());
		System.out.println(pvo.getStock());
		System.out.println(pvo.getPinformation());
		System.out.println(pvo.getPexplain());
		psrv.updateProduct(pvo);
		return "redirect:/productMod?pnum=" +pvo.getPnum();

	}
	@RequestMapping(value = "/productDel", method = RequestMethod.GET)
	public String productDel(Locale locale, Model model, @RequestParam("pnum") String pnum) throws Exception {
          
		System.out.println(pnum);
		psrv.photoDel(pnum);
		psrv.productDel(pnum);
		return "redirect:/productList";
	}
	@RequestMapping(value = "/detailview", method = RequestMethod.GET)
	   public String detailview(Locale locale, Model model, @RequestParam("pnum") String pnum) throws Exception {

	      // psrv.updateCnt(vno);
	      ProductVO tempvo = psrv.selectOne(pnum);
	      System.out.println(pnum);
	      List<String> attachList2 = psrv.selectAttach(pnum);
	      model.addAttribute("pnum", tempvo);
	      model.addAttribute("attachList", attachList2);
	      return "bbs/detailview";
	   }
}
