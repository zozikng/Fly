package com.zzk.system.domain.vo.fly;

import lombok.Data;

import java.util.Collections;
import java.util.List;

@Data
public class PageResult {

    private Integer pageNum = 0;
    private Integer pagesize = 0;
    private Long total = 0L;
    private List<?> items = Collections.emptyList();
}
