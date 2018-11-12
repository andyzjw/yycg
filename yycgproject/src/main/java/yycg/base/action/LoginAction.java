package yycg.base.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import yycg.base.pojo.vo.ActiveUser;
import yycg.base.process.context.Config;
import yycg.base.process.result.ResultUtil;
import yycg.base.process.result.SubmitResultInfo;
import yycg.base.service.UserService;

@Controller
public class LoginAction  {
	@Resource
	private UserService userService;
	
	/**跳到登录页面*/
	@RequestMapping("/login")
	public String login(Model model) throws Exception{
		
		return "/base/login";//mvc中配置了前后缀
	}
	
	/** 用户提交页面 */
	@RequestMapping("/loginsubmit")
	public @ResponseBody SubmitResultInfo loginsubmit(HttpSession session,String userId,String pwd,String volidateCode)
			throws Exception{
		//验证码校验
		String volidateCode_session = (String) session.getAttribute("validateCode");
		System.out.println(volidateCode_session);
		System.out.println(volidateCode);
		if(volidateCode_session !=null && !volidateCode_session.equals(volidateCode)) {
			ResultUtil.throwExcepion(ResultUtil.createFail(Config.MESSAGE, 113, null));
		}
		//认证
		ActiveUser activeUser= userService.checkUser(userId, pwd);

		// 将用户身份信息写入session
		session.setAttribute(Config.ACTIVEUSER_KEY, activeUser);
		
		return ResultUtil.createSubmitResult(ResultUtil.createSuccess(Config.MESSAGE, 107,new Object[] {activeUser.getUserid()}));
	}
	/**用户退出*/
	@RequestMapping("/logout")
	public String logout(HttpSession session) 
			throws Exception{
		//session设置为过期
		session.invalidate();
		
		return "redirect:login.action";
	}
	
	
}
