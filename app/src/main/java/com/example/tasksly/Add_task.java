package com.example.tasksly;

import static android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS;

import static com.yalantis.ucrop.UCropFragment.TAG;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.WindowInsetsController;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.google.android.material.datepicker.MaterialDatePicker;
import com.google.android.material.datepicker.MaterialPickerOnPositiveButtonClickListener;
import com.google.android.material.dialog.MaterialAlertDialogBuilder;
import com.google.android.material.timepicker.MaterialTimePicker;
import com.google.android.material.timepicker.TimeFormat;
import com.google.gson.Gson;

import java.util.ArrayList;

public class Add_task extends AppCompatActivity {
    EditText TaskTitle;
    RecyclerView recyclerView;
    RelativeLayout relativeLayout, relativeLayout2, task_done_button;
    Categoty_list_adapter adapter;
    boolean is_clicked;
    TextView select_date_text, select_time_text;
    LinearLayout select_date_button, select_time_button;
    MaterialTimePicker materialTimePicker = new MaterialTimePicker.Builder()
            .setTitleText("SELECT A TIME")
            .setTimeFormat(TimeFormat.CLOCK_12H)
            .build();
        MaterialAlertDialogBuilder progressDialog = new MaterialAlertDialogBuilder(Add_task.this);
    public static AlertDialog dialog;
    MaterialDatePicker.Builder builder = MaterialDatePicker.Builder.datePicker().setTitleText("SELECT A DATE");
    final MaterialDatePicker materialDatePicker = builder.build();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_task);
        getSupportActionBar().hide();


        // changing the color of the status bar
        this.getWindow().setStatusBarColor(this.getColor(R.color.white));

        // to change the color of the icons in status bar to dark
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(APPEARANCE_LIGHT_STATUS_BARS, APPEARANCE_LIGHT_STATUS_BARS);
        }
        // to change the color of the icons in the navigation bar to dark
        getWindow().setNavigationBarColor(ContextCompat.getColor(Add_task.this, R.color.white)); //setting bar color
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS, WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS);
        }


        AssingElements();
        Handlingonoffclicks();
        Utils.initCategories(); // charging the arraylist with the categories
        ArrayList<Category_Model> categories = Utils.GetAllCatgoriesFromFirebse(); // this function is returning the arraylist that we charged in the precedent line

        // setting the categories recycler view

        adapter = new Categoty_list_adapter(getApplicationContext());
        recyclerView.setAdapter(adapter);
        LinearLayoutManager linearLayoutManager = new LinearLayoutManager(getApplicationContext(), LinearLayoutManager.HORIZONTAL, false);
        recyclerView.setLayoutManager(linearLayoutManager);
        adapter.setCategories(categories);
        // this is a date picker algorithm
        datepicker();
        timepicker();
        //when done is pressed
        donepressed();
    }

    public void AssingElements() {

        relativeLayout = findViewById(R.id.On_relalive_layout);
        relativeLayout2 = findViewById(R.id.Off_relalive_layout);
        recyclerView = findViewById(R.id.creat_task_recyclerview);
        TaskTitle = findViewById(R.id.add_task_title);
        task_done_button = findViewById(R.id.task_done_button);
        is_clicked = true;
        task_done_button = findViewById(R.id.task_done_button);
        select_date_text = findViewById(R.id.select_date_text);
        select_time_text = findViewById(R.id.select_time_text);
        select_date_button = findViewById(R.id.select_date_button);
        select_time_button = findViewById(R.id.select_time_button);

    }

    public void Handlingonoffclicks() {

        // handling on off clicks

        findViewById(R.id.parent_layout).setOnClickListener(new View.OnClickListener() {
            @SuppressLint("ResourceAsColor")
            @Override
            public void onClick(View view) {
                if (is_clicked) {
                    relativeLayout.setVisibility(View.GONE);
                    relativeLayout2.setVisibility(View.VISIBLE);
                } else {
                    relativeLayout.setVisibility(View.VISIBLE);
                    relativeLayout2.setVisibility(View.GONE);
                }
                is_clicked = !is_clicked;
            }
        });

        task_done_button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                startActivity(new Intent(Add_task.this, MainActivity.class));
            }
        });

    }

    public void donepressed() {
        task_done_button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (TaskTitle.getText().toString().equals("")) {
                    Toast.makeText(Add_task.this, "Please Fill The title of your task", Toast.LENGTH_SHORT).show();
                } else {
                    String time = "", date = "";
                    try {
                        time = materialTimePicker.getHour() + ":" + materialTimePicker.getMinute();
                        date = materialDatePicker.getHeaderText();
                    } catch (NullPointerException e) {
                        Log.d(TAG, "onClick: "+ e);
                    }
                    date = select_date_text.getText().toString();

                    Gson gson = new Gson();


                    Task_Model task_model = new Task_Model(TaskTitle.getText().toString(), time, date, Utils.getCategories_list().get(adapter.getRow_index()), "", is_clicked);

                    progressDialog.setTitle("Wait a minute please !");
                    progressDialog.setMessage("We are saving your task...");
                    progressDialog.setCancelable(false);
                    progressDialog.setBackground(getResources().getDrawable(R.drawable.tasks_background));
                    progressDialog.setIcon(R.drawable.ic__cloud_upload);
                    progressDialog.setCancelable(false);
                    dialog = progressDialog.show();
                    dialog.show();
                    Utils.AddTaskToFirebase(task_model,getApplicationContext());


                    String task_element = gson.toJson(task_model);
                    Intent intent = new Intent(Add_task.this, MainActivity.class).putExtra("task_element", task_element);
                    startActivity(intent);

                }


            }
        });

    }

    public void timepicker() {

        select_time_button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                materialTimePicker.show(Add_task.this.getSupportFragmentManager(), "TIME_PICKER");
            }
        });
        materialTimePicker.addOnPositiveButtonClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                select_time_text.setText(materialTimePicker.getHour() + ":" + materialTimePicker.getMinute());
            }
        });


    }

    public void datepicker() {

        select_date_button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                materialDatePicker.show(Add_task.this.getSupportFragmentManager(), "DATE_PICKER");
            }
        });
        materialDatePicker.addOnPositiveButtonClickListener(new MaterialPickerOnPositiveButtonClickListener() {
            @Override
            public void onPositiveButtonClick(Object selection) {
                select_date_text.setText(materialDatePicker.getHeaderText());
            }
        });
    }

    /*public void Handlingonoffclicks(View view){

        // handling on off clicks

        view.findViewById(R.id.parent_layout).setOnClickListener(new View.OnClickListener() {
            @SuppressLint("ResourceAsColor")
            @Override
            public void onClick(View view) {
                if (is_clicked) {
                    relativeLayout.setVisibility(View.GONE);
                    relativeLayout2.setVisibility(View.VISIBLE);
                } else {
                    relativeLayout.setVisibility(View.VISIBLE);
                    relativeLayout2.setVisibility(View.GONE);
                }
                is_clicked = !is_clicked;
            }
        });

    }*/
    @Override
    public void onBackPressed() {
        super.onBackPressed();
    }
}