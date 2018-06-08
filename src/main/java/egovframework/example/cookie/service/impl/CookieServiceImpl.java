package egovframework.example.cookie.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.cookie.service.CookieService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("cookieService")
public class CookieServiceImpl extends EgovAbstractServiceImpl implements CookieService {

	@Resource(name="cookieMapper")
	private CookieMapper cookieMapper;

	@Override
	public List<Map> selectWelcomeWebServiceList() throws Exception {
		return cookieMapper.selectWelcomeWebServiceList();
	}

	@Override
	public List<Map> selectPieChartList() throws Exception {
		return cookieMapper.selectPieChartList();
	}
}