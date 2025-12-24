package ProfileBean;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Hp V
 */
public class ProfileBean {
    private int studentId;
    private String name;
    private String program; 
    private String email; 
    private String hobbies; 
    private String intro;
    
    
    public int getStudentID(){return studentId;}
    public String getName(){return name;}
    public String getProgram(){return program;}
    public String getEmail(){return email;}
    public String getHobbies(){return hobbies;}
    public String getIntro(){return intro;}
    
    public void setStudentID(int id){ studentId = id;}
    public void setName(String n){ name = n;}
    public void setProgram(String p){ program = p;}
    public void setEmail(String e){ email = e;}
    public void setHobbies(String h){hobbies = h;}
    public void setIntro(String i){intro = i;}
    
}
