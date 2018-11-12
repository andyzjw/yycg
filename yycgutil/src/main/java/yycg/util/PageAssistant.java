package yycg.util;

import java.util.List;

public class PageAssistant<T> {
	/** 总记录数 */
	private int count;
	/** 页面大小 */
	private int pageSize=10;
	/** 总页数 */
	private int totalPage;
	/** 当前页码 */
	private int currPage=1;
	/**记录的起始编号 */
	private int start;
	/**结束编号*/
	private int end;
	
	
	public int getEnd() {
		return end;
	}
	public void setEnd() {
		this.end = start+pageSize-1;
	}
	/**存放集合hiberate用*/
	private List<T> items;
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
		setTotalPage();
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
		setTotalPage();
		setStart();
		setEnd();
	}
	public int getTotalPage() {
		return totalPage;
	}
	/**改写totalPage*/
	public void setTotalPage() {
		totalPage = count/pageSize;
//		判断是否为整
		if(count%pageSize!=0) {
			totalPage++;
		}
		
	}
	public int getCurrPage() {
		return currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
		setStart();
	}
	public int getStart() {
		return start;
	}
	//改写start方法
	public void setStart() {
		//mysql使用
		/*start= (currPage-1)*pageSize;*/
		//oracle使用
		start= (currPage-1)*pageSize+1;
		setEnd();
	}
	
	public List<T> getItems() {
		return items;
	}
	public void setItems(List<T> items) {
		this.items = items;
	}
	@Override
	public String toString() {
		return "PageAssistant [count=" + count + ", pageSize=" + pageSize + ", totalPage=" + totalPage + ", currPage="
				+ currPage + ", start=" + start + "]";
	}
	
	
	
	
}
