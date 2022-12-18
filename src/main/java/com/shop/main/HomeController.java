
package com.shop.main;

import java.text.DateFormat;
import java.util.Date;
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

import com.shop.service.IF_ProductService;
import com.shop.util.FileDataUtil;
import com.shop.vo.PageVO;
import com.shop.vo.ProductVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

   @Inject
   private IF_ProductService psrv;

   @Inject
   private FileDataUtil FileDataUtil;

   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

   /**
    * Simply selects the home view to render by returning its name.
    */
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String home(Locale locale, Model model, @ModelAttribute("pagevo") PageVO pagevo, ProductVO pvo)
         throws Exception {

      logger.info("Welcome home! The client locale is {}.", locale);

      Date date = new Date();
      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
      String formattedDate = dateFormat.format(date);
      
      if (pagevo.getPage() == null) {
         pagevo.setPage(1);
      }
      int totalpageCnt = psrv.countList();
      pagevo.setTotalCount(totalpageCnt);
      
      List<ProductVO> list = psrv.getGoodsInfo(pvo);
      
      //System.out.println(list.get(0).getPname());
      model.addAllAttributes(psrv.getGoodsInfo(pvo));
      model.addAttribute("imglist", list);
      model.addAttribute("pagevo", pagevo);
      System.out.println("깃바보");
      return "bbs/main";
   }

}