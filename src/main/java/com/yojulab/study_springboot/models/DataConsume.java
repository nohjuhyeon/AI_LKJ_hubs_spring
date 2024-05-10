package com.yojulab.study_springboot.models;

public class DataConsume {
    private String _id;
    private String industry_major_cate;
    private String industry_middle_cate;
    private double consumption_amount;
    private String region;
    private int std_year;

    // Getter와 Setter들
    public String get_id() {
        return _id;
    }

    public void set_id(String _id) {
        this._id = _id;
    }

    public String getIndustry_major_cate() {
        return industry_major_cate;
    }

    public void setIndustry_major_cate(String industry_major_cate) {
        this.industry_major_cate = industry_major_cate;
    }

    public String getIndustry_middle_cate() {
        return industry_middle_cate;
    }

    public void setIndustry_middle_cate(String industry_middle_cate) {
        this.industry_middle_cate = industry_middle_cate;
    }

    public double getConsumption_amount() {
        return consumption_amount;
    }

    public void setConsumption_amount(double consumption_amount) {
        this.consumption_amount = consumption_amount;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public int getStd_year() {
        return std_year;
    }

    public void setStd_year(int std_year) {
        this.std_year = std_year;
    }
}
