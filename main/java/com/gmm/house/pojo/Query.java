package com.gmm.house.pojo;

/**
 * 多条件查询实体
 */
public class Query {
    private String searchName;//标题
    private String houseType;//出租方式
    private Integer minPrice;//最低价格
    private Integer maxPrice;//最高价格
    private String orderByName;//排序条件

    public String getSearchName() {
        return searchName;
    }

    public void setSearchName(String searchName) {
        this.searchName = searchName;
    }

    public String getHouseType() {
        return houseType;
    }

    public void setHouseType(String houseType) {
        this.houseType = houseType;
    }



    public String getOrderByName() {
        return orderByName;
    }

    public void setOrderByName(String orderByName) {
        this.orderByName = orderByName;
    }

    public Integer getMinPrice() {
        return minPrice;
    }

    public void setMinPrice(Integer minPrice) {
        this.minPrice = minPrice;
    }

    public Integer getMaxPrice() {
        return maxPrice;
    }

    public void setMaxPrice(Integer maxPrice) {
        this.maxPrice = maxPrice;
    }

    @Override
    public String toString() {
        return "Query{" +
                "searchName='" + searchName + '\'' +
                ", houseType='" + houseType + '\'' +
                ", minPrice=" + minPrice +
                ", maxPrice=" + maxPrice +
                ", orderByName='" + orderByName + '\'' +
                '}';
    }
}
