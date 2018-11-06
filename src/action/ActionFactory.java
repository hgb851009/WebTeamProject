package action;

public class ActionFactory {
	private static ActionFactory baf;
	private ActionFactory() {}
	public static ActionFactory getInstance() {
		if(baf==null)
			baf = new ActionFactory();
		return baf;
		
	}
	
	Action action = null;
	public Action action(String cmd) {
		if(cmd.equals("/shop.do"))
		{
			action=new ShopAction("views/shopmain.jsp");
		}	
		
		else if(cmd.equals("/purchase.do")) {
			action=new PurchaseAction("views/purchase.jsp");
		}
		
		else if(cmd.equals("/itempage.do")) {
			action=new PageAction("views/itempage.jsp");
		}
		else if(cmd.equals("/select.do")) {  //SchoolNotice---------------------------------------------
			action=new sn_ListAction("schoolNotice/sn_list.jsp");
		}else if(cmd.equals("/readCountUp.do")) {
			action=new sn_CountUpAction("view.do");
		}else if(cmd.equals("/view.do")) {
			action=new sn_ViewAction("schoolNotice/sn_view.jsp");
		}else if(cmd.equals("/search.do")) {
			action=new sn_SearchAction("schoolNotice/sn_list.jsp");
		}else if(cmd.equals("/newNotice.do")) {
			action=new sn_NewNoticeAction("select.do");
		}else if(cmd.equals("/modify.do")) {
			action=new sn_ModifyAction("schoolNotice/sn_modify.jsp");
		}else if(cmd.equals("/update.do")) {
			action=new sn_UpdateAction("view.do");
		}else if(cmd.equals("/delNotice.do")) {
			action=new sn_DelNoticeAction("select.do");
		}else if(cmd.equals("/newReply.do")) {
			action=new sn_NewReplyAction("view.do");
		}else if(cmd.equals("/delReply.do")) {
			action=new sn_DelReplyAction("view.do");
		}else if(cmd.equals("/workInfo.do")) { //WorkInfo---------------------------------------------
			action=new wi_ListAction("workInfo/wi_list.jsp");
		}else if(cmd.equals("/wi_readCountUp.do")) {
			action=new wi_CountUpAction("workInfoView.do");
		}else if(cmd.equals("/workInfoView.do")) {
			action=new wi_ViewAction("workInfo/wi_view.jsp");
		}else if(cmd.equals("/workInfoSearch.do")) {
			action=new wi_SearchAction("workInfo/wi_list.jsp");
		}else if(cmd.equals("/newWorkInfo.do")) {
			action=new wi_NewWorkInfoAction("workInfo.do");
		}else if(cmd.equals("/modifyWorkInfo.do")) {
			action=new wi_ModifyAction("workInfo/wi_modify.jsp");
		}else if(cmd.equals("/delWorkInfo.do")) {
			action=new wi_DelWorkInfoAction("workInfo.do");
		}else if(cmd.equals("/InfoUpdate.do")) {
			action=new wi_UpdateAction("workInfo.do");
		}else if(cmd.equals("/cNp.do")) { //counsellingNprint-----------------------------------------
			action=new cp_ListAction("counsellingNprint/cp_list.jsp");
		}else if(cmd.equals("/cNpR.do")) {
			action=new cp_ListAction("counsellingNprint/cp_list_R.jsp");
		}else if(cmd.equals("/cNew.do")) {
			action=new cp_NewCounsellingAction("cNp.do");
		}else if(cmd.equals("/cDel.do")) {
			action=new cp_DelCounsellingAction("cNp.do");
		}else if(cmd.equals("/cDel_R.do")) {
			action=new cp_DelCounsellingAction("cNpR.do");
		}else if(cmd.equals("/pNew.do")) {
			action=new cp_NewPrintAction("cNpR.do");
		}else if(cmd.equals("/pDel.do")) {
			action=new cp_DelPrintAction("cNpR.do");
		}else if(cmd.equals("/cAnswer.do")) {
			action=new cp_NewAnswerAction("counsellingNprint/cp_list_Answer.jsp");
		}else if(cmd.equals("/answer.do")) {
			action=new cp_NewAnswerUpAction("cNpR.do");
		}else if(cmd.equals("/cEnd.do")) {
			action=new cp_EndAnswerAction("cNpR.do");
		}else if(cmd.equals("/board.do")) {	//board-----------------------------------------
			action=new b_ListAction("classBoard/b_list.jsp");
		}else if(cmd.equals("/boardKindList.do")) {
			action=new b_SelectListAction("classBoard/b_selectList.jsp");
		}else if(cmd.equals("/boardKindList2.do")) {
			action=new b_SelectListAction("classBoard/b_selectList2.jsp");
		}else if(cmd.equals("/boardSearch.do")) {
			action=new b_SearchAction("");
		}else if(cmd.equals("/b_readCountUp.do")) {
			action=new b_CountUpAction("boardView.do");
		}else if(cmd.equals("/boardView.do")) {
			action=new b_ViewAction("classBoard/b_view.jsp");
		}else if(cmd.equals("/boardNewR.do")) {
			action=new b_NewReplyAction("boardView.do");
		}else if(cmd.equals("/boardDelR.do")) {
			action=new b_DelReplyAction("boardView.do");
		}else if(cmd.equals("/newBoard.do")) {
			action=new b_NewBoardAction("board.do");
		}else if(cmd.equals("/modifyBoard.do")) {
			action=new b_ModifyAction("classBoard/b_modify.jsp");
		}else if(cmd.equals("/updateBoard.do")) {
			action=new b_UpdateAction("boardView.do");
		}else if(cmd.equals("/delBoard.do")) {
			action=new b_DelBoardAction("board.do");//---------------------------------------
		}
		return action;
	}
}
