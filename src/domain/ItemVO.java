package domain;

public class ItemVO {
	private int itemId;
	private int itemTypeId;
	private String itemTypeName;
	private String itemName;
	private String itemDetail;
	private int itemPrice;
	private String itemImgPath;
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public int getItemTypeId() {
		return itemTypeId;
	}
	public void setItemTypeId(int itemTypeId) {
		this.itemTypeId = itemTypeId;
	}
	public String getItemTypeName() {
		return itemTypeName;
	}
	public void setItemTypeName(String itemTypeName) {
		this.itemTypeName = itemTypeName;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemDetail() {
		return itemDetail;
	}
	public void setItemDetail(String itemDetail) {
		this.itemDetail = itemDetail;
	}
	public int getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
	public String getItemImgPath() {
		return itemImgPath;
	}
	public void setItemImgPath(String itemImgPath) {
		this.itemImgPath = itemImgPath;
	}
}
