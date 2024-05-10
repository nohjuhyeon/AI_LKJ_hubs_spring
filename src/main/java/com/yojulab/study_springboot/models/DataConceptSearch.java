package com.yojulab.study_springboot.models;

public class DataConceptSearch {
    private String _id;
    private String destination_type;
    private int destination_search;
    private String region;
    private int std_year;
    private int std_month;
    private int std_year_month;

    // Getters and Setters
    public String getId() {
        return _id;
    }

    public void setId(String _id) {
        this._id = _id;
    }

    public String getDestinationType() {
        return destination_type;
    }

    public void setDestinationType(String destination_type) {
        this.destination_type = destination_type;
    }

    public int getDestinationSearch() {
        return destination_search;
    }

    public void setDestinationSearch(int destination_search) {
        this.destination_search = destination_search;
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
}
