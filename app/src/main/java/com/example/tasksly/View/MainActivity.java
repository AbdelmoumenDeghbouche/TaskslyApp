package com.example.tasksly.View;

import static android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS;

import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.view.WindowInsetsController;

import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;
import androidx.fragment.app.Fragment;

import com.example.tasksly.R;
import com.ismaeldivita.chipnavigation.ChipNavigationBar;

public class MainActivity extends AppCompatActivity {

    public static ChipNavigationBar chipNavigationBar;
    boolean is_clicked;
    Fragment fragment;

    @RequiresApi(api = Build.VERSION_CODES.M)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        getSupportActionBar().hide();


        // changing the color of the status bar
        this.getWindow().setStatusBarColor(this.getColor(R.color.white));

        // to change the color of the icons in status bar to dark
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(APPEARANCE_LIGHT_STATUS_BARS, APPEARANCE_LIGHT_STATUS_BARS);
        }
        // to change the color of the icons in the navigation bar to dark
        getWindow().setNavigationBarColor(ContextCompat.getColor(MainActivity.this, R.color.white)); //setting bar color
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
           this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS, WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS);
        }


        //declaration navigation bar
        chipNavigationBar = findViewById(R.id.buttom);


        // showing a red circle in the app of the plus icon
        is_clicked = false;
        if (!is_clicked) {
            chipNavigationBar.showBadge(R.id.add);
        }


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





}