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
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;

import com.example.tasksly.Module.Animations;
import com.example.tasksly.Module.Utils;
import com.example.tasksly.R;
import com.google.android.material.textfield.TextInputLayout;

public class Login_activity extends AppCompatActivity {

    RelativeLayout LoginginButton;
    TextView creat_new_account_text, maintext , forgotpassword , secondtext ;
    ImageView mainImage;
    LinearLayout SupportLinearLayout , orLoginLayout;
    TextInputLayout emaillayout, passwordlayout;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        // setting the keyboard
        setupUI(findViewById(R.id.parent));

        getSupportActionBar().hide();
        this.getWindow().setStatusBarColor(this.getColor(R.color.white));

        // to change the color of the icons in status bar to dark
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(APPEARANCE_LIGHT_STATUS_BARS, APPEARANCE_LIGHT_STATUS_BARS);
        }
        // to change the color of the icons in the navigation bar to dark
        getWindow().setNavigationBarColor(ContextCompat.getColor(Login_activity.this, R.color.white)); //setting bar color
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS, WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS);
        }

        initialisation();
        handlingOnClicks();
        handlingAnimation();


    }

















    private void handlingAnimation() {
        Animations.FromUpToDown(mainImage);
        Animations.FromeLeftToRight(maintext);
        Animations.FromeLeftToRight1(secondtext);
        Animations.FromeRightToLeft(LoginginButton);
        Animations.FromeDownToUp(SupportLinearLayout);
        Animations.FromeRightToLeftEditetext1(emaillayout);
        Animations.FromeRightToLeftEditetext2(passwordlayout);
        Animations.FromeDownToUp(orLoginLayout);
    }


    public void initialisation() {
        secondtext = findViewById(R.id.login_second_text);
        LoginginButton = findViewById(R.id.login_button);
        creat_new_account_text = findViewById(R.id.go_to_sign);
        maintext = findViewById(R.id.main_text);
        mainImage = findViewById(R.id.main_img);
        SupportLinearLayout = findViewById(R.id.support_linear_layout);
        emaillayout = findViewById(R.id.email_parent_login);
        passwordlayout = findViewById(R.id.password_parent_login);
        orLoginLayout = findViewById(R.id.or_login_with_layout);
        forgotpassword = findViewById(R.id.forgot_password_text);
    }

    public void handlingOnClicks() {
        LoginginButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(Login_activity.this, MainActivity.class));
            }
        });
        creat_new_account_text.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(Login_activity.this, Signup_activity.class));
                finish();
            }
        });

        forgotpassword.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(Login_activity.this, Forget_password_activity.class));
            }
        });
    }

    // hiding the keyboard when we clicks any where ( better user experience )

    public void setupUI(View view) {
        // Set up touch listener for non-text box views to hide keyboard.
        if (!(view instanceof EditText)) {
            view.setOnTouchListener(new View.OnTouchListener() {
                public boolean onTouch(View v, MotionEvent event) {
                    Utils.hideSoftKeyboard(Login_activity.this);
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