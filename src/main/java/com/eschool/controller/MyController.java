package com.eschool.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.eschool.dao.Friends.FDBHandler;
import com.eschool.dao.Group.CGDBHandler;
import com.eschool.dao.Group.GPDBHandler;
import com.eschool.dao.Pro.Proimage;
import com.eschool.dao.User.DBHandler;
import com.eschool.dao.Wallpost.WDBHandler;
import com.eschool.dao.market.MDBHandler;
import com.eschool.dao.vedio.VDBHandler;
import com.eschool.model.CreateGrp;
import com.eschool.model.Friends;
import com.eschool.model.Gpost;
import com.eschool.model.Image;
import com.eschool.model.Mkt;
import com.eschool.model.User;
import com.eschool.model.Wallpost;
import com.eschool.model.video;
import com.eschool.services.EmailService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/")
public class MyController {
	@Autowired
	private EmailService emailService;
	private DBHandler UDBH = new DBHandler();

	@GetMapping("/")
	public ModelAndView index() {
		User user = new User();
		ModelAndView mv = new ModelAndView("facebook");
		mv.addObject("user", user);
		return mv;
	}

	@PostMapping(value = "/Login", consumes = "application/x-www-form-urlencoded")
	public ModelAndView login(@RequestParam("email") String email, @RequestParam("password") String password,
			HttpSession session) {
		ModelAndView mv;
		User user = UDBH.checkUser(email);
		if (user == null) {
			mv = new ModelAndView("facebook");
			mv.addObject("error", "User does not exist. Please sign up.");
			mv.addObject("user", new User());
		} else {
			if (user.getPassword() != null && user.getPassword().equals(password)) {
				session.setAttribute("email", email);
				mv = new ModelAndView("Welcome");
				mv.addObject("email", session.getAttribute("email"));
				mv.addObject("success", "Woo! You logged in safely.");
				String subject = "Login Notification";
				emailService.sendLoginEmail(email);

			} else {
				mv = new ModelAndView("facebook");
				mv.addObject("error", "Incorrect password. Please try again.");
				mv.addObject("user", new User());
			}
		}
		return mv;
	}

	@GetMapping(value = "/Game")
	public ModelAndView Game() {

		ModelAndView mv = new ModelAndView("Gaming");

		return mv;
	}

	@GetMapping(value = "/Vedio")
	public ModelAndView Vedio() {

		ModelAndView mv = new ModelAndView("Vedio");

		return mv;
	}

	@GetMapping(value = "/Group")
	public ModelAndView Group() {

		ModelAndView mv = new ModelAndView("Group");

		return mv;
	}

	@GetMapping(value = "/Market")
	public ModelAndView Market() {

		ModelAndView mv = new ModelAndView("Market");

		return mv;
	}

	@PostMapping(value = "/register", consumes = "application/x-www-form-urlencoded")
	public ModelAndView registerUser(@Valid @ModelAttribute("user") User user, BindingResult result,
			HttpSession session) {
		ModelAndView mv;
		if (result.hasErrors()) {
			mv = new ModelAndView("facebook");
		} else {
			UDBH.save(user);
			session.setAttribute("email", user.getEmail());
			mv = new ModelAndView("Welcome");
			mv.addObject("success", "User registered successfully!");
			emailService.sendLoginEmail(user.getEmail());
		}
		return mv;
	}

	@PostMapping("/SetProfile_image")
	public String setProfileImage(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(2400 * 60);

		String email = (String) session.getAttribute("email");

		if (email == null || email.isEmpty()) {
			return "redirect:/login";
		}

		try {
			if (file != null && !file.isEmpty()) {
				String fileName = file.getOriginalFilename();

				String uploadPath = request.getServletContext().getRealPath("images");
				File uploadDir = new File(uploadPath + "/" + email);
				System.out.println(uploadDir);

				if (!uploadDir.exists()) {
					uploadDir.mkdirs();
				}

				File targetFile = new File(uploadDir, fileName);

				file.transferTo(targetFile);

				Image mimg = new Image(email, fileName);
				Proimage img = new Proimage();
				img.Check(mimg);

				session.setAttribute("proimage", fileName);
			}
		} catch (IOException e) {
			System.out.println(e.getMessage() + "error");
			e.printStackTrace();
			return "errorPage";
		}

		return "redirect:/profile";
	}

	@PostMapping(value = "/WallpostSave")
	public String WallpostSave(@RequestParam("message") String message, @RequestParam("file") MultipartFile file,
			HttpServletRequest request) {

		HttpSession session = request.getSession();

		String sender = (String) session.getAttribute("email");
		System.out.println("sender:" + sender);

		if (sender == null || sender.isEmpty()) {
			return "redirect:/login";
		}

		String message1 = "Wallpost saved successfully!";
		try {

			if (file != null && !file.isEmpty()) {
				String fileName = file.getOriginalFilename();

				String uploadPath = request.getServletContext().getRealPath("images");
				File uploadDir = new File(uploadPath + "/" + "Wallpost");
				System.out.println(uploadDir);
				if (!uploadDir.exists()) {
					uploadDir.mkdirs();
				}

				File targetFile = new File(uploadDir, fileName);
				file.transferTo(targetFile);

				String dop = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());

				Wallpost wpost = new Wallpost(0, sender, message, dop, fileName);
				WDBHandler wdb = new WDBHandler();
				wdb.save(wpost);

			} else {
				message1 = "File upload is required.";
			}
		} catch (Exception e) {
			e.printStackTrace();
			message1 = "An error occurred while saving the wallpost.";
		}

		return "redirect:/profile?message=" + message1;
	}

	@PostMapping(value = "market")
	public String Market(@RequestParam("pname") String pname, @RequestParam("price") String price,
			@RequestParam("location") String location, @RequestParam("file") MultipartFile file,
			HttpServletRequest request) {

		HttpSession session = request.getSession();
		int price1 = Integer.parseInt(price);

		String sender = (String) session.getAttribute("email");
		System.out.println("sender:" + sender);

		if (sender == null || sender.isEmpty()) {
			return "redirect:/login";
		}

		String message1 = "Product saved successfully!";
		try {

			if (file != null && !file.isEmpty()) {
				String fileName = file.getOriginalFilename();

				String uploadPath = request.getServletContext().getRealPath("images");
				File uploadDir = new File(uploadPath + "/" + "market");
				System.out.println(uploadDir);
				if (!uploadDir.exists()) {
					uploadDir.mkdirs();
				}

				File targetFile = new File(uploadDir, fileName);
				file.transferTo(targetFile);

				Mkt mp = new Mkt(0, sender, pname, location, fileName, price1);
				MDBHandler mdb = new MDBHandler();
				mdb.save(mp);

			} else {
				message1 = "File upload is required.";
			}
		} catch (Exception e) {
			e.printStackTrace();
			message1 = "An error occurred while saving the Market.";
		}

		return "redirect:/mprofile?message=" + message1;
	}

	@PostMapping(value = "/CreateGrpPost")
	public String CreateGrpPost(@RequestParam("tagline") String tagline, @RequestParam("related") String related,
			@RequestParam("file") MultipartFile file, HttpServletRequest request) {

		HttpSession session = request.getSession();

		String sender = (String) session.getAttribute("email");
		System.out.println("sender:" + sender);

		if (sender == null || sender.isEmpty()) {
			return "redirect:/login";
		}

		String message1 = "Gpost post successfully!";
		try {

			if (file != null && !file.isEmpty()) {
				String fileName = file.getOriginalFilename();

				String uploadPath = request.getServletContext().getRealPath("images");
				File uploadDir = new File(uploadPath + "/" + "Group");
				System.out.println(uploadDir);
				if (!uploadDir.exists()) {
					uploadDir.mkdirs();
				}

				File targetFile = new File(uploadDir, fileName);
				file.transferTo(targetFile);
				GPDBHandler gph = new GPDBHandler();

				Gpost gp = new Gpost(0, sender, tagline, related, fileName);
				gph.save(gp);

			} else {
				message1 = "File upload is required.";
			}
		} catch (Exception e) {
			e.printStackTrace();
			message1 = "An error occurred while saving the Group Post.";
		}

		return "redirect:/gprofile?message=" + message1;
	}

	@PostMapping(value = "/Vediopostsave")
	public String Vediopostsave(@RequestParam("file") MultipartFile file, HttpServletRequest request) {

		HttpSession session = request.getSession();

		String sender = (String) session.getAttribute("email");
		if (sender == null || sender.isEmpty()) {
			return "redirect:/login";
		}

		String message1 = "Video saved successfully!";
		try {

			if (file != null && !file.isEmpty()) {
				String fileName = file.getOriginalFilename();
				String vname = fileName;

				String uploadPath = request.getServletContext().getRealPath("images");
				File uploadDir = new File(uploadPath + "/" + "vedioPost");
				
				System.out.println(uploadDir);
				if (!uploadDir.exists()) {
					uploadDir.mkdirs();
				}

				File targetFile = new File(uploadDir, fileName);
				file.transferTo(targetFile);
				VDBHandler vbh = new VDBHandler();
				video v = new video(0, sender, vname);
				vbh.save(v);

			} else {
				message1 = "File upload is required.";
			}
		} catch (Exception e) {
			e.printStackTrace();
			message1 = "An error occurred while saving the Video Post.";
		}

		return "redirect:/vprofile?message=" + message1;
	}

	@PostMapping(value = "/CCreateGrp")
	public String CCreateGrp(@RequestParam("gname") String gname, @RequestParam("category") String category,
			HttpServletRequest request) {

		HttpSession session = request.getSession();

		String sender = (String) session.getAttribute("email");
		if (sender == null || sender.isEmpty()) {
			return "redirect:/login";
		}

		try {

			CreateGrp cgrp = new CreateGrp(0, sender, gname, category);
			CGDBHandler cgd = new CGDBHandler();
			cgd.save(cgrp);

		} catch (Exception e) {
			e.printStackTrace();

		}

		return "redirect:/gprofile";
	}

	@GetMapping("/mprofile")
	public ModelAndView mProfile(@RequestParam(value = "message", required = false) String message) {
		ModelAndView mv = new ModelAndView("Market");
		if (message != null && !message.isEmpty()) {
			mv.addObject("message", message);
		}
		return mv;

	}

	@GetMapping("/gprofile")
	public ModelAndView gProfile(@RequestParam(value = "message", required = false) String message) {
		ModelAndView mv = new ModelAndView("Group");
		if (message != null && !message.isEmpty()) {
			mv.addObject("message", message);
		}
		return mv;

	}

	@GetMapping("/profile")
	public ModelAndView Profile(@RequestParam(value = "message", required = false) String message) {
		ModelAndView mv = new ModelAndView("Welcome");
		if (message != null && !message.isEmpty()) {
			mv.addObject("message", message);
		}
		return mv;

	}

	@GetMapping("/vprofile")
	public ModelAndView vprofile(@RequestParam(value = "message", required = false) String message) {
		ModelAndView mv = new ModelAndView("Vedio");
		if (message != null && !message.isEmpty()) {
			mv.addObject("message", message);
		}
		return mv;

	}

	@GetMapping("/UpdateRequest")
	public String updateRequest(@RequestParam("status") int status, @RequestParam("fid") int fid, HttpSession session) {

		FDBHandler fdb = new FDBHandler();
		fdb.changeStatus(fid, status);
		return "redirect:/profile";
	}

	@PostMapping(value = "/SendRequest", consumes = "application/x-www-form-urlencoded")
	public String SendRequest(@RequestParam("rec") String rec, HttpSession session) {
		String sender = (String) session.getAttribute("email");
		DBHandler dbHandler = new DBHandler();

		User recipientUser = dbHandler.checkUser(rec);
		String message;

		if (recipientUser == null) {
			message = "User does not exist.";
		} else {
			FDBHandler fdb = new FDBHandler();

			Friends existingRequest = fdb.checkFriendRequest(sender, rec);
			if (existingRequest != null) {
				if (existingRequest.getStatus() == 0) {
					message = "Friend request is pending.";
				} else if (existingRequest.getStatus() == 1) {
					message = "You are already friends.";
				} else {
					message = "Invalid request status.";
				}
			} else {

				int fid = 0;
				int status = 0;

				Friends fd = new Friends(fid, sender, rec, status);
				fdb.save(fd);
				message = "Friend request sent successfully!";
			}
		}

		return "redirect:/profile?message=" + message;
	}

}
