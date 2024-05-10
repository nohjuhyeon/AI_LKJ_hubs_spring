package com.yojulab.study_springboot.models;

public class DataTrendSearch {
    private String _id;
    private String region;
    private int std_year;
    private int std_month;
    private int std_year_month;
    private String tour_trend;
    private int num_mention;

    // Getters and Setters
    public String getId() {
        return _id;
    }

    public void setId(String _id) {
        this._id = _id;
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

    public String getTourTrend() {
        return tour_trend;
    }

    public void setTourTrend(String tour_trend) {
        this.tour_trend = tour_trend;
    }

    public int getNumMention() {
        return num_mention;
    }

    public void setNumMention(int num_mention) {
        this.num_mention = num_mention;
    }
}
