package com.example.tasksly;

import static android.content.ContentValues.TAG;

import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

public class Tasks_fragment extends Fragment {
    private RecyclerView tasks_list_recycler_view;
    private Task_list_adapter adapter;
    private int roww;

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
        ArrayList<Task_Model> tasks_list = Utils.category_map.get(Utils.getCategories_list().get(Categoty_list_adapter.row_index).getCategory_name());
        Bundle bundle = this.getArguments();
        if (null != bundle) {
            roww = bundle.getInt("rowIndex");

        }
        Log.d(TAG, "onCreateView: row index" + roww);
        if (Categoty_list_adapter.row_index == 0) {
            Log.d(TAG, "onCreateView: condition worked");
            getFragmentManager().beginTransaction().detach(Tasks_fragment.this).attach(Tasks_fragment.this).commit();

        }
//        ArrayList<Task_Model> task_modelArrayList = (ArrayList<Task_Model>) tasks_list.clone();

        if (null!=tasks_list){
            adapter.setTasks(Utils.return_only_not_completed_tasks(tasks_list));
            adapter.notifyDataSetChanged();


        }
        return view;
    }
}