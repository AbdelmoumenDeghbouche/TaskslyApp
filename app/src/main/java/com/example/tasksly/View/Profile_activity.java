package com.example.tasksly.View;

import static android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS;

import android.os.Build;
import android.os.Bundle;
import android.view.WindowInsetsController;
import android.widget.LinearLayout;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;

import com.example.tasksly.Module.Animations;
import com.example.tasksly.R;

public class Profile_activity extends AppCompatActivity {

    LinearLayout PlanningLayout, PendingLayout, CompletedLayout, CancelledLayout, TotalLayout;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_profile);
        getSupportActionBar().hide();

        // changing the color of the status bar
        this.getWindow().setStatusBarColor(this.getColor(R.color.white));

        // to change the color of the icons in status bar to dark
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(APPEARANCE_LIGHT_STATUS_BARS, APPEARANCE_LIGHT_STATUS_BARS);
        }
        // to change the color of the icons in the navigation bar to dark
        getWindow().setNavigationBarColor(ContextCompat.getColor(Profile_activity.this, R.color.white)); //setting bar color
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS, WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS);
        }

        initialisation();
        handelingAnimations();

    }

    public void initialisation() {
        PlanningLayout = findViewById(R.id.planing_layout);
        PendingLayout = findViewById(R.id.running_tasks_layout);
        CompletedLayout = findViewById(R.id.completed_tasks_layout);
        CancelledLayout = findViewById(R.id.canceled_tasks_layout);
        TotalLayout = findViewById(R.id.total_tasks_layout);
    }

    public void handelingAnimations(){
        Animations.FromeLeftToRightLinear(PlanningLayout);
        Animations.FromeLeftToRightLinear1(PendingLayout);
        Animations.FromeLeftToRightLinear2(CompletedLayout);
        Animations.FromeLeftToRightLinear3(CancelledLayout);
        Animations.FromeLeftToRightLinear4(TotalLayout);

    }
}