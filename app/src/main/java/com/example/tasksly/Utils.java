package com.example.tasksly;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;

import androidx.annotation.RequiresApi;

import java.net.URI;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;


// the 2 first functions are for the categories arraylist

public class Utils {
    public static ArrayList<Category_Model> categories_list;
    public static ArrayList<Task_Model> tasks_list;
    public static HashMap<String,ArrayList<Task_Model>> category_map = new HashMap<>();

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
    public static boolean categoryIsExist(String s){
        //check if category already exists in the hashmap
        if (category_map!=null){
        for (String i :category_map.keySet()){
            if (i.equals(s)){
                return true;
            }

        }}
        return false;
    }
    @RequiresApi(api = Build.VERSION_CODES.N)
    public static void AddTaskByTaskModel(Task_Model task_model){
        if (tasks_list != null){
            Category_Model category_model=task_model.getCategory();
            if (category_model!=null){
                String category_name=category_model.getCategory_name();
                if (categoryIsExist(category_name)){
                    //we update the tasks list corresponding to the category
                    ArrayList<Task_Model> r=category_map.get(category_name);
                    if (r==null){
                        r=new ArrayList<>();
                    }
                    r.add(task_model);
                    category_map.replace(category_name,r);
                }
                else{
                    //we make a new tasks list for the category
                    ArrayList<Task_Model> r =new ArrayList<>();
                    r.add(task_model);
                    category_map.put(category_name,r);
                }}
            tasks_list.add(task_model);

        }}
    //this function is for getting the next day's date used in ocrextraction's ocrrequest call
    @RequiresApi(api = Build.VERSION_CODES.O)
    public static String nextDayDate(String day){
        LocalDate dt = LocalDate.now();

        return String.valueOf(dt.with(TemporalAdjusters.next(DayOfWeek.of(DayOfWeek.valueOf( day.toUpperCase() ).getValue()))));

    }

    public static void OcrExtraction(String url){
    OcrRequestAsync ocrRequestAsync = new OcrRequestAsync();
    ocrRequestAsync.execute(url);

    }
    public static void hideSoftKeyboard(Activity activity) {
        InputMethodManager inputMethodManager =
                (InputMethodManager) activity.getSystemService(
                        Activity.INPUT_METHOD_SERVICE);
        if (inputMethodManager.isAcceptingText()) {
            inputMethodManager.hideSoftInputFromWindow(
                    activity.getCurrentFocus().getWindowToken(),
                    0
            );
        }
    }

}
