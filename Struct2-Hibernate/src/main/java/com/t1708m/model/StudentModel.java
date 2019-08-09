package com.t1708m.model;

import com.t1708m.entity.Student;
import com.t1708m.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.ArrayList;
import java.util.List;

public class StudentModel {

    public boolean saveStudent(Student student){
        Transaction transaction =null;
        try(Session session = HibernateUtil.getSession()) {
            transaction = session.beginTransaction();
            session.saveOrUpdate(student);
            transaction.commit();
            return true;
        }catch (Exception ex){
            if(transaction!=null){
                transaction.rollback();
            }
            System.out.println("save student error,Ex: "+ex);
            return false;
        }
    }
    public List<Student> listStudent(){
        List<Student> list = new ArrayList<>();
        try(Session session = HibernateUtil.getSession()){
            list =session.createQuery("from Student ",Student.class).list();
            System.out.println("get list student success!!!");
        }catch (Exception ex){
            System.out.println("Cannot find student, Ex:"+ex);
        }
        return list;
    }
    public Student getStudentById(String id){
        Transaction transaction =null;
        try(Session session =HibernateUtil.getSession()) {
            transaction =session.beginTransaction();
            Student student = session.get(Student.class,id);
            transaction.commit();
            return student;
        }catch (Exception ex){
            if(transaction!=null){
                transaction.rollback();
            }
            System.out.println("cannot find student,Ex:"+ex);
            return null;
        }
    }
    public void deleteStudent(String id){
        Transaction transaction =null;
        try(Session session =HibernateUtil.getSession()) {
            transaction = session.beginTransaction();
            Student student = session.get(Student.class,id);
            if(student!=null){
                session.delete(student);
                System.out.println("delete success!!!");
            }
            transaction.commit();
        }catch (Exception ex){
            if(transaction!=null){
                transaction.rollback();
            }
            System.out.println("cannot delete student!!!!,Ex:"+ex);
        }
    }
}
