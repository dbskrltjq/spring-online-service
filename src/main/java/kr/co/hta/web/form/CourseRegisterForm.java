package kr.co.hta.web.form;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CourseRegisterForm {

	private List<String> categoryIds;
	private String title;
	private String grade;
	private String period;
	private String certificate;
	private int price;
	private MultipartFile imageFile;
	private String imagename;
	private String description;
	private List<String> learnings;
	private List<String> targets;
	private List<String> tags;
}
