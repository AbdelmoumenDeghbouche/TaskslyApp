package com.example.tasksly;

import static android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS;

import android.content.Intent;
import android.graphics.Color;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.WindowInsetsController;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;

import com.google.android.material.textfield.TextInputLayout;
import com.google.firebase.FirebaseException;
import com.google.firebase.auth.PhoneAuthCredential;
import com.google.firebase.auth.PhoneAuthProvider;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

import java.util.concurrent.TimeUnit;

public class Phone_number_activity extends AppCompatActivity {

    RelativeLayout SubmitButton;
    TextView maintext, secondtext;
    ImageView mainImage;
    TextInputLayout PhoneNumberLayout;
    String userNumber;
    ProgressBar progressBar;
    DatabaseReference Root;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_phone_number);
//setting the status bar , action bar colors , keyboard interaction
        Setting_Action_Bar_Status_Bar();


        initialisation();
        handlingAnimation();
        handlingOnClicks();
    }

    private void handlingAnimation() {
        Animations.FromUpToDown(mainImage);
        Animations.FromeLeftToRight(maintext);
        Animations.FromeLeftToRight1(secondtext);
        Animations.FromeRightToLeftEditetext2(PhoneNumberLayout);
        Animations.FromeRightToLeft(SubmitButton);
    }

    public void initialisation() {
        SubmitButton = findViewById(R.id.forget_password_phonenumber_submit_button);
        maintext = findViewById(R.id.forget_password_phonenumber_main_text);
        mainImage = findViewById(R.id.forget_password_phonenumber_image);
        PhoneNumberLayout = findViewById(R.id.forget_password_phonenumber_layout);
        secondtext = findViewById(R.id.forget_password_phonenumber_second_text);
        progressBar = findViewById(R.id.progres);
        Root = FirebaseDatabase.getInstance().getReference();
    }

    public void handlingOnClicks() {
        SubmitButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                gettingUserData();
                verifyPhoneNumber(userNumber);
            }
        });
    }

    public void SendOTPCode(String number) {

        progressBar.setVisibility(View.VISIBLE);
        PhoneAuthProvider.getInstance().verifyPhoneNumber(
                "+213" + number, // algeria
                60,
                TimeUnit.SECONDS,
                Phone_number_activity.this,
                new PhoneAuthProvider.OnVerificationStateChangedCallbacks() {
                    @Override
                    public void onCodeSent(@NonNull String verificationId, @NonNull PhoneAuthProvider.ForceResendingToken forceResendingToken) {
                        progressBar.setVisibility(View.GONE);
                        Intent intent = new Intent(Phone_number_activity.this, OTP_verification_activity.class);
                        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
                        // we are sending the code that the firebase will send to the user phone
                        intent.putExtra("Code", verificationId);
                        // we are sending also the email and the old password
                        intent.putExtra("email", getIntent().getStringExtra("email"));
                        intent.putExtra("oldpassword", getIntent().getStringExtra("oldpassword"));
                        // we are sending the phone number just to shoe it in the screen otp screen
                        intent.putExtra("phonenumber", getIntent().getStringExtra("phonenumber"));
                        Log.d("code =======> ", verificationId);
                        startActivity(intent);
                    }

                    @Override
                    public void onVerificationCompleted(@NonNull PhoneAuthCredential phoneAuthCredential) {
                        progressBar.setVisibility(View.GONE);
                    }

                    @Override
                    public void onVerificationFailed(@NonNull FirebaseException e) {
                        progressBar.setVisibility(View.GONE);
                        Toast.makeText(Phone_number_activity.this, e.getMessage(), Toast.LENGTH_SHORT).show();
                    }
                }
        );

    }

    public void verifyPhoneNumber(String number) {

        // comparing the number that the user entered with the one saved in the database for this account

        String userNumber = getIntent().getStringExtra("phonenumber");

        if (number.isEmpty()) {
            Toast.makeText(Phone_number_activity.this, "Please enter your phone number !", Toast.LENGTH_SHORT).show();
        } else if (!number.equals(userNumber)) {
            // we are verifying if the number is the same as the number with got from the old account from the previous page
            Toast.makeText(this, "Wrong number for this account !", Toast.LENGTH_SHORT).show();
        } else {
            Log.d("============> ", number);
            SendOTPCode(number);
        }
    }

    @RequiresApi(api = Build.VERSION_CODES.M)
    public void Setting_Action_Bar_Status_Bar() {

        //Hiding action bar
        getSupportActionBar().hide();
        // setting the keyboard
        Utils.setUpKeybaord(findViewById(R.id.parent), Phone_number_activity.this);

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

    public void gettingUserData() {
        userNumber = PhoneNumberLayout.getEditText().getText().toString().trim();
    }


}