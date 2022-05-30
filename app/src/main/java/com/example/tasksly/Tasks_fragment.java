package com.example.tasksly;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import java.util.ArrayList;

public class Tasks_fragment extends Fragment {
    public static Task_list_adapter adapter;
    public RecyclerView tasks_list_recycler_view;
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

        GetTasksFromRealTimeDataBaseWithListenerAndSetItToTheAdapter();


        LinearLayoutManager linearLayoutManager = new LinearLayoutManager(this.getContext(), LinearLayoutManager.VERTICAL, false);
        tasks_list_recycler_view.setLayoutManager(linearLayoutManager);
        Utils.initTasksList();

        return view;
    }


    private void GetTasksFromRealTimeDataBaseWithListenerAndSetItToTheAdapter() {
        FirebaseDatabase.getInstance().getReference().child("Tasks").addValueEventListener(new ValueEventListener() {
            @Override
            public void onDataChange(@NonNull DataSnapshot snapshot) {
                ArrayList<Task_Model> list = new ArrayList<>();
                if (snapshot.exists()) {
                    for (DataSnapshot category : snapshot.getChildren()) {
                        FirebaseDatabase.getInstance().getReference().child("Tasks").child(category.getKey()).child(FirebaseAuth.getInstance().getCurrentUser().getUid()).addListenerForSingleValueEvent(new ValueEventListener() {
                            @Override
                            public void onDataChange(@NonNull DataSnapshot snapshot) {
                                if (snapshot.exists()) {
                                    for (DataSnapshot task : snapshot.getChildren()) {
                                        Task_Model UserTask = task.getValue(Task_Model.class);
                                        list.add(UserTask);
                                    }
                                }

                                if (null != Utils.categories_list) {
                                    if (Utils.categories_list.size() != 0) {
                                        ArrayList<Task_Model> tasks_list = Utils.return_only_not_completed_tasks(Utils.GetTasksListOfSpecificCategory(Utils.categories_list.get(Categoty_list_adapter.row_index).getCategory_name(), list));

                                        if (tasks_list != null) {
                                            adapter.setTasks(tasks_list);

                                        }
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
    }


}