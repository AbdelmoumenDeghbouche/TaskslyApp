package com.example.tasksly;

import static android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS;

import android.app.Dialog;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.os.StrictMode;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;

import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;

import com.google.gson.Gson;
import com.ismaeldivita.chipnavigation.ChipNavigationBar;

public class MainActivity extends AppCompatActivity {

    ChipNavigationBar chipNavigationBar;
    boolean is_clicked;
    Fragment fragment;
    LinearLayout Linear_layout_add_task, Linear_layout_import_image;
    ImageView img_view_close_dialogue_of_add_new_task;
    private Dialog add_task_dialogue;


    @RequiresApi(api = Build.VERSION_CODES.M)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        getSupportActionBar().hide();
        add_task_dialogue = new Dialog(getApplicationContext());
        add_task_dialogue.setContentView(R.layout.add_task_or_imort_image_dialogue);
        add_task_dialogue.getWindow().setBackgroundDrawable(getDrawable(R.drawable.background_of_dialogue_add_category));
        add_task_dialogue.getWindow().setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        add_task_dialogue.setCancelable(true);
        add_task_dialogue.getWindow().getAttributes().windowAnimations = R.style.animation_of_add_category;
        ImageView img_view_close_dialogue_of_add_new_task = add_task_dialogue.findViewById(R.id.img_view_close_dialogue_of_add_new_task);
        img_view_close_dialogue_of_add_new_task.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                add_task_dialogue.dismiss();
            }
        });
        //this is a must for asynctask to work
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();

        StrictMode.setThreadPolicy(policy);
        // changing the color of the status bar
        this.getWindow().setStatusBarColor(this.getColor(R.color.white));

        // to change the color of the icons in status bar to dark
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(APPEARANCE_LIGHT_STATUS_BARS, APPEARANCE_LIGHT_STATUS_BARS);
        }

        //declaration of views
        initviews();


        // showing a red circle in the app of the plus icon
        is_clicked = false;
        if (!is_clicked) {
            chipNavigationBar.showBadge(R.id.add);
        }
        //add task to list of tasks

        AsyncTask.execute(new Runnable() {
            @RequiresApi(api = Build.VERSION_CODES.N)
            @Override
            public void run() {
                Utils.AddTaskByTaskModel(new Gson().fromJson(getIntent().getStringExtra("task_element"), Task_Model.class));
            }
        });


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
                        add_task_dialogue.show();


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

            private void ShowDialogueMain() {

            }


        });


    }

    private void initviews() {
        chipNavigationBar = findViewById(R.id.buttom);


    }


}