package yycg.base.filter;

import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import yycg.base.pojo.vo.ActiveUser;
import yycg.base.process.context.Config;
import yycg.base.process.result.ResultUtil;
import yycg.util.ResourcesUtil;

/**
 * 
 * <p>Title: LoginInterceptor</p>
 * <p>Description:用户身份校验 </p>
 * <p>Company: www.itcast.com</p> 
 * @author	andy
 * @date	
 * @version 1.0
 */
public class LoginInterceptor implements HandlerInterceptor{
	
	/**执行时机：进入action方法之前执行*/
	//使用场景：用于用户认证，用户授权拦截
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		/*校验用户身份的合法性*/
		HttpSession session = request.getSession();
		ActiveUser activeUser =(ActiveUser) session.getAttribute(Config.ACTIVEUSER_KEY);
		//如果存在则放行
		if(activeUser!=null) {
			return true;
		}
		/*用户不存在判断去哪一个页面*/
		//页面链接
		String page_url=request.getRequestURI();
		//放行链接
		List<String> list=ResourcesUtil.gekeyList(Config.ANONYMOUS_ACTIONS);
		for(String url:list) {
			//链接下标（没有为-1），有则代表是此链接
			if(page_url.indexOf(url)>=0) {
				return true;
			}
		}
		
		ResultUtil.throwExcepion(ResultUtil.createWarning(Config.MESSAGE, 106, null));
		
		return false;
	}
	/**执行时机：进入action方法，在返回modleandview之前执行*/
	//使用场景：在这里统一对返回的数据进行处理，比如统一添加菜单，导航
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}
	
	/**执行时机：action方法执行完成，已经返回modelAndView，执行*/
	//使用场景：统一处理系统异常，在这里统一记录系统日志，监控action方法执行时间，在preHandle记录开始时间，在afterCompletion记录结束时间
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}

	
}
