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
public class Answer_History {
    private int id;
    private int history_id;
    private int question_id;
    private String answer;

    public Answer_History() {
    }

    public Answer_History(int id, int history_id, int question_id, String answer) {
        this.id = id;
        this.history_id = history_id;
        this.question_id = question_id;
        this.answer = answer;
    }

    public Answer_History(int history_id, int question_id, String answer) {
        this.history_id = history_id;
        this.question_id = question_id;
        this.answer = answer;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getHistory_id() {
        return history_id;
    }

    public void setHistory_id(int history_id) {
        this.history_id = history_id;
    }

    public int getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(int question_id) {
        this.question_id = question_id;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
    
}
