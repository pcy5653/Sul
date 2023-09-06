package com.alcohol.sul.main.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.alcohol.sul.basket.BasketDTO;
import com.alcohol.sul.main.util.PagerK;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.alcohol.sul.main.product.ProductDAO.";
	
	//전체 TOTAL
	public long getTotal(PagerK pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getTotal", pager);
	}
	
	//탁주 TOTAL
	public long getTotalTakju(PagerK pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getTotalTakju", pager);
	}
	
	//약청주 TOTAL
	public long getTotalChungju(PagerK pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getTotalChungju", pager);
	}
	
	//과실주 TOTAL
	public long getTotalWine(PagerK pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getTotalWine", pager);
	}
	
	//증류주 TOTAL
	public long getTotalSoju(PagerK pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getTotalSoju", pager);
	}
	
	
	//전체 LIST
	public List<ProductDTO> getList(PagerK pager) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getList", pager);
	}
	
	//탁주 LIST
	public List<ProductDTO> getListTakju(PagerK pager) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getListTakju", pager);
	}
	
	//약청주 LIST
	public List<ProductDTO> getListChungju(PagerK pager) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getListChungju", pager);
	}
	
	//과실주 LIST
	public List<ProductDTO> getListWine(PagerK pager) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getListWine", pager);
	}
	
	//증류주 LIST
	public List<ProductDTO> getListSoju(PagerK pager) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getListSoju", pager);
	}
	
	//DETAIL
	public ProductDTO getDetail(ProductDTO productDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getDetail", productDTO);
	}
	
	//ADD
	public int setAdd(ProductDTO productDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setAdd", productDTO);
	}
	
	//UPDATE
	public int setUpdate(ProductDTO productDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "setUpdate", productDTO);
	}
	
	//DELETE
	public int setDelete(ProductDTO productDTO) throws Exception {
		return sqlSession.delete(NAMESPACE + "setDelete", productDTO);
	}
	
	public int setFileAdd(ProductImgDTO productImgDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setFileAdd", productImgDTO);
	}
	
	public int setFileDelete(ProductImgDTO productImgDTO) throws Exception {
		return sqlSession.delete(NAMESPACE + "setFileDelete", productImgDTO);
	}
	
	public ProductImgDTO getFileDetail(ProductImgDTO productImgDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getFileDetail", productImgDTO);
	}

	public int setReviewStarUpdate(ProductDTO productDTO) throws Exception{
		return sqlSession.update(NAMESPACE + "setReviewStarUpdate", productDTO);
	}
	
	//장바구니
	public void addBasket(BasketDTO basketDTO)throws Exception{
		sqlSession.insert(NAMESPACE+"addBasket", basketDTO);
	}
	
	public BasketDTO getBasket(BasketDTO basketDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getBasket", basketDTO);
	}
	
	public List<BasketDTO> basketList(String id)throws Exception{
		return sqlSession.selectList(NAMESPACE+"basketList", id);
	}
	
	public void deleteBasket(BasketDTO basketDTO)throws Exception{
		sqlSession.delete(NAMESPACE+"deleteBasket", basketDTO);
	}
	
	public int updateBasket(BasketDTO basketDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"updateBasket", basketDTO);
	}

}
