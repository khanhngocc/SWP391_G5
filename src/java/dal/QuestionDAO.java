/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Date;
import java.util.ArrayList;
import model.Question;

/**
 *
 * @author INSPIRON 15-7559 fixed: 22/10/2021
 */
public class QuestionDAO extends MyDAO {

    public int getNewRowCount(String date) {
        int no = 0;
        xSql = "SELECT COUNT(*) FROM question where createdDate = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, date);
            rs = ps.executeQuery();
            if (rs.next()) {
                no = rs.getInt(1);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return no;
    }

    public int getAllRowCountInRange(String date) {
        int no = 0;
        xSql = "select COUNT(*) from question where createdDate between (select min(createdDate) from question) and ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, date);

            rs = ps.executeQuery();
            if (rs.next()) {
                no = rs.getInt(1);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return no;
    }

    public void insertQuestion(Question q) {
        xSql = "INSERT INTO Question\n"
                + "           (content\n"
                + "           ,category\n"
                + "           ,status\n"
                + "           ,level\n"
                + "           ,option1\n"
                + "           ,option2\n"
                + "           ,option3\n"
                + "           ,option4\n"
                + "           ,optionCorrect\n"
                + "           ,subject\n"
                + "           ,createdDate)\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?,?,?)\n";

        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, q.getContent());
            ps.setString(2, q.getCategory());
            ps.setString(3, q.getStatus());
            ps.setString(4, q.getLevel());
            ps.setString(5, q.getOption1());
            ps.setString(6, q.getOption2());
            ps.setString(7, q.getOption3());
            ps.setString(8, q.getOption4());
            ps.setString(9, q.getOption_correct());
            ps.setString(10, q.getSubject());
            ps.setDate(11, q.getCreate_date());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteQuestion(int id) {
        xSql = "delete from Question where id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Question getQuestionById(String id) {
        Question x = null;
        xSql = "select * from Question where id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                x = new Question(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getDate(12));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }

    public void EditQuestion(Question x) {
        xSql = "UPDATE Question\n"
                + "   SET content = ?\n"
                + "      ,category = ?\n"
                + "      ,status = ?\n"
                + "      ,level = ?\n"
                + "      ,option1 = ?\n"
                + "      ,option2 = ?\n"
                + "      ,option3 = ?\n"
                + "      ,option4 = ?\n"
                + "      ,optionCorrect = ?\n"
                + "      ,subject = ?\n"
                + "      ,createdDate = ?\n"
                + " WHERE id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, x.getContent());
            ps.setString(2, x.getCategory());
            ps.setString(3, x.getStatus());
            ps.setString(4, x.getLevel());
            ps.setString(5, x.getOption1());
            ps.setString(6, x.getOption2());
            ps.setString(7, x.getOption3());
            ps.setString(8, x.getOption4());
            ps.setString(9, x.getOption_correct());
            ps.setString(10, x.getSubject());
            ps.setDate(11, x.getCreate_date());
            ps.setInt(12, x.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getRowCount() {
        int no = 0;
        xSql = "SELECT COUNT(*) FROM question";
        try {
            ps = con.prepareStatement(xSql);

            rs = ps.executeQuery();
            if (rs.next()) {
                no = rs.getInt(1);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return no;
    }

    public int getRowCountForSearch(String searchName, String subject, String category, String level, String status) {
        int no = 0;

        xSql = "select COUNT(*) from question\n"
                + "where\n"
                + "content like ?\n"
                + "and\n"
                + "subject like ?\n"
                + "and\n"
                + "category like ?\n"
                + "and \n"
                + "level like ?\n"
                + "and\n"
                + "status like ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, "%" + searchName + "%");
            ps.setString(2, "%" + subject + "%");
            ps.setString(3, "%" + category + "%");
            ps.setString(4, "%" + level + "%");
            ps.setString(5, "%" + status + "%");
            rs = ps.executeQuery();
            if (rs.next()) {
                no = rs.getInt(1);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return no;
    }

    public ArrayList<Question> listAllQuestions(int pageIndex, int pageSize, String searchName, String subject, String category, String level, String status) {

        int numberOfRecord = (pageIndex - 1) * pageSize;
        ArrayList<Question> list = new ArrayList<>();
        xSql = "select * from question\n"
                + "where\n"
                + "content like ?\n"
                + "and\n"
                + "subject like ?\n"
                + "and\n"
                + "category like ?\n"
                + "and \n"
                + "level like ?\n"
                + "and\n"
                + "status like ?\n"
                + "order by id desc\n"
                + "limit ?,?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, "%" + searchName + "%");
            ps.setString(2, "%" + subject + "%");
            ps.setString(3, "%" + category + "%");
            ps.setString(4, "%" + level + "%");
            ps.setString(5, "%" + status + "%");
            ps.setInt(6, numberOfRecord);
            ps.setInt(7, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Question(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getDate(12)));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ArrayList<Question> getQuestionInQuiz(int id) {
        ArrayList<Question> x = new ArrayList<>();
        xSql = "select * from Question q inner join Quizzes_Question qq on (q.id = qq.question_id) where qq.quiz_id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                x.add(new Question(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getDate(12)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }

    public ArrayList<Question> getQuestionByQuizId(int id) {
        ArrayList<Question> x = new ArrayList<>();
        xSql = "select * from Quizzes_Question a inner join Question b on(a.question_id = b.id) inner join Quizzes c on(a.quiz_id = c.id) where c.id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                x.add(new Question(rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8),
                        rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getDate(15)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }

    public ArrayList<Question> getQuestionsBySubject(String subject) {
        ArrayList<Question> x = new ArrayList<>();
        xSql = "select * from Question where subject = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, subject);
            rs = ps.executeQuery();
            while (rs.next()) {
                x.add(new Question(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getDate(12)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }

    public ArrayList<Question> getActiveQuestionsBySubject(String subject) {
        ArrayList<Question> x = new ArrayList<>();
        xSql = "select * from Question where subject = ? and status = 'Active'";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, subject);
            rs = ps.executeQuery();
            while (rs.next()) {
                x.add(new Question(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getDate(12)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }

    public void changeQuestionStatus(Integer id, String status) {
        xSql = "Update question set status = ? where id= ? ";
        try {
            ps = con.prepareStatement(xSql);

            ps.setString(1, status);

            ps.setInt(2, id);

            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean isEmptyAnswer(int question_id, int no_ans) {

        xSql = "SELECT option? FROM question where id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, no_ans);
            ps.setInt(2, question_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                if (rs.getString(1) == null) {
                    return true;
                }
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public int getNumberOfAnswer(int question_id) {

        int num = 2;

        for (int i = 3; i <= 4; i++) {
            if (isEmptyAnswer(question_id, i) == false) {
                num++;
            }
        }

        return num;

    }

}
