package com.example.tasksly;

import static android.content.ContentValues.TAG;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.net.Uri;
import android.os.Build;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;
import com.google.firebase.storage.FirebaseStorage;
import com.google.firebase.storage.StorageReference;
import com.google.firebase.storage.UploadTask;

import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;


// the 2 first functions are for the categories arraylist

public class Utils {
    public static final String COMPLETED_TASKS_KEY = "slqdlmùqssqllqdsldmqslmmlmslqd";
    public static ArrayList<Category_Model> categories_list;
    public static ArrayList<Task_Model> tasks_list, private_tasks, completed_tasks, planing_tasks;
    public static HashMap<String, ArrayList<Task_Model>> category_map = new HashMap<>();
    public static ArrayList<welcom_activity_Model> Welcomlist;
    public static Context context;
    public static Dialog add_task_dialogue;
    public static URL myUrl = null;
    public static String private_task_pin_code ="";
    public static int exists = 0;
    public  static  boolean task_uploaded ;



    public static int getIndexOfCategoryModelByCategoryName(String CategoryName) {
        for (int i = 0; i < categories_list.size(); i++) {
            if (categories_list.get(i).getCategory_name().equalsIgnoreCase(CategoryName)) {
                return i;
            }
        }
        return -1;

    }

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

            categories_list = GetAllCatgoriesFromFirebse();
        }

    }

    public static ArrayList<Category_Model> getCategories_list() {
        return categories_list;

    }


    // the 2 first functions are for the tasks arraylist

    public static void initTasksList() {
        if (null == private_tasks) {
            private_tasks = new ArrayList<>();
        }
        if (null == tasks_list) {
            tasks_list = new ArrayList<>();
        }
        if (null == completed_tasks) {
            completed_tasks = new ArrayList<>();
        }
        if (tasks_list.isEmpty()) {
            tasks_list = Utils.GetAllTasksFromFirebase();







//            Category_Model general = new Category_Model("General");
//            Category_Model Gaming = new Category_Model("Gaming");
//
//            Task_Model first_task = new Task_Model("Meet Mr Khaldi Completed 1", "14:00", String.valueOf(Calendar.DATE),
//                    //just test i tried to get first category from categories list (General)
//                    general, "All illustration design should be handover to Smith today for review.", false);
//            Task_Model sec_task = new Task_Model("Completed Task", "14:00", String.valueOf(Calendar.DATE), general, "All illustration design should be handover to Smith today for review.", false);
//            Task_Model third_task = new Task_Model("Meet Mr Khaldi", "14:00", String.valueOf(Calendar.DATE), general, "All illustration design should be handover to Smith today for review.", false);
//            Task_Model fourth_task = new Task_Model("Meet Mr Khaldi Completed", "14:00", String.valueOf(Calendar.DATE), general, "All illustration design should be handover to Smith today for review.", false);
//            fourth_task.setIs_finished(true);
//            first_task.setIs_finished(true);
//            sec_task.setIs_finished(true);
//            tasks_list.add(first_task);
//            tasks_list.add(sec_task);
//            tasks_list.add(third_task);
//            tasks_list.add(fourth_task);
//            private_tasks.add(first_task);
//            category_map.put("General", new ArrayList<>());
//            category_map.put("Education", new ArrayList<>());
//            category_map.put("Health", new ArrayList<>());
//            category_map.put("Gaming", new ArrayList<>());
//            category_map.put("Sport", new ArrayList<>());
//            category_map.put("Personal", new ArrayList<>());
//            category_map.put("sqddqsdjqsoidjqsjdsoqidjoqsidjqsoi", private_tasks);
//            category_map.put(COMPLETED_TASKS_KEY, completed_tasks);


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

    public static URL ParseUrl(Uri imageUri) {
        // this date and time variables are used just to create a different parent fir very child
        String date = new SimpleDateFormat("MM/dd/yyyy").format(Calendar.getInstance().getTime());
        String time = new SimpleDateFormat("HH:mm:ss a").format(Calendar.getInstance().getTime());
        StorageReference storage = FirebaseStorage.getInstance().getReference().child("OCRImages").child(date + "//" + time);
        storage.putFile(imageUri).addOnCompleteListener(new OnCompleteListener<UploadTask.TaskSnapshot>() {
            @Override
            public void onComplete(@NonNull Task<UploadTask.TaskSnapshot> task) {
                // which means that we have uploaded the image to the firebase
                // and now we are going to get our image uri as a string
                if (task.isSuccessful()) {
                    storage.getDownloadUrl().addOnSuccessListener(new OnSuccessListener<Uri>() {
                        @Override
                        public void onSuccess(Uri uri) {
                            // this uri makes us able to charge the image in the imageview every time ( its like url )
                            try {
                                Log.d(TAG, "onSuccess: ");
                                myUrl = new URL(uri.toString());
                            } catch (MalformedURLException e) {
                                e.printStackTrace();
                            }
                        }
                    });
                } else {
                    Toast.makeText(context, task.getException().getMessage(), Toast.LENGTH_SHORT).show();
                }
            }
        });
        return myUrl;
    }

    public static void OcrExtraction(String url) {
        OcrRequestAsync ocrRequestAsync = new OcrRequestAsync();
        ocrRequestAsync.execute(url);


    }

    public static void SettingKeyboard(Activity activity) {
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

    public static ArrayList<Task_Model> return_only_not_completed_tasks(ArrayList<Task_Model> task_modelArrayList) {
        ArrayList<Task_Model> task_modelArrayList1 = new ArrayList<>();
        for (int i = 0; i < task_modelArrayList.size(); i++) {
            if (!task_modelArrayList.get(i).isIs_finished()) {
                task_modelArrayList1.add(task_modelArrayList.get(i));


            }

        }
        return task_modelArrayList1;
    }
    public static ArrayList<Task_Model> return_only_completed_tasks(ArrayList<Task_Model> task_modelArrayList) {
        ArrayList<Task_Model> task_modelArrayList1 = new ArrayList<>();
        for (int i = 0; i < task_modelArrayList.size(); i++) {
            if (task_modelArrayList.get(i).isIs_finished()) {
                task_modelArrayList1.add(task_modelArrayList.get(i));


            }

        }
        return task_modelArrayList1;
    }

    // hiding the keyboard when we clicks any where ( better user experience )

    public static void setUpKeybaord(View view, Activity activity) {
        // Set up touch listener for non-text box views to hide keyboard.
        if (!(view instanceof EditText)) {
            view.setOnTouchListener(new View.OnTouchListener() {
                public boolean onTouch(View v, MotionEvent event) {
                    Utils.SettingKeyboard(activity);
                    return false;
                }
            });
        }
        //If a layout container, iterate over children and seed recursion.
        if (view instanceof ViewGroup) {
            for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) {
                View innerView = ((ViewGroup) view).getChildAt(i);
                setUpKeybaord(innerView, activity);
            }
        }
    }
    public static void AddTaskToFirebase(Task_Model task ){
        if (task != null){
            Category_Model category = task.getCategory();
            if (category != null){
                //if (categoryIsExist(category.getCategory_name())){
                    FirebaseDatabase.getInstance().getReference().child("Tasks").child(category.getCategory_name()).child(FirebaseAuth.getInstance().getCurrentUser().getUid()).push().setValue(task).addOnCompleteListener(new OnCompleteListener<Void>() {
                        @Override
                        public void onComplete(@NonNull Task<Void> task) {
                            if (task.isSuccessful()){
//                                Toast.makeText(contextt, "Your task has been saved successfully !", Toast.LENGTH_SHORT).show();
                                Add_task.dialog.dismiss();
                                task_uploaded = true;
                                Utils.tasks_list =Utils.GetAllTasksFromFirebase();


                            } else {
//                                Toast.makeText(contextt, task.getException().getMessage(), Toast.LENGTH_SHORT).show();
                                Add_task.dialog.dismiss();
                                task_uploaded =false;
                            }
                        }
                    });
//                } else {
//                    Toast.makeText(contextt, "No category with this name !", Toast.LENGTH_SHORT).show();
//                    Add_task.dialog.dismiss();
//                }
            } else {
//                Toast.makeText(contextt, "Please select a category !", Toast.LENGTH_SHORT).show();
                Add_task.dialog.dismiss();
            }
        } else {
//            Toast.makeText(contextt, "No task to add !", Toast.LENGTH_SHORT).show();
            Add_task.dialog.dismiss();
        }
    }

    public static ArrayList<Task_Model> GetAllTasksFromFirebase(){
        ArrayList<Task_Model> list = new ArrayList<>();
        FirebaseDatabase.getInstance().getReference().child("Tasks").addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(@NonNull DataSnapshot snapshot) {
                if (snapshot.exists()){
                    for (DataSnapshot category : snapshot.getChildren()){
                        FirebaseDatabase.getInstance().getReference().child("Tasks").child(category.getKey()).child(FirebaseAuth.getInstance().getCurrentUser().getUid()).addListenerForSingleValueEvent(new ValueEventListener() {
                            @Override
                            public void onDataChange(@NonNull DataSnapshot snapshot) {
                                if (snapshot.exists()){
                                    for (DataSnapshot task : snapshot.getChildren()){
                                        Task_Model UserTask = task.getValue(Task_Model.class);
                                        list.add(UserTask);
                                    }
                                }
                            }
                            @Override
                            public void onCancelled(@NonNull DatabaseError error) {
                            }
                        });
                    }
                }
            }
            @Override
            public void onCancelled(@NonNull DatabaseError error) {
            }
        });
        Log.d("Task name ",list.toString());
        return list ;
    }

    public static void AddCategoryToFirebase(Category_Model Newcategory,Context contexto){
        FirebaseDatabase.getInstance().getReference().child("Tasks").addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(@NonNull DataSnapshot snapshot) {
                for (DataSnapshot category : snapshot.getChildren()){
                    if (category.getKey().equals(Newcategory.getCategory_name())){
                        exists = 1 ;
                        break;
                    }
                }
                if (exists == 0) {
                    // there is no category like this , so we add it
                    FirebaseDatabase.getInstance().getReference().child("Tasks").child(Newcategory.getCategory_name()).setValue("initial").addOnCompleteListener(new OnCompleteListener<Void>() {
                        @Override
                        public void onComplete(@NonNull Task<Void> task) {
                            if (task.isSuccessful()){
                                Toast.makeText(contexto, "Category added successfully !", Toast.LENGTH_SHORT).show();
                                Home_Fragment.adapter.setCategories(GetAllCatgoriesFromFirebse());

                            }
                        }
                    });
                    // means that this element already exists in the firebase favorite list , so we don't add it
                } else {
                    exists = 0;
                    Toast.makeText(contexto, "Category already exists !", Toast.LENGTH_SHORT).show();
                }
            }

            @Override
            public void onCancelled(@NonNull DatabaseError error) {

            }
        });
    }

    public static ArrayList<Category_Model> GetAllCatgoriesFromFirebse(){
        ArrayList<Category_Model> list = new ArrayList<>() ;
        FirebaseDatabase.getInstance().getReference().child("Tasks").addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(@NonNull DataSnapshot snapshot) {
                for (DataSnapshot category : snapshot.getChildren()){
                    String name = category.getKey();
                    Category_Model model = new Category_Model(name);
                    list.add(model);
                    if (Home_Fragment.adapter !=null){
                        Home_Fragment.adapter.notifyDataSetChanged();

                    }
                    if (Add_task.adapter!= null){
                        Add_task.adapter.notifyDataSetChanged();
                    }
                }
                list.add(new Category_Model("add_category"));


            }
            @Override
            public void onCancelled(@NonNull DatabaseError error) {
            }
        });
        return list ;
    }
    public static ArrayList<Task_Model> GetTasksListOfSpecificCategory(String categoryName){
        ArrayList<Task_Model> task_models = new ArrayList<>();

        for (int i =0 ; i<tasks_list.size() ; i++ ){
            if (tasks_list.get(i).getCategory().getCategory_name().equals(categoryName)){
                task_models.add(tasks_list.get(i));
            }

        }
        return task_models;
    }
    public static void UpdateTask(Task_Model newtask ,Task_Model oldtask){
        FirebaseDatabase.getInstance().getReference().child("Tasks").child(oldtask.getCategory().getCategory_name()).child(FirebaseAuth.getInstance().getCurrentUser().getUid()).addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(@NonNull DataSnapshot snapshot) {
                if (snapshot.exists()){
                    for (DataSnapshot task : snapshot.getChildren()){
                        if (task.getValue(Task_Model.class).getDate().equals(oldtask.getDate()) && task.getValue(Task_Model.class).getTime().equals(oldtask.getTime())){
                            // means this is the task that we want to update so we update it
                            FirebaseDatabase.getInstance().getReference().child("Tasks").child(oldtask.getCategory().getCategory_name()).child(FirebaseAuth.getInstance().getCurrentUser().getUid()).child(task.getKey()).setValue(newtask).addOnCompleteListener(new OnCompleteListener<Void>() {
                                @Override
                                public void onComplete(@NonNull Task<Void> task) {
                                    if (task.isSuccessful()){
                                        Toast.makeText(context, "Task updated successfully !", Toast.LENGTH_SHORT).show();
                                    }else {
                                        Toast.makeText(context, task.getException().getMessage(), Toast.LENGTH_SHORT).show();
                                    }
                                }
                            });
                        }
                    }
                } else {
                    Toast.makeText(context, "No task found !", Toast.LENGTH_SHORT).show();
                }
            }
            @Override
            public void onCancelled(@NonNull DatabaseError error) {

            }
        });
    }

    public static void DeleteTask(Task_Model oldtask){
        FirebaseDatabase.getInstance().getReference().child("Tasks").child(oldtask.getCategory().getCategory_name()).child(FirebaseAuth.getInstance().getCurrentUser().getUid()).addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(@NonNull DataSnapshot snapshot) {
                if (snapshot.exists()){
                    for (DataSnapshot task : snapshot.getChildren()) {
                        if (task.getValue(Task_Model.class).getDate().equals(oldtask.getDate()) && task.getValue(Task_Model.class).getTime().equals(oldtask.getTime())) {
                            // means this is the task that we want to delete so we delete it
                            FirebaseDatabase.getInstance().getReference().child("Tasks").child(oldtask.getCategory().getCategory_name()).child(FirebaseAuth.getInstance().getCurrentUser().getUid()).child(task.getKey()).removeValue(new DatabaseReference.CompletionListener() {
                                @Override
                                public void onComplete(@Nullable DatabaseError error, @NonNull DatabaseReference ref) {
                                    Toast.makeText(context, "Task deleted successfully !", Toast.LENGTH_SHORT).show();
                                }
                            });
                        }
                    }
                } else {
                    Toast.makeText(context, "No task found !", Toast.LENGTH_SHORT).show();
                }
            }
            @Override
            public void onCancelled(@NonNull DatabaseError error) {

            }
        });
    }
}
