package cn.util;

public class PageBean {
	public Integer pageNo=1; //当前页码
	public Integer pageSize=5; //每页显示条数
	public Integer totalCount; //总记录数
	public Integer totalPage; //总页数
	public Integer prePage;  //上一页页码
	public Integer nextPage; //下一页页码

	public PageBean() {
	}
	public PageBean(Integer pageNo, Integer pageSize) {
		super();
		this.pageNo = pageNo;
		this.pageSize = pageSize;
	}
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	public Integer getPrePage() {
		if(pageNo<=1){
			prePage=1;
		}else{
			prePage=pageNo-1;
		}
		return prePage;
	}
	public void setPrePage(Integer prePage) {
		this.prePage = prePage;
	}
	public Integer getNextPage() {
		if(pageNo>=getTotalPage()){
			nextPage=totalPage;
		}else{
			nextPage=pageNo+1;
		}
		return nextPage;
	}
	public void setNextPage(Integer nextPage) {
		this.nextPage = nextPage;
	}
	public Integer getTotalPage() {
		totalPage=(getTotalCount()+pageSize-1)/pageSize;
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	
}
