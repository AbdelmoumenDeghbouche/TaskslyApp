package com.example.tasksly;

import static android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS;

import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.os.Build;
import android.os.Bundle;
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
import androidx.core.content.ContextCompat;

import com.chaos.view.PinView;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.PhoneAuthCredential;
import com.google.firebase.auth.PhoneAuthProvider;

public class OTP_verification_activity extends AppCompatActivity {

    String userCode;
    ProgressBar progressBar;
    ImageView mainImage;
    TextView secondtext, maintext;
    RelativeLayout LoginginButton;
    PinView pinview;
    NetworkChangeListener networkChangeListener = new NetworkChangeListener();

    String number = "";
    String PrivousText = "Check your SMS messages ,We've sent you\nthe PIN in (+213)";
    String OTP_Text = "";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_otp_verification);

        SettingTheUi();
        initialisation();
        getInfoFromPreviousPage();
        handlingOnClicks();
        handlingAnimation();
        GettingUserData();
    }


    private void handlingAnimation() {
        Animations.FromUpToDown(mainImage);
        Animations.FromeRightToLeft(LoginginButton);
        Animations.FromeRightToLeftPinview(pinview);
        Animations.FromeLeftToRight(maintext);
        Animations.FromeLeftToRight1(secondtext);
    }

    public void initialisation() {
        LoginginButton = findViewById(R.id.otp_submit);
        secondtext = findViewById(R.id.otp_second_text);
        maintext = findViewById(R.id.otp_main_text);
        mainImage = findViewById(R.id.otp_image);
        pinview = findViewById(R.id.otp_number);
        progressBar = findViewById(R.id.progrres);
    }

    public void handlingOnClicks() {
        LoginginButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                progressBar.setVisibility(View.VISIBLE);
                verifyCode();
            }
        });
    }

    public void verifyCode() {
        GettingUserData();
        if (OTP_Text != null) {
            if (!userCode.equals("")) {
                sendUserToNextActivity(OTP_Text, userCode);
            } else {
                Toast.makeText(this, "Please enter your code !", Toast.LENGTH_SHORT).show();
                progressBar.setVisibility(View.GONE);
            }
        } else {
            Toast.makeText(this, "Something went wrong !", Toast.LENGTH_SHORT).show();
            progressBar.setVisibility(View.GONE);
        }
    }

    public void sendUserToNextActivity(String otp, String Usercode) {
        PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.getCredential(
                // here we are verifying if the code that the user entered is the same as the code that have been sent from the firebase to the phone number
                otp,
                Usercode
        );
        FirebaseAuth.getInstance().signInWithCredential(phoneAuthCredential).addOnCompleteListener(new OnCompleteListener<AuthResult>() {
            @Override
            public void onComplete(@NonNull Task<AuthResult> task) {
                if (task.isSuccessful()) {
                    Intent intent = new Intent(OTP_verification_activity.this, Reset_password_activity.class);
                    intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
                    // this page didn't used the email and the password , it's just sending them to the next page
                    intent.putExtra("email", getIntent().getStringExtra("email"));
                    intent.putExtra("oldpassword", getIntent().getStringExtra("oldpassword"));
                    startActivity(intent);
                    progressBar.setVisibility(View.GONE);
                } else {
                    Toast.makeText(OTP_verification_activity.this, "Invalid verification code !", Toast.LENGTH_SHORT).show();
                    progressBar.setVisibility(View.GONE);
                }
            }
        });
    }

    public void getInfoFromPreviousPage() {
        GettingUserData();
        secondtext.setText(PrivousText + " " + number);
    }

    @RequiresApi(api = Build.VERSION_CODES.M)
    public void SettingTheUi() {
        // setting the keyboard
        Utils.setUpKeybaord(findViewById(R.id.parent),OTP_verification_activity.this);

        getSupportActionBar().hide();
        this.getWindow().setStatusBarColor(getColor(R.color.white));

        // to change the color of the icons in status bar to dark
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(APPEARANCE_LIGHT_STATUS_BARS, APPEARANCE_LIGHT_STATUS_BARS);
        }
        // to change the color of the icons in the navigation bar to dark
        getWindow().setNavigationBarColor(ContextCompat.getColor(OTP_verification_activity.this, R.color.white)); //setting bar color
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS, WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS);
        }
    }

    public void GettingUserData() {
        OTP_Text = getIntent().getStringExtra("Code");
        userCode = pinview.getText().toString().trim();
        number = getIntent().getStringExtra("phonenumber");
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