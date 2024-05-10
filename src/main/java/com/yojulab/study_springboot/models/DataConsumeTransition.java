package com.yojulab.study_springboot.models;

public class DataConsumeTransition {
    private String _id;
    private String industry_major_cate;
    private String region;
    private int std_year;
    private int std_month;
    private int std_year_month;
    private double consumption_amount;

    // Getters and Setters
    public String getId() {
        return _id;
    }

    public void setId(String _id) {
        this._id = _id;
    }

    public String getIndustryMajorCate() {
        return industry_major_cate;
    }

    public void setIndustryMajorCate(String industry_major_cate) {
        this.industry_major_cate = industry_major_cate;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public int getStdYear() {
        return std_year;
    }

    public void setStdYear(int std_year) {
        this.std_year = std_year;
    }

    public int getStdMonth() {
        return std_month;
    }

    public void setStdMonth(int std_month) {
        this.std_month = std_month;
    }

    public int getStdYearMonth() {
        return std_year_month;
    }

    public void setStdYearMonth(int std_year_month) {
        this.std_year_month = std_year_month;
    }

    public double getConsumptionAmount() {
        return consumption_amount;
    }

    public void setConsumptionAmount(double consumption_amount) {
        this.consumption_amount = consumption_amount;
    }
}
