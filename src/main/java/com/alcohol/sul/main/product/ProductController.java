package com.alcohol.sul.main.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alcohol.sul.basket.BasketDTO;
import com.alcohol.sul.main.util.PagerK;
import com.alcohol.sul.member.MemberDTO;

@Controller
@RequestMapping("product/*")
public class ProductController {

	@Autowired
	private ProductService productService;
	
	// 전체 List
	@GetMapping(value = "list")
	public String getList(PagerK pager, Model model) throws Exception {
		List<ProductDTO> ar = productService.getList(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pagerk", pager);		
		return "product/list";
	}
	
	//탁주 List
	@GetMapping(value = "list/takju")
	public String getListTakju(PagerK pager, Model model) throws Exception {
		List<ProductDTO> ar = productService.getListTakju(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);		
		return "product/list";
	}
	
	//약청주 List
	@GetMapping(value = "list/chungju")
	public String getListChungju(PagerK pager, Model model) throws Exception {
		List<ProductDTO> ar = productService.getListChungju(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);		
		return "product/list";
	}
	
	//과실주 List
	@GetMapping(value = "list/wine")
	public String getListWine(PagerK pager, Model model) throws Exception {
		List<ProductDTO> ar = productService.getListWine(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);		
		return "product/list";
	}
	
	//증류주 List
	@GetMapping(value = "list/soju")
	public String getListSoju(PagerK pager, Model model) throws Exception {
		List<ProductDTO> ar = productService.getListSoju(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);		
		return "product/list";
	}

	
	@RequestMapping(value = "detail")
	public ModelAndView getDetail(ProductDTO productDTO, ModelAndView mv) throws Exception{
		productDTO = productService.getDetail(productDTO);
		mv.addObject("dto", productDTO);
		mv.setViewName("product/detail");
		return mv;
	}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
	
	//form으로 이동
	@GetMapping(value = "add")
	public void setAdd() throws Exception{
		
	}
	
	//DB로 insert
	@PostMapping(value = "add")
	public String setAdd(ProductDTO productDTO, MultipartFile[] photos, HttpSession session) throws Exception {
		int result = productService.setAdd(productDTO, photos, session);
		return "redirect:./list";
	}
	
	
	//form으로 이동
	@GetMapping(value = "update")
	public void setUpdate(ProductDTO productDTO, Model model) throws Exception {
		productDTO = productService.getDetail(productDTO);
		model.addAttribute("dto", productDTO);
	}
	
//	//update수정
//	@PostMapping(value = "update")
//	public String setUpdate(ProductDTO productDTO) throws Exception {
//		int result = productService.setUpdate(productDTO);
//		//return "redirect:./list";
//		return "redirect:./detail?productNum=" + productDTO.getProductNum();
//	}
	
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String setDelete(ProductDTO productDTO) throws Exception {
		int result = productService.setDelete(productDTO);
		return "redirect:./list";
	}
	
	@GetMapping(value = "fileDelete")
	public String setFileDelete(ProductImgDTO productImgDTO, HttpSession session, Model model) throws Exception {
		int result = productService.setFileDelete(productImgDTO, session);
		model.addAttribute("result", result);
		return "commons/ajaxResult";
	}
	
	//DB
	@PostMapping(value = "update")
	public String setUpdate(ProductDTO productDTO, MultipartFile[] photos, HttpSession session) throws Exception {
		int result = productService.setUpdate(productDTO, photos, session);
		return "redirect:./detail?productNum=" + productDTO.getProductNum();
	}

	//장바구니
	
	@ResponseBody
	@RequestMapping(value = "/basketList/addBasket", method = RequestMethod.POST)
	public int addBasket(BasketDTO basketDTO, HttpSession session)throws Exception{
		
		int result = 0;
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		if(memberDTO!=null) {
			basketDTO.setId(memberDTO.getId());
			productService.addBasket(basketDTO);
			
			result = 1;
		
		}
		
		return result;
		
	}
	
	//장바구니 목록
	@RequestMapping(value = "/basketList", method = RequestMethod.GET)
	public void basketList(HttpSession session, Model model)throws Exception{
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		String id = memberDTO.getId();
		
		List<BasketDTO> list = productService.basketList(id);
		
		model.addAttribute("basketList", list);
	}
	
	//장바구니 삭제
	@ResponseBody
	@RequestMapping(value = "/basketList/deleteBasket", method = RequestMethod.POST)
	public int deleteBasket(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, BasketDTO basketDTO)throws Exception{
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		String id = memberDTO.getId();
		
		int result = 0;
		Long basketNum = 0L;
		
		if(memberDTO != null) {
			basketDTO.setId(id);
			
			for(String i : chArr) {
				basketNum = Long.parseLong(i);
				basketDTO.setBasketNum(basketNum);
				productService.deleteBasket(basketDTO);
			}
			result = 1;
		}
		
		return result;	
	}
	
	//장바구니 수량변경

	@ResponseBody
	@RequestMapping(value = "/basketList/updateBasket", method = RequestMethod.POST)
	public int updateBasket(@RequestBody BasketDTO basketDTO, HttpSession session) throws Exception {
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		String id = memberDTO.getId();
		Long productNum = basketDTO.getProductNum();
		int productCount = basketDTO.getProductCount();
		int result = 0;
		
		if(memberDTO != null) {
			basketDTO.setId(memberDTO.getId());
			basketDTO.setProductNum(basketDTO.getProductNum());
			basketDTO.setProductCount(basketDTO.getProductCount());
			productService.updateBasket(basketDTO);
			
			result = 1;
		}
		
		return result;	
	}
	
}
