package com.example.tasksly.View;

import static android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS;

import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsetsController;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;

import com.example.tasksly.Module.Animations;
import com.example.tasksly.Module.Utils;
import com.example.tasksly.R;

public class change_password_succes extends AppCompatActivity {

    RelativeLayout SubmitButton;
    TextView maintext, secondtext;
    ImageView mainImage;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_change_password_succes);
// setting the keyboard
        setupUI(findViewById(R.id.parent));

        getSupportActionBar().hide();
        this.getWindow().setStatusBarColor(this.getColor(R.color.white));

        // to change the color of the icons in status bar to dark
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(APPEARANCE_LIGHT_STATUS_BARS, APPEARANCE_LIGHT_STATUS_BARS);
        }
        // to change the color of the icons in the navigation bar to dark
        getWindow().setNavigationBarColor(ContextCompat.getColor(change_password_succes.this, R.color.white)); //setting bar color
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS, WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS);
        }

        initialisation();
        handlingAnimation();
        hadlingOnClicks();
    }


    private void hadlingOnClicks() {
        SubmitButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(change_password_succes.this, MainActivity.class));
            }
        });
    }

    private void handlingAnimation() {
        Animations.FromUpToDown(mainImage);
        Animations.FromeLeftToRight(maintext);
        Animations.FromeLeftToRight1(secondtext);
        Animations.FromeRightToLeft(SubmitButton);
    }

    public void initialisation() {
        SubmitButton = findViewById(R.id.all_good_submit_button);
        maintext = findViewById(R.id.all_good_main_text);
        secondtext = findViewById(R.id.all_good_second_text);
        mainImage = findViewById(R.id.all_good_image);
    }

    public void setupUI(View view) {
        // Set up touch listener for non-text box views to hide keyboard.
        if (!(view instanceof EditText)) {
            view.setOnTouchListener(new View.OnTouchListener() {
                public boolean onTouch(View v, MotionEvent event) {
                    Utils.hideSoftKeyboard(change_password_succes.this);
                    return false;
                }
            });
        }
        //If a layout container, iterate over children and seed recursion.
        if (view instanceof ViewGroup) {
            for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) {
                View innerView = ((ViewGroup) view).getChildAt(i);
                setupUI(innerView);
            }
        }
    }
}