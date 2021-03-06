package com.example.tasksly;

import android.os.Parcel;
import android.os.Parcelable;

public class Task_Model implements Parcelable {
    private String task_title;
    private String time;
    private String date;
    private Category_Model category;
    private boolean is_finished, is_notified;
    private String description;

    public Task_Model(String task_title, String time, String date, Category_Model category, String description, Boolean is_notified) {
        this.task_title = task_title;
        this.time = time;
        this.date = date;
        this.is_notified = is_notified;
        this.category = category;
        this.is_finished = false;
        this.description = description;
    }

    protected Task_Model(Parcel in) {
        task_title = in.readString();
        time = in.readString();
        date = in.readString();
        is_finished = in.readByte() != 0;
        is_notified = in.readByte() != 0;
        description = in.readString();
    }

    public static final Creator<Task_Model> CREATOR = new Creator<Task_Model>() {
        @Override
        public Task_Model createFromParcel(Parcel in) {
            return new Task_Model(in);
        }

        @Override
        public Task_Model[] newArray(int size) {
            return new Task_Model[size];
        }
    };

    public String getTask_title() {
        return task_title;
    }

    public void setTask_title(String task_title) {
        this.task_title = task_title;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Category_Model getCategory() {
        return category;
    }

    public void setCategory(Category_Model category) {
        this.category = category;
    }

    public boolean isIs_finished() {
        return is_finished;
    }

    public void setIs_finished(boolean is_finished) {
        this.is_finished = is_finished;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Task_Model{" +
                "task_title='" + task_title + '\'' +
                ", time='" + time + '\'' +
                ", date='" + date + '\'' +
                ", category=" + category +
                ", is_finished=" + is_finished +
                ", description='" + description + '\'' +
                '}';
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(task_title);
        dest.writeString(time);
        dest.writeString(date);
        dest.writeByte((byte) (is_finished ? 1 : 0));
        dest.writeByte((byte) (is_notified ? 1 : 0));
        dest.writeString(description);
    }
}
