package event.controller;



import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import event.model.EventBean;
import event.model.EventDao;

@Controller
public class ForAdminEventDeleteController {
	private final String command="delete.evt";
	private String gotoPage="redirect:/list.evt";
	
	@Autowired
	EventDao eventDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(command)
	public String delete(@RequestParam("num") String num,
						@RequestParam(value="pageNumber", required=false) String pageNumber,
						Model model) {
	
		
		EventBean eb = eventDao.getEvent(num);
		
		String deletePath = servletContext.getRealPath("/resources/images");
		
		File delFile = new File(deletePath+"/"+eb.getEventImage());
		delFile.delete();
		
		int cnt = eventDao.deleteEvent(num); // DB
		
		return gotoPage+"?pageNumber="+pageNumber;
	}


}

