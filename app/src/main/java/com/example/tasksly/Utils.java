package com.example.tasksly;

import static android.content.ContentValues.TAG;

import android.app.Activity;
import android.net.Uri;
import android.os.Build;
import android.util.Log;
import android.view.inputmethod.InputMethodManager;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.RequiresApi;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

import java.net.MalformedURLException;
import java.net.URL;
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
    public static HashMap<String, ArrayList<Task_Model>> category_map = new HashMap<>();
    public static ArrayList<welcom_activity_Model> Welcomlist;


    public static ArrayList<welcom_activity_Model> getWelcomPageList() {
        Welcomlist = new ArrayList<>();
        Welcomlist.add(new welcom_activity_Model(R.drawable.welcom2, "Welcome to Tasksly", "Create an account to save all schedules\n and  access them from"));
        Welcomlist.add(new welcom_activity_Model(R.drawable.welcom1, "Organize your works", "Let’s organize your works with priority and \n do everything without stress."));
        return Welcomlist;
    }


    public static void initCategories() {
        if (null == categories_list) {
            categories_list = new ArrayList<>();
        }
        if (categories_list.isEmpty()) {
            Category_Model General = new Category_Model("General");

            Category_Model sport = new Category_Model("Sport");
            Category_Model education = new Category_Model("Education");
            Category_Model Health = new Category_Model("Health");
            Category_Model Gaming = new Category_Model("Gaming");
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

    public static void initTasksList() {
        if (null == tasks_list) {
            tasks_list = new ArrayList<>();
        }
        if (tasks_list.isEmpty()) {
            Category_Model general = new Category_Model("General");

            Task_Model first_task = new Task_Model("Meet Mr Khaldi", "14:00", String.valueOf(Calendar.DATE),
                    //just test i tried to get first category from categories list (General)
                    general, "All illustration design should be handover to Smith today for review.", false);
            Task_Model sec_task = new Task_Model("Meet Mr Khaldi", "14:00", String.valueOf(Calendar.DATE), general, "All illustration design should be handover to Smith today for review.", true);
            Task_Model third_task = new Task_Model("Meet Mr Khaldi", "14:00", String.valueOf(Calendar.DATE), general, "All illustration design should be handover to Smith today for review.", true);
            Task_Model fourth_task = new Task_Model("Meet Mr Khaldi", "14:00", String.valueOf(Calendar.DATE), general, "All illustration design should be handover to Smith today for review.", true);
            Task_Model five_task = new Task_Model("Meetooo Mr Khaldi", "14:00", String.valueOf(Calendar.DATE), general, "All illustration design should be handover to Smith today for review.", true);
            tasks_list.add(first_task);
            tasks_list.add(sec_task);
            tasks_list.add(third_task);
            tasks_list.add(fourth_task);
            tasks_list.add(five_task);
            category_map.put("General", tasks_list);
            category_map.put("Education", new ArrayList<>());
            category_map.put("Health", new ArrayList<>());
            category_map.put("Gaming", new ArrayList<>());
            category_map.put("Sport", new ArrayList<>());
            category_map.put("Personal", new ArrayList<>());


        }

    }

    public static ArrayList<Task_Model> getTasks_list() {

        return tasks_list;
    }

    public static boolean categoryIsExist(String s) {
        //check if category already exists in the hashmap
        if (category_map != null) {
            for (String i : category_map.keySet()) {
                if (i.equals(s)) {
                    return true;
                }

            }
        }
        return false;
    }


    @RequiresApi(api = Build.VERSION_CODES.N)
    public static void AddTaskByTaskModel(Task_Model task_model) {
        if (tasks_list != null) {
            Log.d(TAG, "AddTaskByTaskModel: Niccce");
            Category_Model category_model = task_model.getCategory();
            if (category_model != null) {
                Log.d(TAG, "AddTaskByTaskModel: Niccce2");

                String category_name = category_model.getCategory_name();
                if (categoryIsExist(category_name)) {
                    //we update the tasks list corresponding to the category
                    ArrayList<Task_Model> r = category_map.get(category_name);
                    if (r == null) {
                        r = new ArrayList<>();
                    }
                    r.add(task_model);
                    category_map.replace(category_name, r);
                } else {
                    //we make a new tasks list for the category
                    ArrayList<Task_Model> r = new ArrayList<>();
                    r.add(task_model);
                    category_map.put(category_name, r);
                }
            }
            tasks_list.add(task_model);

        }
    }

    // hide the keyboard when we clicks any where(better user experience )
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

    //this function is for getting the next day's date used in ocrextraction's ocrrequest call
    @RequiresApi(api = Build.VERSION_CODES.O)
    public static String nextDayDate(String day) {
        LocalDate dt = LocalDate.now();

        return String.valueOf(dt.with(TemporalAdjusters.next(DayOfWeek.of(DayOfWeek.valueOf(day.toUpperCase()).getValue()))));

    }
    public static URL ParseUrl(Uri imageUri){
        String url = String.valueOf(imageUri);

        DatabaseReference root = FirebaseDatabase.getInstance().getReference();
        root.child("OCRImages").push().setValue(url).addOnCompleteListener(new OnCompleteListener<Void>() {
            @Override
            public void onComplete(@NonNull Task<Void> task) {
                if (task.isSuccessful()){
                    Toast.makeText(context, "Images added successfully !", Toast.LENGTH_SHORT).show();
                } else {
                    Toast.makeText(context, "Can't upload the image !"+task.getException().getMessage(), Toast.LENGTH_SHORT).show();
                }

            }
        });
        URL myUrl = null ;
        try {
            myUrl = new URL(url);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }
        return myUrl;
    }
    public static void OcrExtraction(String url) {
        OcrRequestAsync ocrRequestAsync = new OcrRequestAsync();
        ocrRequestAsync.execute(url);


    }



}
