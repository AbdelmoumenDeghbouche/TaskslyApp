package com.example.tasksly;

import static com.yalantis.ucrop.UCropFragment.TAG;

import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

public class Tasks_fragment extends Fragment {
    public static Task_list_adapter adapter;
    ArrayList<Task_Model> tasks_list;
    public RecyclerView tasks_list_recycler_view;
    private int roww;

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (savedInstanceState!=null){
            tasks_list =savedInstanceState.getParcelableArrayList("Taskslist");
        }
    }

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
        if (Categoty_list_adapter.row_index == 0) {
            Log.d(TAG, "trueeeeeeeeeee: ");

        }


        return view;
    }

    @Override
    public void onSaveInstanceState(@NonNull Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putParcelableArrayList("Taskslist",tasks_list);

    }
}