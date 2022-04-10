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

public class Signup_activity extends AppCompatActivity {


    ImageView mainImage ;
    TextView Login_text , secondtext , maintext ;
    RelativeLayout LoginginButton ;
    LinearLayout supportLinearLayout ;
    TextInputLayout fullnametext , phonenumbertext ,emailtext , confirmpasswordtext , passwordtext ;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_signup);

        // setting the keyboard
        setupUI(findViewById(R.id.parent));

        getSupportActionBar().hide();
        this.getWindow().setStatusBarColor(this.getColor(R.color.white));

        // to change the color of the icons in status bar to dark
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(APPEARANCE_LIGHT_STATUS_BARS, APPEARANCE_LIGHT_STATUS_BARS);
        }
        // to change the color of the icons in the navigation bar to dark
        getWindow().setNavigationBarColor(ContextCompat.getColor(Signup_activity.this, R.color.white)); //setting bar color
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS, WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS);
        }


        initialisation();
        handlingOnClicks();
        handlingAnimation();

    }











    private void handlingAnimation() {
        Animations.FromUpToDownSignup(mainImage);
        Animations.FromeRightToLeft(LoginginButton);
        Animations.FromeDownToUp(supportLinearLayout);
        Animations.FromeRightToLeftEditetext4(confirmpasswordtext);
        Animations.FromeRightToLeftEditetext1(emailtext);
        Animations.FromeRightToLeftEditetext(fullnametext);
        Animations.FromeRightToLeftEditetext3(passwordtext);
        Animations.FromeRightToLeftEditetext2(phonenumbertext);
        Animations.FromeLeftToRight(maintext);
        Animations.FromeLeftToRight1(secondtext);
    }


    public void initialisation(){
        LoginginButton = findViewById(R.id.login_button);
        Login_text = findViewById(R.id.go_to_login);
        secondtext = findViewById(R.id.signup_second_text);
        maintext = findViewById(R.id.signup_main_text);
        mainImage = findViewById(R.id.main_img);
        supportLinearLayout = findViewById(R.id.support_layout);
        fullnametext = findViewById(R.id.full_name_parent);
        phonenumbertext = findViewById(R.id.phone_parent);
        emailtext = findViewById(R.id.email_parent);
        confirmpasswordtext = findViewById(R.id.confirm_password_parent);
        passwordtext = findViewById(R.id.password_parent);
    }

    public void handlingOnClicks(){
        LoginginButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(Signup_activity.this, MainActivity.class));
            }
        });
        Login_text.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(Signup_activity.this, Login_activity.class));
                finish();
            }
        });
    }


    // hiding the keyboard when we clicks any where ( better user experience )

    public void setupUI(View view) {
        // Set up touch listener for non-text box views to hide keyboard.
        if (!(view instanceof EditText)) {
            view.setOnTouchListener(new View.OnTouchListener() {
                public boolean onTouch(View v, MotionEvent event) {
                    Utils.hideSoftKeyboard(Signup_activity.this);
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