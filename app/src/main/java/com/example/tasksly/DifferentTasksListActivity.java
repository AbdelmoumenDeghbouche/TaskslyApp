package com.example.tasksly;

import static android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS;

import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.view.WindowInsetsController;
import android.widget.ProgressBar;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import java.util.ArrayList;

public class DifferentTasksListActivity extends AppCompatActivity {
    NetworkChangeListener networkChangeListener = new NetworkChangeListener();
    private RecyclerView recycler_view_of_private_tasks;
    private Task_list_adapter adapter;
    private TextView txt_name_of_the_activity;
    private ArrayList<Task_Model> tasks_list;
    private TextView prorgess,progress_number ;
    private ProgressBar progressBar ;

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
        progressBar = findViewById(R.id.simpleProgressBar);
        prorgess = findViewById(R.id.progress);
        progress_number = findViewById(R.id.progress_number);
        recycler_view_of_private_tasks = findViewById(R.id.recycler_view_of_private_tasks);

        adapter = new Task_list_adapter(getApplicationContext());
        recycler_view_of_private_tasks.setAdapter(adapter);
        LinearLayoutManager linearLayoutManager = new LinearLayoutManager(getApplicationContext(), LinearLayoutManager.VERTICAL, false);
        recycler_view_of_private_tasks.setLayoutManager(linearLayoutManager);
        Utils.initTasksList();
        tasks_list = new ArrayList<>();

        // setting the progress bar




        if (intent != null) {
            if (intent.getStringExtra("NameOfActivity").equals("Private Tasks")) {
                tasks_list = Utils.category_map.get("sqddqsdjqsoidjqsjdsoqidjoqsidjqsoi");
                Utils.should_i_delete_the_task_from_the_adapter = false;
                prorgess.setVisibility(View.GONE);
                progressBar.setVisibility(View.GONE);
                progress_number.setVisibility(View.GONE);

                txt_name_of_the_activity.setText(intent.getStringExtra("NameOfActivity"));


            }
            if (intent.getStringExtra("NameOfActivity").equals("Completed Tasks")) {
                Utils.should_i_delete_the_task_from_the_adapter = true;
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

                                        ArrayList<Task_Model> tasks_list = Utils.return_only_completed_tasks(list);

                                        if (tasks_list != null) {
                                            adapter.setTasks(tasks_list);

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


                txt_name_of_the_activity.setText(intent.getStringExtra("NameOfActivity"));

            }
            if (intent.getStringExtra("NameOfActivity").equals("All Tasks")) {
                Utils.should_i_delete_the_task_from_the_adapter = false;
                prorgess.setVisibility(View.VISIBLE);
                progressBar.setVisibility(View.VISIBLE);
                progress_number.setVisibility(View.VISIBLE);
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

                                        ArrayList<Task_Model> tasks_list = list;
                                        int a = ((Utils.return_only_completed_tasks(list).size())*100)/tasks_list.size();
                                        progressBar.setProgress(a);
                                        progress_number.setText(a+"%");
                                        if (tasks_list != null) {
                                            adapter.setTasks(tasks_list);

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
                txt_name_of_the_activity.setText(intent.getStringExtra("NameOfActivity"));


            }
            if (intent.getStringExtra("NameOfActivity").equals("Planning Tasks")) {
                Utils.should_i_delete_the_task_from_the_adapter = true;
                prorgess.setVisibility(View.GONE);
                progressBar.setVisibility(View.GONE);
                progress_number.setVisibility(View.GONE);
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

                                        ArrayList<Task_Model> tasks_list = Utils.return_only_not_completed_tasks(list);

                                        if (tasks_list != null) {
                                            adapter.setTasks(tasks_list);

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
                txt_name_of_the_activity.setText(intent.getStringExtra("NameOfActivity"));


            }


        }


        adapter.setTasks(tasks_list);


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

    @Override
    protected void onStart() {
        IntentFilter intentFilter = new IntentFilter(ConnectivityManager.CONNECTIVITY_ACTION);
        registerReceiver(networkChangeListener, intentFilter);
        super.onStart();

    }

    @Override
    protected void onStop() {

        unregisterReceiver(networkChangeListener);
        super.onStop();
    }
}