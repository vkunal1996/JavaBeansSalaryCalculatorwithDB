/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myCalculation;
import java.sql.*;
/**
 *
 * @author vkunal1996
 */
public class Calculation1 
{
    private String name,designation;
    private int id;
    private double salary,hra,da ,ta;
    public double getTa() {
        return ta*(salary/100);
    }

    public void setTa(double ta) {
        this.ta = ta;
    }
    private String contact,email;
    private String myconnection;
    private double salarywithoutTDS;
    private String msg;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public double getHra() {
        return hra*(salary/100);
    }

    public void setHra(double hra) {
        this.hra = hra;
    }

    public double getDa() {
        return da*(salary/100);
    }

    public void setDa(double da) {
        this.da = da;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMyconnection() {
        return myconnection;
    }

    public void setMyconnection(String myconnection) {
        this.myconnection = myconnection;
    }

    public double getSalarywithoutTDS() {
        this.salarywithoutTDS=salary+(hra+da+ta)*(salary/100);
        return salarywithoutTDS;
    }

    public void setSalarywithoutTDS(double salarywithoutTDS) {
        this.salarywithoutTDS = salarywithoutTDS;
    }

    public String getMsg() {
        try
        {
            Connection cn;
            PreparedStatement st;
            ResultSet rs;
            String sql,url;
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            url="jdbc:sqlserver://localhost;instanceName=vkunal1996;databaseName=Salary;user=vkunal1996;password=12345";
            cn=DriverManager.getConnection(url);
            sql="select * from Details where Id=?";
            st=cn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            st.setInt(1,id);
            rs=st.executeQuery();
            rs.last();
                if(rs.getRow()==0)
                {
                    sql="Insert into Details values(?,?,?,?,?,?,?,?,?,?,?,?)";
                    st=cn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
                    st.setInt(1,id);
                    st.setString(2,name);
                    st.setString(4,String.valueOf(contact));
                    st.setString(3,designation);
                    st.setString(5,email);
                    st.setString(6,String.valueOf(salary));
                    st.setString(7,String.valueOf(hra));
                    st.setString(8,String.valueOf(ta));
                    st.setString(9,String.valueOf(da));
                    st.setString(10,"Nil");
                    st.setString(11,"Nil");
                    st.setString(12,String.valueOf(salarywithoutTDS));
                    st.executeUpdate();
                    msg="Data Inserted Succesfully";
                }
                    else
                {
                    msg="User with Id = "+id+" already Exists ";
                }
                cn.close();
        }catch(Exception e){}
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

}
