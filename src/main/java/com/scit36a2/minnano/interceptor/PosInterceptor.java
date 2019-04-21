package com.scit36a2.minnano.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class PosInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Integer chk = (Integer) session.getAttribute("comp_seq");
		Integer chk_auth = (Integer) session.getAttribute("emp_auth_level");

		String root = request.getContextPath();
		String uri = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1);
		String posfunc = "pos logout selectseat selectCompanyOne selectMenu seatsavailable makeorder replaceorder alOrderList";
		posfunc += " makepayment makepaymentcomplex predicCash cumulatepaymenttoday selectCashonhand";
		posfunc += " insertCashonhand movetable swaptable mergetable selectpayments";
//		System.out.println(uri + " contains posfunc : " + posfunc.contains(uri) );
		if (chk == null) {
			response.sendRedirect(root + "/login");
			return false;
		} else {
			if (chk_auth != 9) {
				if (!(posfunc.contains(uri))) {
					response.sendRedirect(root + "/pos");
					return false;
				}
			}
		}

		return super.preHandle(request, response, handler);
	}
}
