package com.alcohol.sul.main.product.review;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ReviewDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.alcohol.sul.main.product.review.ReviewDAO.";
	
	//total
	public long getReviewTotal(ReviewDTO reviewDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getReviewTotal", reviewDTO);
	}
	
	//별점 AVG
	public Double getReviewStarAvg(ReviewDTO reviewDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getReviewStarAvg", reviewDTO);
	}
	
	//list
	public List<ReviewDTO> getReviewList(Map<String, Object> map)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getReviewList", map);
	}
	
	//add
	public int setReviewAdd(ReviewDTO reviewDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setReviewAdd", reviewDTO);
	}
	
	//UPDATE
		public int setReviewUpdate(ReviewDTO reviewDTO) throws Exception {
			return sqlSession.update(NAMESPACE + "setReviewUpdate", reviewDTO);
		}
		
	//DETAIL
	public ReviewDTO getReviewDetail(ReviewDTO reviewDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getReviewDetail", reviewDTO);
	}
		
	//DELETE
	public int setReviewDelete(ReviewDTO reviewDTO) throws Exception {
		return sqlSession.delete(NAMESPACE + "setReviewDelete", reviewDTO);
	}
	
	public int setReviewFileAdd(ReviewFileDTO reviewFileDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setReviewFileAdd", reviewFileDTO);
	}
	
	public int setReviewFileDelete(ReviewFileDTO reviewFileDTO) throws Exception {
		return sqlSession.delete(NAMESPACE + "setReviewFileDelete", reviewFileDTO);
	}
	
	public ReviewFileDTO getReviewFileDetail(ReviewFileDTO reviewFileDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getReviewFileDetail", reviewFileDTO);
	}
	
	//작성리뷰
	public List<ReviewDTO> getMyReviewList(Map<String, Object> map) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getMyReviewList", map);
	}
	
	//작성리뷰토탈
	public long getMyReviewTotal(ReviewDTO reviewDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getMyReviewTotal", reviewDTO);
	}
	

}
