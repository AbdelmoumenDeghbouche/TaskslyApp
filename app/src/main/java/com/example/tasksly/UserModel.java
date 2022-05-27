package com.example.tasksly;

public class UserModel {
    private String name , email , password , image ;
    private int phonenumber ;
    boolean is_memeber ;

    public UserModel(String name, String email, String password, int phonenumber , String image,boolean is_memeber) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.phonenumber = phonenumber;
        this.image = image ;
        this.is_memeber = is_memeber ;
    }

    public boolean isIs_memeber() {
        return is_memeber;
    }

    public void setIs_memeber(boolean is_memeber) {
        this.is_memeber = is_memeber;
    }

    public UserModel() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(int phonenumber) {
        this.phonenumber = phonenumber;
    }

    public void setImage(String image) {
            this.image = image;
    }

    public String getImage() {
        return image;
    }
}
