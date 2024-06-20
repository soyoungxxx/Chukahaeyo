package com.choikang.chukahaeyo.visitor.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class VisitorVO {
    private int visitorID;
    private String visitorCookie;
    private Timestamp visitDate;

    // NO DB
    private String startDate;
    private String endDate;
}
