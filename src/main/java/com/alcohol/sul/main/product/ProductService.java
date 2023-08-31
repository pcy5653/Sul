package com.alcohol.sul.main.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.alcohol.sul.main.util.FileManagerK;
import com.alcohol.sul.main.util.PagerK;

@Service
public class ProductService {

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private FileManagerK fileManager;
	
	//전체 List
	public List<ProductDTO> getList(PagerK pager) throws Exception {
		pager.makeRowNum();
		Long total = productDAO.getTotal(pager);
		pager.makePageNum(total);
		return productDAO.getList(pager);
	}
	
	//탁주 List
	public List<ProductDTO> getListTakju(PagerK pager) throws Exception {

		pager.makeRowNum();
		Long total = productDAO.getTotalTakju(pager);
		pager.makePageNum(total);

		return productDAO.getListTakju(pager);
	}
	
	//약청주 List
	public List<ProductDTO> getListChungju(PagerK pager) throws Exception {

		pager.makeRowNum();
		Long total = productDAO.getTotalChungju(pager);
		pager.makePageNum(total);

		return productDAO.getListChungju(pager);
	}
	
	//과실주 List
	public List<ProductDTO> getListWine(PagerK pager) throws Exception {

		pager.makeRowNum();
		Long total = productDAO.getTotalWine(pager);
		pager.makePageNum(total);

		return productDAO.getListWine(pager);
	}
	
	//증류주 List
	public List<ProductDTO> getListSoju(PagerK pager) throws Exception {

		pager.makeRowNum();
		Long total = productDAO.getTotalSoju(pager);
		pager.makePageNum(total);

		return productDAO.getListSoju(pager);
	}
	
	public ProductDTO getDetail(ProductDTO productDTO) throws Exception {
		return productDAO.getDetail(productDTO);
	}
	
	
	
	public int setAdd(ProductDTO productDTO, MultipartFile[] files, HttpSession session) throws Exception {
		// /resources/upload/product
		String path = "/resources/upload/product/";
			
		int result = productDAO.setAdd(productDTO);
		
		for(MultipartFile multipartFile: files) {
			if(multipartFile.isEmpty()) {
				continue;
			}
			String fileName = fileManager.fileSave(path, multipartFile, session);
			ProductImgDTO productImgDTO = new ProductImgDTO();
			productImgDTO.setOriginalName(multipartFile.getOriginalFilename());
			productImgDTO.setImgName(fileName);
			productImgDTO.setProductNum(productDTO.getProductNum());
			result = productDAO.setFileAdd(productImgDTO);
		}
		
		return result; 
	}
	
	
	public int setDelete(ProductDTO productDTO) throws Exception {
		return productDAO.setDelete(productDTO);
	}
	
	public int setUpdate(ProductDTO productDTO) throws Exception {
		return productDAO.setUpdate(productDTO);
	}
	
	public int setFileDelete(ProductImgDTO productImgDTO, HttpSession session) throws Exception {
		//폴더파일 삭제
		productImgDTO = productDAO.getFileDetail(productImgDTO);
		boolean flag = fileManager.fileDelete(productImgDTO, "/resources/upload/product/", session);
		
		if(flag) {
			//DB삭제
			return productDAO.setFileDelete(productImgDTO);
		}
		
		return 0;
	}
	
	public int setUpdate(ProductDTO productDTO, MultipartFile[] files, HttpSession session) throws Exception {
		int result = productDAO.setUpdate(productDTO);
		String path = "/resources/upload/product/";
		for(MultipartFile multipartFile: files) {
			if(multipartFile.isEmpty()) {
				continue;
			}
			String fileName = fileManager.fileSave(path, multipartFile, session);
			ProductImgDTO productImgDTO = new ProductImgDTO();
			productImgDTO.setOriginalName(multipartFile.getOriginalFilename());
			productImgDTO.setImgName(fileName);
			productImgDTO.setProductNum(productDTO.getProductNum());
			result = productDAO.setFileAdd(productImgDTO);
		}
		return result;
	}
		

	
	public int setReviewStarUpdate(ProductDTO productDTO) throws Exception{
		return productDAO.setReviewStarUpdate(productDTO);
	}
	
}
