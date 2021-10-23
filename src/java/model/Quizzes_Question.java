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
public class Quizzes_Question {
    private int id;
    private int quiz_id;
    private int question_id;

    public Quizzes_Question() {
    }

    public Quizzes_Question(int id, int quiz_id, int question_id) {
        this.id = id;
        this.quiz_id = quiz_id;
        this.question_id = question_id;
    }

    public Quizzes_Question(int quiz_id, int question_id) {
        this.quiz_id = quiz_id;
        this.question_id = question_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuiz_id() {
        return quiz_id;
    }

    public void setQuiz_id(int quiz_id) {
        this.quiz_id = quiz_id;
    }

    public int getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(int question_id) {
        this.question_id = question_id;
    }
}
