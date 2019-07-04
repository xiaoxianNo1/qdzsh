package com.rushang.service;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

public interface FileService {
    public boolean addMessageTp(String tp_id,InputStream tp_nr, String message_id, String tp_mc);

    public List<Map> getTpByMessageId(String messageId);
}
