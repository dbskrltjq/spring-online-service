package kr.co.hta.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.hta.vo.Course;
import kr.co.hta.vo.CourseCategory;
import kr.co.hta.vo.CourseLearning;
import kr.co.hta.vo.CourseRecommendation;
import kr.co.hta.vo.CourseTag;

@Mapper
public interface CourseMapper {

	void insertCourse(Course course);
	void insertCourseCategory(CourseCategory courseCategory);
	void insertCourseLearning(CourseLearning courseLearning);
	void insertCourseRecommendation(CourseRecommendation courseRecommendation);
	void insertCourseTag(CourseTag courseTag);
}
