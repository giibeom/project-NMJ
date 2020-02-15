package qna.project.nmj.command;

import org.springframework.ui.Model;

import qna.project.nmj.beans.C;
import qna.project.nmj.beans.CusMyPageDTO;
import qna.project.nmj.beans.dao.CustomerDAO;

public class CusShowReviewCommand implements Command {

	@Override
	public void execute(Model model) {
		int mb_uid = (Integer)model.getAttribute("mb_uid");
		CustomerDAO dao = C.sqlSession.getMapper(CustomerDAO.class);
		CusMyPageDTO myPageReview = dao.selectMyReviewByUid(mb_uid);
		model.addAttribute("myPageReview", myPageReview);
	}

}
