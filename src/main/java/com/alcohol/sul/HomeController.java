package com.alcohol.sul;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alcohol.sul.main.product.ProductDTO;
import com.alcohol.sul.main.product.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private HomeService homeService;
	
	@Autowired
	private ProductService productService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, ProductDTO productDTO) throws Exception{
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		productDTO = homeService.p46();		
		Long p46 = homeService.p46r();	
		model.addAttribute("p46", productDTO);
		model.addAttribute("p46r", p46);
		
		productDTO = homeService.p48();
		Long p48 = homeService.p48r();
		model.addAttribute("p48", productDTO);		
		model.addAttribute("p48r", p48);
		
		productDTO = homeService.p47();
		Long p47 = homeService.p47r();
		model.addAttribute("p47", productDTO);		
		model.addAttribute("p47r", p47);
		
		productDTO = homeService.p49();
		Long p49 = homeService.p49r();
		model.addAttribute("p49", productDTO);		
		model.addAttribute("p49r", p49);
		
		productDTO = homeService.p45();
		Long p45 = homeService.p45r();
		model.addAttribute("p45", productDTO);		
		model.addAttribute("p45r", p45);
		
		productDTO = homeService.p63();
		Long p63 = homeService.p63r();
		model.addAttribute("p63", productDTO);		
		model.addAttribute("p63r", p63);
		
		productDTO = homeService.p66();
		Long p66 = homeService.p66r();
		model.addAttribute("p66", productDTO);		
		model.addAttribute("p66r", p66);
		
		productDTO = homeService.p72();
		Long p72 = homeService.p72r();
		model.addAttribute("p72", productDTO);		
		model.addAttribute("p72r", p72);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/temp_home", method = RequestMethod.GET)
	public String temp_home() {		
		return "temp_home";
	}
	
	
	@GetMapping("/bestReview")
	public String getBestReview(Model model)throws Exception{
		List<ProductDTO> ar = homeService.getBestReview();
		model.addAttribute("list", ar);

//		System.out.println(ar.size());
		
		return "product/list";
	}
}