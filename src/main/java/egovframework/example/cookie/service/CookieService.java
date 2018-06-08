package egovframework.example.cookie.service;

import java.util.List;
import java.util.Map;

public interface CookieService {

	@SuppressWarnings("rawtypes")
	List<Map> selectWelcomeWebServiceList() throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectPieChartList() throws Exception;
}

