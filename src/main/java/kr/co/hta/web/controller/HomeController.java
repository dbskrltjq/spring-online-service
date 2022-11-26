package kr.co.hta.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class HomeController {
	
	@GetMapping(path = "/")
	public String home() {
		return "home";
	}
	

}
