package com.example.tasksly.Module;

public class welcom_activity_Model {
    int img ;
    String maintext , secondtext ;

    public welcom_activity_Model(int img, String maintext, String secondtext) {
        this.img = img;
        this.maintext = maintext;
        this.secondtext = secondtext;
    }

    public int getImg() {
        return img;
    }

    public void setImg(int img) {
        this.img = img;
    }

    public String getMaintext() {
        return maintext;
    }

    public void setMaintext(String maintext) {
        this.maintext = maintext;
    }

    public String getSecondtext() {
        return secondtext;
    }

    public void setSecondtext(String secondtext) {
        this.secondtext = secondtext;
    }
}
