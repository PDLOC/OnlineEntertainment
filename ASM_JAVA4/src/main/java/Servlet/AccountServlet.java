package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.realm.UserDatabaseRealm;
import org.apache.commons.beanutils.BeanUtils;

import DAO.UserDao;
import DAO.VideoDao;
import Entity.User;
import Entity.Video;
import Utils.CookieUtils;

/**
 * Servlet implementation class AccountServlet
 */
@WebServlet({ "/views/trangdau", "/views/sign-in", "/views/sign-up", "/views/edit-profile", "/views/logOff",
		"/views/changePass", "/views/forgotPass" })
public class AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AccountServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		UserDao udao = new UserDao();
		User user = new User();
		VideoDao vDao = new VideoDao();
		Video video = new Video();
		String uri = request.getRequestURI();
		HttpSession session = request.getSession(true);
		if (uri.contains("sign-in")) {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			request.setAttribute("view", "/views/sign-in.jsp");
			String method = request.getMethod();
			if (method.equalsIgnoreCase("POST")) {
				String id = request.getParameter("id");
				String pass = request.getParameter("password");
				try {
					user = udao.findbyId(id);
					if (!user.getPassword().equals(pass)) {
						request.setAttribute("message", "Sai mật khẩu");
					} else {
						request.setAttribute("message", "Đăng nhập thành công !");
						boolean admin = user.getAdmin();
						int hours = 0;
						if (admin == true) {
							request.setAttribute("isAdmin", true);
						}
						session.setAttribute("user", user);
						if (user != null) {
							hours = 60 * 60;
						}
						CookieUtils.add("username", id, hours, response);
						CookieUtils.add("password", pass, hours, response);
						request.setAttribute("view", "/views/trangdau.jsp");
					}
				} catch (Exception e) {
					request.setAttribute("message", "Sai tên đăng nhập");
				}
			}
		} else if (uri.contains("sign-up")) {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			request.setAttribute("view", "/views/sign-up.jsp");
			String method = request.getMethod();
			if (method.equalsIgnoreCase("POST")) {
				user = new User();
				if (valiDate(request, response)) {
					try {
						BeanUtils.populate(user, request.getParameterMap());
						udao.create(user);
						request.setAttribute("message", "Đăng ký thành công");
					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					}
				} else {
					udao.create(null);
					request.setAttribute("message", "LỖI ĐĂNG KÝ RỒI");
				}
			}
		} else if (uri.contains("edit-profile")) {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			request.setAttribute("view", "/views/edit-profile.jsp");
			String method = request.getMethod();
			if (method.equalsIgnoreCase("POST")) {
				try {
					user = new User();
					BeanUtils.populate(user, request.getParameterMap());
					udao.update(user);
					request.setAttribute("message", "Cập nhật thành công");
				} catch (Exception e) {
					// TODO: handle exception
					request.setAttribute("message", "LỖI CẬP NHẬT RỒI");
				}
			}
		} else if (uri.contains("changePass")) {
			request.setAttribute("view", "/views/doimatkhau.jsp");
			user = udao.findbyId(CookieUtils.get("username", request));
			String method = request.getMethod();
			if (method.equalsIgnoreCase("POST")) {
				String oldP = request.getParameter("oldPass");
				String newP = request.getParameter("newPass");
				String confirmP = request.getParameter("comfirmPass");
				if (!newP.equals(confirmP)) {
					request.setAttribute("error", "Vui lòng xác nhận lại mật khẩu");
				} else if (oldP.equals(newP) || oldP.equals(confirmP)) {
					request.setAttribute("error", "Mật khẩu mới trùng với mật khẩu hiện tại");
				} else {
					user.setPassword(newP);
					udao.update(user);
					CookieUtils.add("password", newP, 30 * 60, response);
					request.setAttribute("error", "Đổi thành công");
				}
			}
		} else if (uri.contains("logOff")) {
			request.getSession().setAttribute("user", null);
			CookieUtils.add("username", null, 0, response);
			CookieUtils.add("password", null, 0, response);
			request.setAttribute("view", "/views/trangdau.jsp");
		} else if (uri.contains("trangdau")) {
			request.setAttribute("view", "/views/trangdau.jsp");
		}
		request.setAttribute("videolist", vDao.findAll());
		request.getRequestDispatcher("/views/trangchu.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	private boolean valiDate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("id");
		String password = request.getParameter("password");
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		boolean admin = Boolean.parseBoolean(request.getParameter("admin"));
		if (username.isEmpty()) {
			return false;
		} else if (password.isEmpty()) {
			return false;
		} else if (fullname.isEmpty()) {
			return false;
		} else if (email.isEmpty()) {
			return false;
		}
		return true;
	}
}
