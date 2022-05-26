package com.example.tasksly;

import static android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS;

import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Color;
import android.net.ConnectivityManager;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.view.WindowInsetsController;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.android.material.dialog.MaterialAlertDialogBuilder;
import com.google.android.material.textfield.TextInputLayout;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

public class Signup_activity extends AppCompatActivity {


    ImageView mainImage;
    TextView Login_text, secondtext, maintext;
    RelativeLayout LoginginButton;
    LinearLayout supportLinearLayout;
    TextInputLayout fullnametext, phonenumbertext, emailtext, confirmpasswordtext, passwordtext;
    String userName, userEmail, userPassword, userConfirmPassword;
    int userNumber;
    NetworkChangeListener networkChangeListener = new NetworkChangeListener();

    String emailPattern = "[a-zA-Z0-9._-]+@[a-z]+\\.+[a-z]+";
    MaterialAlertDialogBuilder progressDialog;
    AlertDialog dialog ;
    DatabaseReference Root;
    FirebaseAuth auth;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_signup);
        //setting the status bar , action bar colors , keyboard interaction
        Setting_Action_Bar_Status_Bar();


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
        progressDialog = new MaterialAlertDialogBuilder(this);
        Root = FirebaseDatabase.getInstance().getReference();
        auth = FirebaseAuth.getInstance();
    }

    public void handlingOnClicks() {
        LoginginButton.setOnClickListener(new View.OnClickListener() {
                                              @Override
                                              public void onClick(View v) {
                                                  gettingUserData();
                                                  if (userName.isEmpty() || userEmail.isEmpty() || String.valueOf(userNumber).isEmpty() || userPassword.isEmpty() || userConfirmPassword.isEmpty()) {
                                                      Toast.makeText(Signup_activity.this, "All Fields Must Be Full !", Toast.LENGTH_SHORT).show();
                                                  } else if (!userEmail.matches(emailPattern)) {
                                                      Toast.makeText(Signup_activity.this, "Invalid Email form !", Toast.LENGTH_SHORT).show();
                                                  } else if (userPassword.length() < 7) {
                                                      Toast.makeText(Signup_activity.this, "Password too short !", Toast.LENGTH_SHORT).show();
                                                  } else if (!userPassword.equals(userConfirmPassword)) {
                                                      Toast.makeText(Signup_activity.this, "Confirmed password doesn't match your password !", Toast.LENGTH_SHORT).show();
                                                  } else {
                                                      progressDialog.setTitle("Wait a minute please !");
                                                      progressDialog.setMessage("We will register you in just a moment ...");
                                                      progressDialog.setCancelable(false);
                                                      progressDialog.setBackground(getResources().getDrawable(R.drawable.tasks_background));
                                                      progressDialog.setIcon(R.drawable.ic__cloud_upload);
                                                      progressDialog.setCancelable(false);
                                                      dialog = progressDialog.show();
                                                      dialog.show();

                                                      userSignUp(userName, userEmail, userPassword, userNumber);
                                                  }
                                              }
                                          }
        );
        Login_text.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(Signup_activity.this, Login_activity.class));
                finish();
            }
        });
    }

    @RequiresApi(api = Build.VERSION_CODES.M)
    public void Setting_Action_Bar_Status_Bar() {

        //Hiding action bar
        getSupportActionBar().hide();
        // setting the keyboard
        Utils.setUpKeybaord(findViewById(R.id.parent), Signup_activity.this);

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
        userName = fullnametext.getEditText().getText().toString().trim();
        userEmail = emailtext.getEditText().getText().toString().trim();
        if (!phonenumbertext.getEditText().getText().toString().trim().equals("")) {
            userNumber = Integer.parseInt(phonenumbertext.getEditText().getText().toString().trim());
        } else {
            userNumber = 0 ;
        }
        userPassword = passwordtext.getEditText().getText().toString().trim();
        userConfirmPassword = confirmpasswordtext.getEditText().getText().toString().trim();
    }

    public void userSignUp(String name, String email, String password, int number) {
        auth.createUserWithEmailAndPassword(email, password).addOnCompleteListener(new OnCompleteListener<AuthResult>() {
            @Override
            public void onComplete(@NonNull Task<AuthResult> task) {
                if (task.isSuccessful()) {
                    UserModel user = new UserModel(name, email, password, number,"",false );
                    Root.child("Users").child(auth.getCurrentUser().getUid()).setValue(user).addOnCompleteListener(new OnCompleteListener<Void>() {
                        @Override
                        public void onComplete(@NonNull Task<Void> task) {
                            if (task.isSuccessful()){
                                Toast.makeText(Signup_activity.this,"Successfully Signed in !",Toast.LENGTH_SHORT).show();
                                dialog.dismiss();
                                startActivity(new Intent(Signup_activity.this, MainActivity.class));
                            } else {
                                Toast.makeText(Signup_activity.this,task.getException().getMessage(),Toast.LENGTH_SHORT).show();
                                dialog.dismiss();
                            }
                        }
                    });
                } else {
                    Toast.makeText(Signup_activity.this,task.getException().getMessage(),Toast.LENGTH_SHORT).show();
                    dialog.dismiss();
                }
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