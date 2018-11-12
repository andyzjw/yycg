package yycg.base.pojo.vo;

import yycg.base.pojo.po.Sysuser;

/**
 * 扩展类，用于提交信息、查询条件
 * @author administrator
 *
 */
public class SysuserCustom extends Sysuser {
		//单位名称
		private String sysmc;
		//用户类型
		private String groupname;
		
		public String getGroupname() {
			return groupname;
		}

		public void setGroupname(String groupname) {
			this.groupname = groupname;
		}

		public String getSysmc() {
			return sysmc;
		}

		public void setSysmc(String sysmc) {
			this.sysmc = sysmc;
		}
}
