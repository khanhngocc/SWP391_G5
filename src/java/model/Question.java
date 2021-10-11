/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Admin
 */
public class Question {
    private int id;
    private String content;
    private String category;
    private String status;
    private int level;
    private int quiz_id;
    private String option1;
    private String option2;
    private String option3;
    private String option4;
    private String option_correct;

    public Question() {
    }

    public Question(String content, String category, String status, int level, int quiz_id, String option1, String option2, String option3, String option4, String option_correct) {
        this.content = content;
        this.category = category;
        this.status = status;
        this.level = level;
        this.quiz_id = quiz_id;
        this.option1 = option1;
        this.option2 = option2;
        this.option3 = option3;
        this.option4 = option4;
        this.option_correct = option_correct;
    }

    public Question(int id, String content, String category, String status, int level, int quiz_id, String option1, String option2, String option3, String option4, String option_correct) {
        this.id = id;
        this.content = content;
        this.category = category;
        this.status = status;
        this.level = level;
        this.quiz_id = quiz_id;
        this.option1 = option1;
        this.option2 = option2;
        this.option3 = option3;
        this.option4 = option4;
        this.option_correct = option_correct;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public int getQuiz_id() {
        return quiz_id;
    }

    public void setQuiz_id(int quiz_id) {
        this.quiz_id = quiz_id;
    }

    public String getOption1() {
        return option1;
    }

    public void setOption1(String option1) {
        this.option1 = option1;
    }

    public String getOption2() {
        return option2;
    }

    public void setOption2(String option2) {
        this.option2 = option2;
    }

    public String getOption3() {
        return option3;
    }

    public void setOption3(String option3) {
        this.option3 = option3;
    }

    public String getOption4() {
        return option4;
    }

    public void setOption4(String option4) {
        this.option4 = option4;
    }

    public String getOption_correct() {
        return option_correct;
    }

    public void setOption_correct(String option_correct) {
        this.option_correct = option_correct;
    }

}
