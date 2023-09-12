package com.alcohol.sul.main.product.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.alcohol.sul.main.product.ProductDTO;
import com.alcohol.sul.main.product.ProductImgDTO;
import com.alcohol.sul.main.product.ProductService;
import com.alcohol.sul.main.util.PagerK;
import com.alcohol.sul.member.MemberDTO;

@Controller
@RequestMapping("product/*")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private ProductService productService;
	
	
	@GetMapping("reviewList")
	public void getReviewList(ReviewDTO reviewDTO, PagerK pager, Model model)throws Exception{
		pager.setPerPage(2L);
		List<ReviewDTO> ar = reviewService.getReviewList(pager, reviewDTO, model);			
		model.addAttribute("reviewList", ar);
		model.addAttribute("pager", pager);
	}
	
	//form으로 이동
	@GetMapping(value = "reviewAdd")
	public void setReviewAdd(ReviewDTO reviewDTO, Model model) throws Exception{
		model.addAttribute("dto", reviewDTO);
	}
	
	//DB로 insert
	@PostMapping(value = "reviewAdd")
	public String setReviewAdd(ReviewDTO reviewDTO, MultipartFile[] photos, HttpSession session, Model model) throws Exception {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		reviewDTO.setId(memberDTO.getId());	
		reviewService.setReviewAdd(reviewDTO, photos, session);
		ProductDTO productDTO = new ProductDTO();
		productDTO.setProductNum(reviewDTO.getProductNum());
		Double result = reviewService.getReviewStarAvg(reviewDTO);
		productDTO.setScore(result);
		productService.setReviewStarUpdate(productDTO); 		
		
		return "redirect:./detail?productNum="+reviewDTO.getProductNum();
	}
	
	@GetMapping("myReviewList")
	public void getMyReviewList(ReviewDTO reviewDTO, PagerK pager, Model model,HttpSession session)throws Exception{
		pager.setPerPage(5L);
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		reviewDTO.setId(memberDTO.getId());
		List<ReviewDTO> ar = reviewService.getMyReviewList(pager, reviewDTO);
		model.addAttribute("myReviewList", ar);
		model.addAttribute("pager", pager);
	}
	
	//form으로 이동
	@GetMapping(value = "reviewUpdate")
	public void setReviewUpdate(ReviewDTO reviewDTO, Model model) throws Exception {
		reviewDTO = reviewService.getReviewDetail(reviewDTO);
		model.addAttribute("dto", reviewDTO);
	}
	
	//DB
	@PostMapping(value = "reviewUpdate")
	public String setUpdate(ReviewDTO reviewDTO, MultipartFile[] photos, HttpSession session) throws Exception {
		reviewService.setReviewUpdate(reviewDTO, photos, session);	
		ProductDTO productDTO = new ProductDTO();
//		System.out.println(reviewDTO.getProductNum());
		productDTO.setProductNum(reviewDTO.getProductNum());
		Double result = reviewService.getReviewStarAvg(reviewDTO);
		productDTO.setScore(result);
		productService.setReviewStarUpdate(productDTO); 
		return "redirect:../member/mypage";
	}
	
	@GetMapping(value = "reviewDelete")
	public String setReviewDelete(ReviewDTO reviewDTO) throws Exception {
		int result = reviewService.setReviewDelete(reviewDTO);
		ProductDTO productDTO = new ProductDTO();
		productDTO.setProductNum(reviewDTO.getProductNum()); 
		Double result2 = reviewService.getReviewStarAvg(reviewDTO); 
		if(result2 == null) {
			result2 = 0.0;
		}
		productDTO.setScore(result2);
		productService.setReviewStarUpdate(productDTO);		
		
		return "redirect:../member/mypage";
	}
	
	@GetMapping(value = "reviewFileDelete")
	public String setReviewFileDelete(ReviewFileDTO reviewFileDTO, HttpSession session, Model model) throws Exception {
		int result = reviewService.setReviewFileDelete(reviewFileDTO, session);
		model.addAttribute("result", result);
		return "commons/ajaxResult";
	}
}
