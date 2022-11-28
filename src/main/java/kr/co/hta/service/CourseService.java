package kr.co.hta.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.hta.criteria.CourseCriteria;
import kr.co.hta.mapper.CategoryMapper;
import kr.co.hta.mapper.CourseMapper;
import kr.co.hta.vo.Category;
import kr.co.hta.vo.Course;
import kr.co.hta.vo.CourseCategory;
import kr.co.hta.vo.CourseLearning;
import kr.co.hta.vo.CourseRecommendation;
import kr.co.hta.vo.CourseTag;
import kr.co.hta.vo.User;
import kr.co.hta.web.form.CourseRegisterForm;


@Service
@Transactional
public class CourseService {

	@Autowired
	private CategoryMapper categoryMapper;
	
	@Autowired
	private CourseMapper courseMapper;
	
	
	public List<Category> getAllCategories() {
		return categoryMapper.getAllCategories();
	}
	
	public List<Course> getRecentAddedCourses(String userId) {
		return courseMapper.getCourseByUserId(userId);			// 지금은 그냥 다 가져오게 함
	}
	
	public List<Course> getCoursesByCategoryId(String categoryId) {
		return courseMapper.getCoursesByCategoryId(categoryId);
	}
	
	public Course getCourseDetail(int courseNo) {
		return courseMapper.getCourseByNo(courseNo);
	}
	
	public List<String> getAllTags() {
		return courseMapper.getAllTags();
	}
	
	public List<Course> searchCoursesByCriteria(CourseCriteria criteria) {
		return courseMapper.getCoursesByCriteria(criteria);
	}
	
	public List<Course> getMyCourses(String id) {
		return courseMapper.getCourseByUserId(id);
	}
	
	public void addNewCourse(User loginUser, CourseRegisterForm courseRegisterForm) throws IOException {	// 추후 파일처리하는 것과 관련해서 IOException처리가 필요하다.
		
		// BeanUtils를 사용하지 않는 이유 : CourseRegisterForm의 tags는 List<String>인데, Course에서는 List<CourseTag>
		// 타입이 달라서!
		
		// 강의정보 저장하기  --> 나머지에 courseNo가 들어가야 하므로 강의정보부터 저장한다.
		Course course = new Course();
		course.setTitle(courseRegisterForm.getTitle());
		course.setGrade(courseRegisterForm.getGrade());
		course.setDescription(courseRegisterForm.getDescription());
		course.setPrice(courseRegisterForm.getPrice());
		course.setPeriod(courseRegisterForm.getPeriod());
		course.setCertificateCompletion(courseRegisterForm.getCertificate());
		course.setUser(loginUser);
		course.setImagename(courseRegisterForm.getImagename());
		
		//System.out.println("저장전: " + course);
		courseMapper.insertCourse(course);
		//System.out.println("저장후: " + course);

		// 강의 카테고리정보 저장하기
		List<String> categoryIds = courseRegisterForm.getCategoryIds();
		for(String categoryId : categoryIds) {
			CourseCategory courseCategory = new CourseCategory(course.getNo(), categoryId);
			courseMapper.insertCourseCategory(courseCategory);
		}
		
		// 강의 학습내용정보 저장하기
		List<String> learnings = courseRegisterForm.getLearnings();
		for(String learning : learnings) {
			CourseLearning courseLearning = new CourseLearning(course.getNo(), learning);
			courseMapper.insertCourseLearning(courseLearning);
		}
		
		// 강의 대상정보 저장하기
		List<String> targets = courseRegisterForm.getTargets();
		for(String target : targets) {
			courseMapper.insertCourseRecommendation(new CourseRecommendation(course.getNo(), target));
		}
		
		// 강의 태그정보 저장하기
		List<String> tags = courseRegisterForm.getTags();
		for(String tag : tags) {
			courseMapper.insertCourseTag(new CourseTag(course.getNo(), tag));
		}
	}

	
}
