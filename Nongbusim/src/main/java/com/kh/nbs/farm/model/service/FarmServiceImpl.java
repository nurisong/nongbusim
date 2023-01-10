package com.kh.nbs.farm.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.nbs.common.model.vo.Attachment;
import com.kh.nbs.common.model.vo.PageInfo;
import com.kh.nbs.farm.model.dao.FarmDao;
import com.kh.nbs.farm.model.vo.Farm;

@Service
public class FarmServiceImpl implements FarmService {
	
	@Autowired
	private FarmDao farmDao;
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int selectFarmCount() {
		return 0;
	}

	@Override
	public ArrayList<Farm> selectFarmList(PageInfo pi) {
		return null;
	}

	@Override
	public int insertAttachment(Attachment a) {
		return farmDao.insertAttachment(a, sqlSession);
	}

	@Override
	public int insertFarm(Farm f) {
		return farmDao.insertFarm(f, sqlSession);
	}

	@Override
	public Farm selectFarm(int farmNo) {
		return null;
	}

	@Override
	public int deleteFarm(int farmNo) {
		return 0;
	}

	@Override
	public int updateFarm(Farm f) {
		return 0;
	}

}
