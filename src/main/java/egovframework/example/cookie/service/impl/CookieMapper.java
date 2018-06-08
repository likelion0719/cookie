package egovframework.example.cookie.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("cookieMapper")
public interface CookieMapper {

	@SuppressWarnings("rawtypes")
	List<Map> selectWelcomeWebServiceList() throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectPieChartList() throws Exception;
}
