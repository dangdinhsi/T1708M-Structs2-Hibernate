package com.t1708m.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.t1708m.entity.Student;
import com.t1708m.model.StudentModel;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class StudentAction extends ActionSupport {

    private Student student = new Student();
    private StudentModel model = new StudentModel();
    private String message ="";
    private String errormessage="";
    private List<Student> list = new ArrayList<>();
    // getter and setter

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public StudentModel getModel() {
        return model;
    }

    public void setModel(StudentModel model) {
        this.model = model;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getErrormessage() {
        return errormessage;
    }

    public void setErrormessage(String errormessage) {
        this.errormessage = errormessage;
    }

    public List<Student> getList() {
        return list;
    }

    public void setList(List<Student> list) {
        this.list = list;
    }

    // end Getter&Setter

    public String getFormCreateStudent(){
        this.student = new Student();
        return INPUT;
    }
    public String saveNewStudent() throws IOException {
        model.saveStudent(student);
        System.out.println("save new student success!!!!");
        return SUCCESS;
    }

    public String listStudent(){
        list=model.listStudent();
        return SUCCESS;
    }

    public String deleteStudent(){
        HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
        String id = request.getParameter("id");
        model.deleteStudent(id);
        return SUCCESS;
    }


    public String getInformation(){
        HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
        String id = request.getParameter("id");
        if(model.getStudentById(id)!=null){
            Student existStudent = model.getStudentById(id);
            student.setRollNumber(existStudent.getRollNumber());
            student.setName(existStudent.getName());
            student.setEmail(existStudent.getEmail());
            return SUCCESS;
        }
        return INPUT;
    }

    public String getInformationToEdit(){
        HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
        String id = request.getParameter("id");

        if(model.getStudentById(id)!=null){
            Student existStudent = model.getStudentById(id);
            student.setRollNumber(existStudent.getRollNumber()); // lấy ra rollNumber sang form edit.
            student.setName("");    //để name và email ="".
            student.setEmail("");
            return SUCCESS;
        }
       return INPUT;
    }
    public String updateStudent(){
        student.setName(student.getName());
        student.setEmail(student.getEmail());
        boolean status =model.saveStudent(student);
        if(status){
            setMessage("update student with RollNumber="+student.getRollNumber()+" success!!!");
            return SUCCESS;
        }else {
            setErrormessage("update error!!!!!");
            return INPUT;
        }

    }
}
