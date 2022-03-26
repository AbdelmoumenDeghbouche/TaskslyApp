package com.example.tasksly;

import android.app.Dialog;
import android.content.Context;
import android.view.View;
import android.view.ViewGroup;

import java.util.ArrayList;
import java.util.Calendar;



// the 2 first functions are for the categories arraylist

public class Utils {
    public static ArrayList<Category_Model> categories_list;
    public static ArrayList<Task_Model> tasks_list;


    public static void initCategories(){
        if (null== categories_list){
            categories_list=new ArrayList<>();
        }
        if (categories_list.isEmpty()){
            Category_Model sport = new Category_Model("Sport");
            Category_Model education = new Category_Model("Education");
            Category_Model Health = new Category_Model("Health");
            Category_Model Gaming = new Category_Model("Gaming");
            Category_Model General = new Category_Model("General");
            Category_Model personal = new Category_Model("Personal");
            Category_Model add_category = new Category_Model("add_category");
            categories_list.add(General);
            categories_list.add(personal);
            categories_list.add(sport);
            categories_list.add(education);
            categories_list.add(Health);
            categories_list.add(Gaming);
            categories_list.add(add_category);
        }

    }

    public static ArrayList<Category_Model> getCategories_list() {
        return categories_list;

    }


    // the 2 first functions are for the tasks arraylist

    public static void initTasksList(){
        if (null == tasks_list){
            tasks_list = new ArrayList<>();
        }
        if (tasks_list.isEmpty()) {
            Category_Model sport = new Category_Model("Sport");

            Task_Model first_task = new Task_Model("Meet Mr Khaldi","14:00", String.valueOf(Calendar.DATE),
                    //just test i tried to get first category from categories list (General)
                    sport, "All illustration design should be handover to Smith today for review.",false);
            Task_Model sec_task = new Task_Model("Meet Mr Khaldi","14:00", String.valueOf(Calendar.DATE),sport,"All illustration design should be handover to Smith today for review.",true);
            Task_Model third_task = new Task_Model("Meet Mr Khaldi","14:00", String.valueOf(Calendar.DATE),sport,"All illustration design should be handover to Smith today for review.",true);
            Task_Model fourth_task = new Task_Model("Meet Mr Khaldi","14:00", String.valueOf(Calendar.DATE),sport,"All illustration design should be handover to Smith today for review.",true);
            Task_Model five_task = new Task_Model("Meet Mr Khaldi","14:00", String.valueOf(Calendar.DATE),sport,"All illustration design should be handover to Smith today for review.",true);
            tasks_list.add(first_task);
            tasks_list.add(sec_task);
            tasks_list.add(third_task);
            tasks_list.add(fourth_task);
            tasks_list.add(five_task);
        }

    }

    public static ArrayList<Task_Model> getTasks_list() {

        return tasks_list;
    }
    public static void AddTaskByTaskModel(Task_Model task_model){
        if (tasks_list != null){
            tasks_list.add(task_model);
        }
    }

}
