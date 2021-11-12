/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author dell
 */
public class DataTrend {
    
    private String date;
    private int statisticFreeTest;
    private int statisticUserPractice;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getStatisticFreeTest() {
        return statisticFreeTest;
    }

    public void setStatisticFreeTest(int statisticFreeTest) {
        this.statisticFreeTest = statisticFreeTest;
    }

    public int getStatisticUserPractice() {
        return statisticUserPractice;
    }

    public void setStatisticUserPractice(int statisticUserPractice) {
        this.statisticUserPractice = statisticUserPractice;
    }
    
    
}
