package com.example.tasksly.View;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.tasksly.Controller.Task_list_adapter;
import com.example.tasksly.Module.Task_Model;
import com.example.tasksly.Module.Utils;
import com.example.tasksly.R;

import java.util.ArrayList;
import java.util.Calendar;

public class Tasks_fragment extends Fragment {
    private RecyclerView tasks_list_recycler_view;
    private Task_list_adapter adapter;
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
       View view = inflater.inflate(R.layout.fragment_2, container, false);

       // setting the task arraylist recycler view
        tasks_list_recycler_view = view.findViewById(R.id.tasks_list_recycler_view);
        adapter = new Task_list_adapter(this.getContext());
        tasks_list_recycler_view.setAdapter(adapter);
        LinearLayoutManager linearLayoutManager = new LinearLayoutManager(this.getContext(), LinearLayoutManager.VERTICAL, false);
        tasks_list_recycler_view.setLayoutManager(linearLayoutManager);
        Utils.initTasksList();
        ArrayList<Task_Model> tasks_list = Utils.getTasks_list();
        adapter.setTasks(tasks_list);
        return view ;
    }
}