package yycg.base.pojo.vo;

import yycg.util.PageAssistant;

/**
 * 包装类，用于页面向action传递参数，将数据传到mybatis 
 * @author administrator
 *
 */
public class SysuserQueryVo {
	
		//用户的查询条件
		private SysuserCustom sysuserCustom;
		
		//页面分页信息
		private PageAssistant<SysuserCustom>  pa;
		
		public PageAssistant<SysuserCustom> getPa() {
			return pa;
		}

		public void setPa(PageAssistant<SysuserCustom> pa) {
			this.pa = pa;
		}

		public SysuserCustom getSysuserCustom() {
			return sysuserCustom;
		}

		public void setSysuserCustom(SysuserCustom sysuserCustom) {
			this.sysuserCustom = sysuserCustom;
		}
		
}
