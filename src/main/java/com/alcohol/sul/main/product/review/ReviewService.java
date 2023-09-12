package com.alcohol.sul.main.product.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.alcohol.sul.main.product.ProductDTO;
import com.alcohol.sul.main.util.FileManagerK;
import com.alcohol.sul.main.util.PagerK;

@Service
public class ReviewService {

	@Autowired
	private ReviewDAO reviewDAO;
	
	@Autowired
	private FileManagerK fileManager;
	
	public List<ReviewDTO> getReviewList(PagerK pager, ReviewDTO reviewDTO, Model model)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		pager.makeRowNum();
		pager.makePageNum(reviewDAO.getReviewTotal(reviewDTO));		
						
		map.put("pager", pager);
		map.put("review", reviewDTO);
		
		return reviewDAO.getReviewList(map);
	}
	
	public int setReviewAdd(ReviewDTO reviewDTO, MultipartFile[] files, HttpSession session) throws Exception {
		// /resources/upload/product
		String path = "/resources/upload/product/review";
			
		int result = reviewDAO.setReviewAdd(reviewDTO);
		
		for(MultipartFile multipartFile: files) {
			if(multipartFile.isEmpty()) {
				continue;
			}
			String fileName = fileManager.fileSave(path, multipartFile, session);
			ReviewFileDTO reviewFileDTO = new ReviewFileDTO();
			reviewFileDTO.setOriginalName(multipartFile.getOriginalFilename());
			reviewFileDTO.setFileName(fileName);
			reviewFileDTO.setReviewNum(reviewDTO.getReviewNum());
			result = reviewDAO.setReviewFileAdd(reviewFileDTO);
		}
		
		return result; 
	}
	
	public int setReviewDelete(ReviewDTO reviewDTO) throws Exception {
		return reviewDAO.setReviewDelete(reviewDTO);
	}
	
	public int setReviewUpdate(ReviewDTO reviewDTO, MultipartFile[] files, HttpSession session) throws Exception {
		int result = reviewDAO.setReviewUpdate(reviewDTO);
		String path = "/resources/upload/product/review";
		for(MultipartFile multipartFile: files) {
			if(multipartFile.isEmpty()) {
				continue;
			}
			String fileName = fileManager.fileSave(path, multipartFile, session);
			ReviewFileDTO reviewFileDTO = new ReviewFileDTO();
			reviewFileDTO.setOriginalName(multipartFile.getOriginalFilename());
			reviewFileDTO.setFileName(fileName);
			reviewFileDTO.setReviewNum(reviewDTO.getReviewNum());
			result = reviewDAO.setReviewFileAdd(reviewFileDTO);
		}
		return result;
	}
	
	public int setReviewFileDelete(ReviewFileDTO reviewFileDTO, HttpSession session) throws Exception {
		//폴더파일 삭제
		reviewFileDTO = reviewDAO.getReviewFileDetail(reviewFileDTO);
		boolean flag = fileManager.reviewFileDelete(reviewFileDTO, "/resources/upload/product/review", session);
		
		if(flag) {
			//DB삭제
			return reviewDAO.setReviewFileDelete(reviewFileDTO);
		}
		
		return 0;
	}
	
	
	public ReviewDTO getReviewDetail(ReviewDTO reviewDTO) throws Exception {
		return reviewDAO.getReviewDetail(reviewDTO);
	}
	
	public Double getReviewStarAvg(ReviewDTO reviewDTO)throws Exception{
		return reviewDAO.getReviewStarAvg(reviewDTO);
	}
	
	
	public List<ReviewDTO> getMyReviewList(PagerK pager, ReviewDTO reviewDTO)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		pager.makeRowNum();
		pager.makePageNum(reviewDAO.getMyReviewTotal(reviewDTO));		
		
		map.put("pager", pager);
		map.put("review", reviewDTO);
		
		return reviewDAO.getMyReviewList(map);
	}
	

}
