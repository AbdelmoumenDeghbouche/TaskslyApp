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
import android.os.PersistableBundle;
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
    public static Tasks_fragment Saved_tasks_fragment;
    public Dialog add_task_dialogue;
    boolean is_clicked;
    Fragment fragment;
    LinearLayout Linear_layout_add_task, Linear_layout_import_image, Linear_layout_Take_photo_by_camera;
    ImageView img_view_close_dialogue_of_add_new_task;
    Home_Fragment Saved_home_fragment;
    NetworkChangeListener networkChangeListener = new NetworkChangeListener();
    private boolean changed_statemnt_of_fragment_when_clicking_on_chip_naviation_bar = false;
    private RelativeLayout Main_activity_layout_parent;

    @SuppressLint("UseCompatLoadingForDrawables")
    @RequiresApi(api = Build.VERSION_CODES.M)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        getSupportActionBar().hide();
        Saved_home_fragment = new Home_Fragment();
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
                add_task_dialogue.dismiss();
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
                        if (changed_statemnt_of_fragment_when_clicking_on_chip_naviation_bar) {
                            fragment = Saved_home_fragment;

                        }
                        break;
                    case R.id.add:
                        add_task_dialogue.show();
                        chipNavigationBar.setItemSelected(R.id.home, true);
                        changed_statemnt_of_fragment_when_clicking_on_chip_naviation_bar = false;


                        break;
                    case R.id.settings:
                        fragment = new Settings_Fragment();
                        changed_statemnt_of_fragment_when_clicking_on_chip_naviation_bar = true;
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
        if (uri != null) {
            URL url = Utils.ParseUrl(uri);

            if (null != url) {
                Log.d(TAG, "uri when url not null : "+ uri+  " " + url);

                Utils.OcrExtraction(url.toString());
                Toast.makeText(this, "Image uploaded successfully", Toast.LENGTH_SHORT).show();

            } else {
                URL url2 = Utils.ParseUrl(uri);
                if (null!=url2){
                    Utils.OcrExtraction(url2.toString());
                }
                else {
                    Log.d(TAG, "uri when url is null : "+ uri + "  " +url2);

                    Toast.makeText(this, "Operation Failed Please Upload the Image Again", Toast.LENGTH_LONG).show();

                }



            }
        } else {
            Toast.makeText(this, "Please Upload Your Photo", Toast.LENGTH_LONG).show();
        }

//        Log.d(TAG, "OCr: " + Utils.ParseUrl(uri).toString());
//          if (uri!= null){
//        Utils.OcrExtraction(Utils.ParseUrl(uri).toString());
//     }
        //Utils.OcrExtraction(Utils.ParseUrl(uri).toString());

    }

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState, @Nullable PersistableBundle persistentState) {
        super.onCreate(savedInstanceState, persistentState);
        Saved_tasks_fragment = new Tasks_fragment();

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

    @Override
    public void onBackPressed() {
        if (chipNavigationBar.getSelectedItemId()==R.id.settings){
            chipNavigationBar.setItemSelected(R.id.home, true);
            fragment = Saved_home_fragment;

        }
        else {
            super.onBackPressed();

        }
    }
}

