package com.example.tasksly;

import static android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS;

import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
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

import java.util.ArrayList;

import ru.tinkoff.scrollingpagerindicator.ScrollingPagerIndicator;

public class Welcom_activity extends AppCompatActivity {

    RecyclerView recyclerView;
    ArrayList<welcom_activity_Model> liste;
    LinearLayout LoginLayout, SignupLayout, Parent1, Parent2;
    NetworkChangeListener networkChangeListener = new NetworkChangeListener();

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
        Parent1 = findViewById(R.id.parent1);
        Parent2 = findViewById(R.id.parent2);
    }

    private void HandlinAnimations() {
        Animations.FromeRightToLeftLinear(Parent1);
        Animations.FromeRightToLeftLinear1(Parent2);
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

