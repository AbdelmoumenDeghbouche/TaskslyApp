package com.example.tasksly;

import static android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS;

import android.content.Intent;
import android.graphics.Color;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.os.StrictMode;
import android.view.View;
import android.view.WindowInsetsController;

import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;

import com.google.gson.Gson;
import com.ismaeldivita.chipnavigation.ChipNavigationBar;

import java.util.ArrayList;

import java.util.Calendar;

public class MainActivity extends AppCompatActivity {

    ChipNavigationBar chipNavigationBar;
    boolean is_clicked;
    Fragment fragment;

    @RequiresApi(api = Build.VERSION_CODES.M)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Setting_Action_Bar_Status_Bar();

        //this is a must for asynctask to work
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();

        StrictMode.setThreadPolicy(policy);
        // changing the color of the status bar
        this.getWindow().setStatusBarColor(this.getColor(R.color.white));

        // to change the color of the icons in status bar to dark
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(APPEARANCE_LIGHT_STATUS_BARS, APPEARANCE_LIGHT_STATUS_BARS);
        }


        //declaration navigation bar
        chipNavigationBar = findViewById(R.id.buttom);


        // showing a red circle in the app of the plus icon
        is_clicked = false;
        if (!is_clicked) {
            chipNavigationBar.showBadge(R.id.add);
        }
        //add task to list of tasks

//        AsyncTask.execute(new Runnable() {
//            @RequiresApi(api = Build.VERSION_CODES.N)
//            @Override
//            public void run() {
//                Utils.AddTaskByTaskModel(new Gson().fromJson(getIntent().getStringExtra("task_element"), Task_Model.class));
//            }
//        });




        // to put the first fragment in the frame layout in the moment that we entered the activity
        getSupportFragmentManager().beginTransaction()
                //.setCustomAnimations(android.R.anim.slide_in_left, android.R.anim.slide_out_right)
                .replace(R.id.frame, new Home_Fragment())
                .commit();



        // navigation bar clicking interaction
        chipNavigationBar.setItemSelected(R.id.home, true);
        chipNavigationBar.setOnItemSelectedListener(new ChipNavigationBar.OnItemSelectedListener() {
            @Override
            public void onItemSelected(int i) {
                fragment = null;
                switch (i) {
                    case R.id.home:
                        fragment = new Home_Fragment();
                        break;
                    case R.id.add:
                        startActivity(new Intent(MainActivity.this, Add_task.class));

                        // disabling the red circle in the add icon
                        chipNavigationBar.dismissBadge(R.id.add);
                        is_clicked = false;
                        break;
                    case R.id.settings:
                        fragment = new Settings_Fragment();
                        break;
                }
                if (fragment != null) {
                    getSupportFragmentManager().beginTransaction()
                            .setCustomAnimations(android.R.animator.fade_in, android.R.animator.fade_out)
                            .replace(R.id.frame, fragment)
                            .commit();

                }
            }
        });


    }

    @RequiresApi(api = Build.VERSION_CODES.M)
    public void Setting_Action_Bar_Status_Bar() {

        //Hiding action bar
        getSupportActionBar().hide();
        // setting the keyboard
        //Utils.setUpKeybaord(findViewById(R.id.parent), Login_activity.this);

        this.getWindow().setStatusBarColor(Color.WHITE);

        // to change the color of the icons in status bar to dark
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(APPEARANCE_LIGHT_STATUS_BARS, APPEARANCE_LIGHT_STATUS_BARS);
        }
        // to change the color of the icons in the navigation bar to dark
        this.getWindow().setNavigationBarColor(Color.WHITE); //setting bar color
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS, WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS);
        }
    }





}