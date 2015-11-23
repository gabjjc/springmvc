package com.gtd.mqh.alu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gtd.mqh.alu.mappers.ossmqh.OssMqhMapper;

@Service
public class OssService {

  @Autowired
  OssMqhMapper ossMapper;

  public List<String> getNodes() {
   return ossMapper.getNodes();
  }
  
  
}
