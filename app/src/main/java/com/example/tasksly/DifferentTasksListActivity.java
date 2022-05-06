package com.example.tasksly;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;

import com.example.tasksly.Category_Model;
import com.example.tasksly.R;
import com.example.tasksly.Task_Model;
import com.example.tasksly.Task_list_adapter;
import com.example.tasksly.Utils;

import java.util.ArrayList;

public class DifferentTasksListActivity extends AppCompatActivity {
    private RecyclerView recycler_view_of_private_tasks;
    private Task_list_adapter adapter;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getSupportActionBar().hide();
        setContentView(R.layout.activity_different_tasks_list);
        initComponents();
        adapter = new Task_list_adapter(getApplicationContext());
        recycler_view_of_private_tasks.setAdapter(adapter);
        LinearLayoutManager linearLayoutManager = new LinearLayoutManager(getApplicationContext(),LinearLayoutManager.VERTICAL,false);
        recycler_view_of_private_tasks.setLayoutManager(linearLayoutManager);
        Utils.initTasksList();
        ArrayList<Task_Model> tasks_list = Utils.getTasks_list();
        adapter.setTasks(tasks_list);



    }

    private void initComponents() {
        recycler_view_of_private_tasks = findViewById(R.id.recycler_view_of_private_tasks);


    }
}