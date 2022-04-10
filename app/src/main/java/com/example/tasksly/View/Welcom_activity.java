package com.example.tasksly.View;

import static android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS;

import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.view.WindowInsetsController;
import android.widget.LinearLayout;

import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.tasksly.Controller.welcom_activity_recycler_adapter;
import com.example.tasksly.Module.Animations;
import com.example.tasksly.Module.Utils;
import com.example.tasksly.Module.welcom_activity_Model;
import com.example.tasksly.R;

import java.util.ArrayList;

import ru.tinkoff.scrollingpagerindicator.ScrollingPagerIndicator;

public class Welcom_activity extends AppCompatActivity {

    RecyclerView recyclerView;
    ArrayList<welcom_activity_Model> liste;
    LinearLayout LoginLayout, SignupLayout, GoogleLayout, Parent1, Parent2, Parent3;

    @RequiresApi(api = Build.VERSION_CODES.M)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_welcom);
        getSupportActionBar().hide();
        this.getWindow().setStatusBarColor(this.getColor(R.color.white));

        // to change the color of the icons in status bar to dark
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(APPEARANCE_LIGHT_STATUS_BARS, APPEARANCE_LIGHT_STATUS_BARS);
        }

        // to change the color of the icons in the navigation bar to dark
        getWindow().setNavigationBarColor(ContextCompat.getColor(Welcom_activity.this, R.color.white)); //setting bar color
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS, WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS);
        }

        // Setting up the recycler view for the welcome page
        recyclerView = findViewById(R.id.recycler);
        liste = Utils.getWelcomPageList();
        welcom_activity_recycler_adapter adapter = new welcom_activity_recycler_adapter(liste, this);
        LinearLayoutManager linearLayoutManager = new LinearLayoutManager(getApplicationContext(), RecyclerView.HORIZONTAL, false);
        recyclerView.setLayoutManager(linearLayoutManager);
        recyclerView.setAdapter(adapter);

        // setting the scrolling indicators
        ScrollingPagerIndicator recyclerIndicator = findViewById(R.id.indicator);
        recyclerIndicator.attachToRecyclerView(recyclerView);


        Initialisation();
        HandelingClickListeners();
        HandlinAnimations();
    }


    private void Initialisation() {
        LoginLayout = findViewById(R.id.login_layout);
        SignupLayout = findViewById(R.id.signup_layout);
        GoogleLayout = findViewById(R.id.google_layout);
        Parent1 = findViewById(R.id.parent1);
        Parent2 = findViewById(R.id.parent2);
        Parent3 = findViewById(R.id.google_parent);
    }

    private void HandlinAnimations() {
        Animations.FromeRightToLeftLinear(Parent1);
        Animations.FromeRightToLeftLinear1(Parent2);
        Animations.FromeRightToLeftLinear2(Parent3);
    }

    private void HandelingClickListeners() {
        LoginLayout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(Welcom_activity.this, Login_activity.class));
            }
        });
        SignupLayout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(Welcom_activity.this, Signup_activity.class));
            }
        });
        GoogleLayout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(Welcom_activity.this, MainActivity.class));
            }
        });
    }
}

