package com.example.tasksly;

import static android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS;

import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.widget.LinearLayout;

import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

import ru.tinkoff.scrollingpagerindicator.ScrollingPagerIndicator;

public class Welcom_activity extends AppCompatActivity {

    RecyclerView recyclerView;
    ArrayList<welcom_activity_recycler_class> liste;
    LinearLayout Facebooklayout , Googlelayout , Emaillayout ;

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

        // Setting up the recycler view for the welcome page
        recyclerView = findViewById(R.id.recycler);
        liste = Charging_welcome_activity_recycler_list.GetMainPageListe();
        welcom_activity_recycler_adapter adapter = new welcom_activity_recycler_adapter(liste, this);
        LinearLayoutManager linearLayoutManager = new LinearLayoutManager(getApplicationContext(), RecyclerView.HORIZONTAL, false);
        recyclerView.setLayoutManager(linearLayoutManager);
        recyclerView.setAdapter(adapter);

        // setting the scrolling indicators
        ScrollingPagerIndicator recyclerIndicator = findViewById(R.id.indicator);
        recyclerIndicator.attachToRecyclerView(recyclerView);

        // initializing the layouts

        Facebooklayout = findViewById(R.id.facebook_layout);
        Googlelayout = findViewById(R.id.google_layout);
        Emaillayout = findViewById(R.id.email_layout);

        // the click listeners method
        HandelingClickListeners();



    }

    private void HandelingClickListeners() {
        Facebooklayout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(Welcom_activity.this, MainActivity.class));
            }
        });
        Googlelayout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(Welcom_activity.this,MainActivity.class));
            }
        });
        Emaillayout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(Welcom_activity.this,MainActivity.class));
            }
        });
    }

}