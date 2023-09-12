package com.alcohol.sul;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.alcohol.sul.main.product.ProductDTO;

@Repository
public class HomeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.alcohol.sul.HomeDAO.";
	
	// best 상품(리뷰기준)
	public List<ProductDTO> getBestReview ()throws Exception{
		return sqlSession.selectList(NAMESPACE+"getBestReview");
	}
	
	public ProductDTO p46() throws Exception {
		return sqlSession.selectOne(NAMESPACE+"p46");
	}	
	public Long p46r() throws Exception {
		return sqlSession.selectOne(NAMESPACE+"p46r");
	}
	
	public ProductDTO p47() throws Exception {
		return sqlSession.selectOne(NAMESPACE+"p47");
	}	
	public Long p47r() throws Exception {
		return sqlSession.selectOne(NAMESPACE+"p47r");
	}
	
	public ProductDTO p48() throws Exception {
		return sqlSession.selectOne(NAMESPACE+"p48");
	}	
	public Long p48r() throws Exception {
		return sqlSession.selectOne(NAMESPACE+"p48r");
	}
	
	public ProductDTO p49() throws Exception {
		return sqlSession.selectOne(NAMESPACE+"p49");
	}	
	public Long p49r() throws Exception {
		return sqlSession.selectOne(NAMESPACE+"p49r");
	}
	
	public ProductDTO p45() throws Exception {
		return sqlSession.selectOne(NAMESPACE+"p45");
	}	
	public Long p45r() throws Exception {
		return sqlSession.selectOne(NAMESPACE+"p45r");
	}
	
	public ProductDTO p63() throws Exception {
		return sqlSession.selectOne(NAMESPACE+"p63");
	}	
	public Long p63r() throws Exception {
		return sqlSession.selectOne(NAMESPACE+"p63r");
	}
	
	public ProductDTO p66() throws Exception {
		return sqlSession.selectOne(NAMESPACE+"p66");
	}	
	public Long p66r() throws Exception {
		return sqlSession.selectOne(NAMESPACE+"p66r");
	}
	
	public ProductDTO p72() throws Exception {
		return sqlSession.selectOne(NAMESPACE+"p72");
	}	
	public Long p72r() throws Exception {
		return sqlSession.selectOne(NAMESPACE+"p72r");
	}
	
}
