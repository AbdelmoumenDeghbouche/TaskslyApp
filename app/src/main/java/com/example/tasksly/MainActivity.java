package com.example.tasksly;

import static android.content.ContentValues.TAG;
import static android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS;

import android.annotation.SuppressLint;
import android.app.Dialog;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.os.StrictMode;
import android.provider.Settings;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.Toast;

import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;

import com.github.drjacky.imagepicker.ImagePicker;
import com.google.android.material.snackbar.Snackbar;
import com.google.gson.Gson;
import com.ismaeldivita.chipnavigation.ChipNavigationBar;

import java.net.URL;

public class MainActivity extends AppCompatActivity {

    private static final int CAMERA_PERMISSION_CODE = 170;
    private static final int CAMERA_INTENT_CODE = 270;
    private static final int SETTINGS_PERMISSION_CODE = 171;
    private static final int SETTINGS_INTENT_CODE = 271;


    public static ChipNavigationBar chipNavigationBar;
    public static Uri uri;
    boolean is_clicked;
    Fragment fragment;
    LinearLayout Linear_layout_add_task, Linear_layout_import_image, Linear_layout_Take_photo_by_camera;
    ImageView img_view_close_dialogue_of_add_new_task;
    public  Dialog add_task_dialogue;
    private RelativeLayout Main_activity_layout_parent;
    NetworkChangeListener networkChangeListener = new NetworkChangeListener();


    @SuppressLint("UseCompatLoadingForDrawables")
    @RequiresApi(api = Build.VERSION_CODES.M)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        getSupportActionBar().hide();
        add_task_dialogue = new Dialog(MainActivity.this);
        add_task_dialogue.setContentView(R.layout.add_task_or_imort_image_dialogue);
        add_task_dialogue.getWindow().setBackgroundDrawable(getDrawable(R.drawable.background_of_dialogue_add_category));
        add_task_dialogue.getWindow().setLayout(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        add_task_dialogue.setCancelable(true);
        add_task_dialogue.getWindow().getAttributes().windowAnimations = R.style.animation_of_add_category;
        Linear_layout_add_task = add_task_dialogue.findViewById(R.id.Linear_layout_add_task);
        Linear_layout_import_image = add_task_dialogue.findViewById(R.id.Linear_layout_import_image);
        Linear_layout_Take_photo_by_camera = add_task_dialogue.findViewById(R.id.Linear_layout_Take_photo_by_camera);
        Main_activity_layout_parent = findViewById(R.id.Main_activity_layout_parent);
        Linear_layout_add_task.setClickable(true);
        Linear_layout_add_task.setVisibility(View.VISIBLE);
        Linear_layout_add_task.setFocusable(true);
        Linear_layout_add_task.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(MainActivity.this, Add_task.class));
            }
        });
      Linear_layout_Take_photo_by_camera.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                add_task_dialogue.dismiss();
                ImagePicker.Companion.with(MainActivity.this)
                        .crop()
                        .cameraOnly()
                        .start();

            }

        });

        Linear_layout_import_image.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                add_task_dialogue.dismiss();
                ImagePicker.Companion.with(MainActivity.this)
                        .crop()
                        .galleryOnly()
                        .start();
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
                        chipNavigationBar.setItemSelected(R.id.home, true);


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
        if (Categoty_list_adapter.row_index == 0) {
            Log.d(TAG, "onCreate: row" + Categoty_list_adapter.row_index);
            getSupportFragmentManager().beginTransaction()
                    .replace(R.id.frame, new Home_Fragment())
                    .commit();
        }


    }


    private void showsnackbar() {
        Snackbar.make(Main_activity_layout_parent, "This Feature needs the camera permission", Snackbar.LENGTH_INDEFINITE)
                .setAction("Grant Permission", new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        Intent intent = new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS);
                        intent.setData(Uri.parse("package:" + getPackageName()));
                        startActivityForResult(intent, SETTINGS_PERMISSION_CODE);
                    }
                }).show();


    }


    private void initviews() {
        chipNavigationBar = findViewById(R.id.buttom);


    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        uri = data.getData();
        if (uri != null){
            URL url = Utils.ParseUrl(uri);

            if (null != url){
                Utils.OcrExtraction(url.toString());
                Toast.makeText(this, "Image uploaded successfully", Toast.LENGTH_SHORT).show();

            }
            else {
                Toast.makeText(this, "Operation Failed Please Upload the Image Again", Toast.LENGTH_LONG).show();


            }
        }
        else {
            Toast.makeText(this, "Please Upload Your Photo", Toast.LENGTH_LONG).show();
        }
      
//        Log.d(TAG, "OCr: " + Utils.ParseUrl(uri).toString());
//          if (uri!= null){
//        Utils.OcrExtraction(Utils.ParseUrl(uri).toString());
//     }
        //Utils.OcrExtraction(Utils.ParseUrl(uri).toString());

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

