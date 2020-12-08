package com.ngl.designer.modules.pojo;

import java.util.Date;

public class ProjectEx extends ProjectBase {
    //    base
    private String view;
    private Integer provinceId;
    private Integer cityId;
    private Integer countyId;
    private String detailedAd;
    private Date startTime;
    private Date endTime;
    private String principalId;
    private String buildToUnitId;
    //    general
    private Integer level;
    private Float totalArea;
    private Float overArea;
    private Float underArea;
    private Float totalHeight;
    private String makeBy;
    private Float totalIM;
    private Float supervisionCost;
    private String scale;

    public String getView() {
        return view;
    }

    public void setView(String view) {
        this.view = view;
    }

    public Integer getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(Integer provinceId) {
        this.provinceId = provinceId;
    }

    public Integer getCityId() {
        return cityId;
    }

    public void setCityId(Integer cityId) {
        this.cityId = cityId;
    }

    public Integer getCountyId() {
        return countyId;
    }

    public void setCountyId(Integer countyId) {
        this.countyId = countyId;
    }

    public String getDetailedAd() {
        return detailedAd;
    }

    public void setDetailedAd(String detailedAd) {
        this.detailedAd = detailedAd;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getPrincipalId() {
        return principalId;
    }

    public void setPrincipalId(String principalId) {
        this.principalId = principalId;
    }

    public String getBuildToUnitId() {
        return buildToUnitId;
    }

    public void setBuildToUnitId(String buildToUnitId) {
        this.buildToUnitId = buildToUnitId;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Float getTotalArea() {
        return totalArea;
    }

    public void setTotalArea(Float totalArea) {
        this.totalArea = totalArea;
    }

    public Float getOverArea() {
        return overArea;
    }

    public void setOverArea(Float overArea) {
        this.overArea = overArea;
    }

    public Float getUnderArea() {
        return underArea;
    }

    public void setUnderArea(Float underArea) {
        this.underArea = underArea;
    }

    public Float getTotalHeight() {
        return totalHeight;
    }

    public void setTotalHeight(Float totalHeight) {
        this.totalHeight = totalHeight;
    }

    public String getMakeBy() {
        return makeBy;
    }

    public void setMakeBy(String makeBy) {
        this.makeBy = makeBy;
    }

    public Float getTotalIM() {
        return totalIM;
    }

    public void setTotalIM(Float totalIM) {
        this.totalIM = totalIM;
    }

    public Float getSupervisionCost() {
        return supervisionCost;
    }

    public void setSupervisionCost(Float supervisionCost) {
        this.supervisionCost = supervisionCost;
    }

    public String getScale() {
        return scale;
    }

    public void setScale(String scale) {
        this.scale = scale;
    }
}
