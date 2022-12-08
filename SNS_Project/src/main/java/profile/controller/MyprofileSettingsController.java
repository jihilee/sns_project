package profile.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyprofileSettingsController {
	
	private final String command = "/settings.pro";
	private String getPage = "/settings";
	
	@RequestMapping(command)
	public String setting() {
		return getPage;
	}

}
