package com.rushang.service;

import java.util.List;
import java.util.Map;

public interface CollectionService {
    public boolean addCollection(String yhid,String xxid);
    public List<Map> getCollection(String yhid, String xxid,int startTow);

    public boolean updateCollection(String scid,String sczt);
}
