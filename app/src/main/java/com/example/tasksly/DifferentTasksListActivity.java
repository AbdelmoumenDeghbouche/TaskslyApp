package com.example.tasksly;

import static android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS;

import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.os.Build;
import android.os.Bundle;
import android.view.WindowInsetsController;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

public class DifferentTasksListActivity extends AppCompatActivity {
    private RecyclerView recycler_view_of_private_tasks;
    private Task_list_adapter adapter;
    private TextView txt_name_of_the_activity;
    private ArrayList<Task_Model> tasks_list;
    NetworkChangeListener networkChangeListener = new NetworkChangeListener();


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getSupportActionBar().hide();
        this.getWindow().setStatusBarColor(this.getColor(R.color.white));

        // to change the color of the icons in status bar to dark
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(APPEARANCE_LIGHT_STATUS_BARS, APPEARANCE_LIGHT_STATUS_BARS);
        }
        // to change the color of the icons in the navigation bar to dark
        getWindow().setNavigationBarColor(ContextCompat.getColor(DifferentTasksListActivity.this, R.color.white)); //setting bar color
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS, WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS);
        }
        Intent intent = getIntent();

        setContentView(R.layout.activity_different_tasks_list);
        txt_name_of_the_activity = findViewById(R.id.txt_private_task_title);

        recycler_view_of_private_tasks = findViewById(R.id.recycler_view_of_private_tasks);

        adapter = new Task_list_adapter(getApplicationContext());
        recycler_view_of_private_tasks.setAdapter(adapter);
        LinearLayoutManager linearLayoutManager = new LinearLayoutManager(getApplicationContext(), LinearLayoutManager.VERTICAL, false);
        recycler_view_of_private_tasks.setLayoutManager(linearLayoutManager);
        Utils.initTasksList();
        tasks_list = new ArrayList<>();
        if (intent != null) {
            if (intent.getStringExtra("NameOfActivity").equals("Private Tasks")) {
                tasks_list = Utils.category_map.get("sqddqsdjqsoidjqsjdsoqidjoqsidjqsoi");

                txt_name_of_the_activity.setText(intent.getStringExtra("NameOfActivity"));



            }
            if (intent.getStringExtra("NameOfActivity").equals("Completed Tasks")) {
                tasks_list =Utils.return_only_completed_tasks(Utils.getTasks_list());
                txt_name_of_the_activity.setText(intent.getStringExtra("NameOfActivity"));

            }
            if (intent.getStringExtra("NameOfActivity").equals("All Tasks")){
                tasks_list =Utils.getTasks_list();
                txt_name_of_the_activity.setText(intent.getStringExtra("NameOfActivity"));


            }



            }

        adapter.setTasks(tasks_list);


    }
    @Override
    protected void onStart() {
        IntentFilter intentFilter = new IntentFilter(ConnectivityManager.CONNECTIVITY_ACTION);
        registerReceiver(networkChangeListener,intentFilter);
        super.onStart();

    }

    @Override
    protected void onStop() {

        unregisterReceiver(networkChangeListener);
        super.onStop();
    }
}