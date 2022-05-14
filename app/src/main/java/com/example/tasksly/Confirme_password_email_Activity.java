package com.example.tasksly;

import static android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS;

import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.graphics.Color;
import android.os.Build;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.View;
import android.view.WindowInsetsController;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;

public class Confirme_password_email_Activity extends AppCompatActivity {

    RelativeLayout checkEmailButton , DoneButton ;
    ProgressBar progressBar ;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_confirme_password_email);
        Setting_Action_Bar_Status_Bar();
        initialisation();
        handelingOnClicks();
    }

    public void initialisation(){
        checkEmailButton = findViewById(R.id.send_email) ;
        DoneButton = findViewById(R.id.done_buttton) ;
        progressBar = findViewById(R.id.pprogres);
    }

    public void handelingOnClicks(){
        checkEmailButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_MAIN);
                intent.addCategory(Intent.CATEGORY_APP_EMAIL);
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(intent);
            }
        });
        DoneButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Confirme_password_email_Activity.this, change_password_succes.class);
                intent.putExtra("email", getIntent().getStringExtra("email"));
                intent.putExtra("password", getIntent().getStringExtra("password"));
                startActivity(intent);
            }
        });
    }

    @RequiresApi(api = Build.VERSION_CODES.M)
    public void Setting_Action_Bar_Status_Bar() {

        //Hiding action bar
        getSupportActionBar().hide();
        // setting the keyboard
        Utils.setUpKeybaord(findViewById(R.id.succes), Confirme_password_email_Activity.this);

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