package com.alcohol.sul.main.product.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.alcohol.sul.main.product.ProductDTO;
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
		
		return "redirect:./list";
	}
	
	@GetMapping("myReviewList")
	public void getMyReviewList(ReviewDTO reviewDTO, PagerK pager, Model model,HttpSession session)throws Exception{
		pager.setPerPage(2L);
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		reviewDTO.setId(memberDTO.getId());
		List<ReviewDTO> ar = reviewService.getMyReviewList(pager, reviewDTO);			
		model.addAttribute("myReviewList", ar);
	}
}
