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
		return action;
	}
}
