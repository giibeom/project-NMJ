package qna.project.nmj.command;

import java.util.Map;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.ReviewDTO;
import qna.project.nmj.beans.dao.ReviewDAO;

public class CommunityUpdateReviewOkCommand implements Command {

	@Override
	public void execute(Model model) {
		int mb_uid = (Integer)model.getAttribute("mb_uid");	
		int review_uid = (Integer)model.getAttribute("review_uid");	
		int store_uid = (Integer)model.getAttribute("store_uid");
		String review_content = (String)model.getAttribute("review_content");
		review_content = review_content.replace("<p>", "").replace("</p>", "");		
		int review_rate = (Integer)model.getAttribute("review_rate");

		ReviewDAO dao = C.sqlSession.getMapper(ReviewDAO.class);
		
		int cnt = dao.updateReview(review_uid, review_content, store_uid, review_rate);
		dao.increaseReviewRate(review_rate, store_uid);
		
		model.addAttribute("result", cnt);
		model.addAttribute("mb_uid", mb_uid);
		model.addAttribute("review_uid", review_uid);
	}

}
