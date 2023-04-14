package Servlet;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Id;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import DAO.UserDao;
import DAO.VideoDao;
import Entity.Report;
import Entity.User;
import Entity.Video;
import Utils.JpaUtils;

/**
 * Servlet implementation class AdminServlet
 */
@MultipartConfig
@WebServlet({ "/views/trangdauAdmin", "/views/quanlyVideo", "/views/editVideo/*", "/views/createVD", "/views/deleteVD",
		"/views/updateVD", "/views/quanlyUser", "/views/editUser/*", "/views/deleteUser", "/views/updateUser",
		"/views/report", "/views/findByVideo/*", "/views/adminOff", "/views/resetU" })
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		UserDao userDao = new UserDao();
		User user = new User();
		VideoDao videoDao = new VideoDao();
		Video video = new Video();
		if (uri.contains("editVideo")) {
			String id = uri.substring(uri.lastIndexOf("/") + 1);
			video = videoDao.findbyId(id);
			request.setAttribute("isAdmin", true);
			request.setAttribute("view", "/views/quanlyvideo.jsp");
		} else if (uri.contains("editUser")) {
			request.setAttribute("isAdmin", true);
			String id = uri.substring(uri.lastIndexOf("/") + 1);
			user = userDao.findbyId(id);
			request.setAttribute("view", "/views/quanlyuser.jsp");
		} else if (uri.contains("quanlyVideo")) {
			request.setAttribute("isAdmin", true);
			request.setAttribute("view", "/views/quanlyvideo.jsp");
		} else if (uri.contains("createVD")) {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			String method = request.getMethod();
			if (method.equalsIgnoreCase("POST")) {
				try {
					BeanUtils.populate(video, request.getParameterMap());
					File dir = new File(request.getServletContext().getRealPath("/images"));
					Part photo = request.getPart("poster");
					File photoFile = new File(dir, photo.getSubmittedFileName());
					photo.write(photoFile.getAbsolutePath());
					video.setPoster(photoFile.getName());
					videoDao.create(video);
					request.setAttribute("message", "Thêm mới thành công");
					request.setAttribute("isAdmin", true);
					request.setAttribute("view", "/views/quanlyvideo.jsp");
				} catch (Exception e) {
					request.setAttribute("message", "Thêm mới thất bại");
				}
			}
		} else if (uri.contains("updateVD")) {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			String method = request.getMethod();
			if (method.equalsIgnoreCase("POST")) {
				try {
					BeanUtils.populate(video, request.getParameterMap());
					File dir = new File(request.getServletContext().getRealPath("/images"));
					Part photo = request.getPart("poster");
					File photoFile = new File(dir, photo.getSubmittedFileName());
					photo.write(photoFile.getAbsolutePath());
					video.setPoster(photoFile.getName());
					videoDao.update(video);
					request.setAttribute("message", "Cập nhật thành công");
					request.setAttribute("isAdmin", true);
					request.setAttribute("view", "/views/quanlyvideo.jsp");
				} catch (Exception e) {
					request.setAttribute("message", "Cập nhật thất bại");
				}
			}
		} else if (uri.contains("deleteVD")) {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			String method = request.getMethod();
			if (method.equalsIgnoreCase("POST")) {
				try {
					String id = request.getParameter("id");
					videoDao.remove(id);
					request.setAttribute("message", "Xóa thành công");
					request.setAttribute("isAdmin", true);
					request.setAttribute("view", "/views/quanlyvideo.jsp");
				} catch (Exception e) {
					request.setAttribute("message", "Xóa thất bại");
				}
			}
		} else if (uri.contains("quanlyUser")) {
			request.setAttribute("isAdmin", true);
			request.setAttribute("view", "/views/quanlyuser.jsp");
		} else if (uri.contains("createUser")) {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			String method = request.getMethod();
			if (method.equalsIgnoreCase("POST")) {
				try {
					BeanUtils.populate(user, request.getParameterMap());
					userDao.create(user);
					request.setAttribute("message", "Thêm mới thành công");
				} catch (Exception e) {
					request.setAttribute("message", "Thêm mới thất bại");
				}
			}
		} else if (uri.contains("updateUser")) {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			String method = request.getMethod();
			if (method.equalsIgnoreCase("POST")) {
				if(valiDate2(request, response)) {
					try {
						BeanUtils.populate(user, request.getParameterMap());
						userDao.update(user);
						request.setAttribute("message", "Cập nhật thành công");
						request.setAttribute("isAdmin", true);
						request.setAttribute("view", "/views/quanlyuser.jsp");

					} catch (Exception e) {
						e.printStackTrace();
					}
				}else {
					request.setAttribute("message1", "Cập nhật thất bại");
					request.setAttribute("isAdmin", true);
					request.setAttribute("view", "/views/quanlyuser.jsp");
				}
			}
		} else if (uri.contains("resetU")) {
			request.setAttribute("isAdmin", true);
			request.setAttribute("view", "/views/quanlyuser.jsp");
		} else if (uri.contains("deleteUser")) {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			String method = request.getMethod();
			if (method.equalsIgnoreCase("POST")) {
				String id = request.getParameter("id");
				if (!id.isEmpty()) {
					try {
						user = userDao.findbyId(id);
						userDao.remove(id);
						request.setAttribute("message", "Xóa thành công");
						request.setAttribute("isAdmin", true);
						request.setAttribute("view", "/views/quanlyuser.jsp");
					} catch (Exception e) {
						e.printStackTrace();
					}
				} else {
					request.setAttribute("message1", "Xóa thất bại");
					request.setAttribute("isAdmin", true);
					request.setAttribute("view", "/views/quanlyuser.jsp");
				}
			}
		} else if (uri.contains("report")) {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			request.setAttribute("isAdmin", true);
			request.setAttribute("listTitle", videoDao.findAll());
			this.countFavorite(request, response);
			request.setAttribute("view", "/views/report.jsp");
		} else if (uri.contains("adminOff")) {
			request.getSession().setAttribute("user", null);
			request.setAttribute("isAdmin", false);
			request.setAttribute("view", "/views/trangdau.jsp");
		} else if (uri.contains("findByVideo")) {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			request.setAttribute("isAdmin", true);
			request.setAttribute("listTitle", videoDao.findAll());
			this.countFavorite(request, response);
			try {
				String videoT = request.getParameter("videoTitle");
				EntityManager em = JpaUtils.getEntityManager();
				String jpql = "SELECT o.user FROM Favorite o WHERE o.video.id = :vid";
				TypedQuery<User> query = em.createQuery(jpql, User.class);
				query.setParameter("vid", videoT);
				List<User> list = query.getResultList();
				request.setAttribute("reportU", list);
				request.setAttribute("view", "/views/report2.jsp");
			} catch (Exception e) {
				System.out.println(e);
			}
		} else if (uri.contains("trangdauAdmin")) {
			request.getSession().setAttribute("user", null);
			request.setAttribute("view", "/views/trangdau.jsp");
		}
		request.setAttribute("listu", userDao.findAll());
		request.setAttribute("listfilm", videoDao.findAll());
		request.setAttribute("formu", user);
		request.setAttribute("formv", video);
		request.setAttribute("videolist", videoDao.findAll());
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

	private void countFavorite(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		EntityManager em = JpaUtils.getEntityManager();
		try {
			String jpql = "SELECT new Report(o.video.title, count(o), min(o.likeDate), max(o.likeDate)) FROM Favorite o GROUP BY o.video.title";
			TypedQuery<Report> query = em.createQuery(jpql, Report.class);
			List<Report> list = query.getResultList();
//			for (Report r : list) {
//				System.out
//						.println(r.getGroup() + " - " + r.getLikes() + "  - " + r.getOldest() + " - " + r.getNewest());
//			}
			request.setAttribute("reportlist", list);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	private void findByVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String videoT = request.getParameter("videoTitle");
			EntityManager em = JpaUtils.getEntityManager();
			String jpql = "SELECT o.user FROM Favorite o WHERE o.video.id = :vid";
			TypedQuery<User> query = em.createQuery(jpql, User.class);
			query.setParameter("vid", videoT);
			List<User> list = query.getResultList();
			for (User u : list) {
				System.out.println(u.getFullname());
			}
			request.setAttribute("reportU", list);
		} catch (Exception e) {
			System.out.println(e);
		}
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
	
	private boolean valiDate2(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("id");
		String password = request.getParameter("password");
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		boolean admin = Boolean.parseBoolean(request.getParameter("admin"));
		if (password.isEmpty()) {
			return false;
		} else if (fullname.isEmpty()) {
			return false;
		} else if (email.isEmpty()) {
			return false;
		}
		return true;
	}
}
