package egovframework.example.cookie.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.cookie.service.CookieService;

@Controller
public class CookieController {

	@Resource(name = "cookieService")
	private CookieService cookieService;
	
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value = "/cookie.do")
	public String cookie(ModelMap model) throws Exception {

		List<Map> welcomeWebList = cookieService.selectWelcomeWebServiceList();
		
		List<Map> pieChartList = cookieService.selectPieChartList();
		
		model.addAttribute("welcomeWebList", 	welcomeWebList);
		model.addAttribute("pieChartList", 		pieChartList);
		
		return "cookie/cookie.tiles";
	}
	
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value = "/cookie2.do")
	public String cookie2(ModelMap model) throws Exception {

		List<Map> welcomeWebList = cookieService.selectWelcomeWebServiceList();
		
		List<Map> pieChartList = cookieService.selectPieChartList();
		
		model.addAttribute("welcomeWebList", 	welcomeWebList);
		model.addAttribute("pieChartList", 		pieChartList);
		
		return "cookie/cookie2.tiles";
	}
	
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value = "/cookie3.do")
	public String cookie3(ModelMap model) throws Exception {

		List<Map> welcomeWebList = cookieService.selectWelcomeWebServiceList();
		
		List<Map> pieChartList = cookieService.selectPieChartList();
		
		model.addAttribute("welcomeWebList", 	welcomeWebList);
		model.addAttribute("pieChartList", 		pieChartList);
		
		return "cookie/cookie3.tiles";
	}
}

