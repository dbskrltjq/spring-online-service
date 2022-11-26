package kr.co.hta.web.controller.rest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserRestController {

	@GetMapping("/rest/user")
	public String user() {
		return "hong";
	}
}
