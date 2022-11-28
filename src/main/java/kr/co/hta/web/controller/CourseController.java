package kr.co.hta.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import kr.co.hta.annotation.LoginUser;
import kr.co.hta.service.CourseService;
import kr.co.hta.vo.Category;
import kr.co.hta.vo.User;
import kr.co.hta.web.form.CourseRegisterForm;

@Controller
@RequestMapping("/courses")
@SessionAttributes("courseRegisterForm")
public class CourseController {

	@Value("${online.course.image.save-directory}")
	String courseImageSaveDirectory;
	
	@Autowired
	private CourseService courseService;
	
	@GetMapping(path = "/form1")
	public String form(Model model) {
		List<Category> categories = courseService.getAllCategories();
		model.addAttribute("categories", categories);
		model.addAttribute("courseRegisterForm", new CourseRegisterForm());
		
		return "course/form1";
	}
	
	@PostMapping(path = "/form2")
	public String formDetail(@ModelAttribute("courseRegisterForm") CourseRegisterForm courseRegisterForm) throws IOException {
		
		if(!courseRegisterForm.getImageFile().isEmpty()) {
			MultipartFile imageFile = courseRegisterForm.getImageFile();
			String filename = imageFile.getOriginalFilename();
			courseRegisterForm.setImagename(filename);
			
			InputStream in = imageFile.getInputStream();
			FileOutputStream out = new FileOutputStream(new File(courseImageSaveDirectory, filename));
			FileCopyUtils.copy(in, out);
		}
		
		return "course/from2";
	}
	
	@PostMapping(path = "/insert")
	public String insert(@LoginUser User loginUser, @ModelAttribute("courseRegisterForm") CourseRegisterForm courseRegisterForm, SessionStatus sessionStatus) {
		courseService.addNewCourse(loginUser, courseRegisterForm);
		sessionStatus.setComplete();
		
		return "redirect:/courses/complete";
	}
	
	@GetMapping(path = "/complete")
	public String complete() {
		return "course/complete";
	}
	
}
