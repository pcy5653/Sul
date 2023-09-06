package com.alcohol.sul.board.qna;

import java.util.List;

import com.alcohol.sul.board.BoardDTO;

public class QnaDTO extends BoardDTO{
	private QnaDTO qnaDTO;
	private Long sms;
	private Long ref;
	private Long step;
	private Long depth;
	// file
	private List<QnaFileDTO> fileDTOs;
	
	public QnaDTO getQnaDTO() {
		return qnaDTO;
	}
	public void setQnaDTO(QnaDTO qnaDTO) {
		this.qnaDTO = qnaDTO;
	}
	public List<QnaFileDTO> getFileDTOs() {
		return fileDTOs;
	}
	public void setFileDTOs(List<QnaFileDTO> fileDTOs) {
		this.fileDTOs = fileDTOs;
	}
	public Long getRef() {
		return ref;
	}
	public void setRef(Long ref) {
		this.ref = ref;
	}
	public Long getStep() {
		return step;
	}
	public void setStep(Long step) {
		this.step = step;
	}
	public Long getDepth() {
		return depth;
	}
	public void setDepth(Long depth) {
		this.depth = depth;
	}
	public Long getSms() {
		return sms;
	}
	public void setSms(Long sms) {
		this.sms = sms;
	}
}
