package com.example.tasksly;

import static android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.graphics.Color;
import android.os.Build;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.view.WindowInsetsController;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
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
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import io.paperdb.Paper;

public class Login_activity extends AppCompatActivity {

    private int RC_SIGN_IN = 123;
    RelativeLayout LoginginButton;
    TextView creat_new_account_text, maintext, forgotpassword, secondtext;
    ImageView mainImage, googleimage, facebookimage;
    LinearLayout SupportLinearLayout, orLoginLayout;
    TextInputLayout emaillayout, passwordlayout;
    String userEmail = "";
    String userPassword = "";
    String emailPattern = "[a-zA-Z0-9._-]+@[a-z]+\\.+[a-z]+";
    MaterialAlertDialogBuilder progressDialog;
    AlertDialog dialog;
    DatabaseReference Root;
    FirebaseAuth auth = FirebaseAuth.getInstance();
    CheckBox SaveStateBox;
    ProgressBar progressBar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        //setting the status bar , action bar colors , keyboard interaction
        Setting_Action_Bar_Status_Bar();

        initialisation();
        handlingAnimation();
        handlingOnClicks();
        RememberMeUser();
        //GoogelAuthentification.CreatGoogleSignInRequest();
        SettingUserEmail_Password_AfterUpdatingTheme();


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
        progressDialog = new MaterialAlertDialogBuilder(this);
        Root = FirebaseDatabase.getInstance().getReference();
        SaveStateBox = findViewById(R.id.remember_me);
        Paper.init(this);
    }

    public void handlingOnClicks() {
        LoginginButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                gettingUserData();

                if (userEmail.isEmpty() || userPassword.isEmpty()) {
                    Toast.makeText(Login_activity.this, "All Fields Must Be Full !", Toast.LENGTH_SHORT).show();
                } else if (!userEmail.matches(emailPattern)) {
                    Toast.makeText(Login_activity.this, "Invalid Email form !", Toast.LENGTH_SHORT).show();
                } else if (userPassword.length() < 7) {
                    Toast.makeText(Login_activity.this, "Password too short !", Toast.LENGTH_SHORT).show();
                } else {
                    progressDialog.setTitle("Wait a minute please !");
                    progressDialog.setMessage("Searching for this user...");
                    progressDialog.setCancelable(false);
                    progressDialog.setBackground(getResources().getDrawable(R.drawable.tasks_background));
                    progressDialog.setIcon(R.drawable.ic__cloud_upload);
                    progressDialog.setCancelable(false);
                    dialog = progressDialog.show();
                    dialog.show();

                    userLogin(userEmail, userPassword);
                }
            }
        });
        creat_new_account_text.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(Login_activity.this, Signup_activity.class));
            }
        });

        forgotpassword.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(Login_activity.this, Forget_password_activity.class));
            }
        });
    }

    public void gettingUserData() {
        userEmail = emaillayout.getEditText().getText().toString().trim();
        userPassword = passwordlayout.getEditText().getText().toString().trim();
    }

    public void userLogin(String email, String password) {
        // verify and save the user data in the paper variables
        if (SaveStateBox.isChecked()) {
            Paper.book().write(Paper_base.UserEmail, email);
            Paper.book().write(Paper_base.UserPassword, password);
        }
        AllowAcces(email, password);
    }

    public void RememberMeUser() {
        // verifying if the user did logout or he just get out from the app without logging out , if this is the case , then we should send him directly
        // to the homepage without the logging again
        String UserEmail = Paper.book().read(Paper_base.UserEmail);
        String UserPassword = Paper.book().read(Paper_base.UserPassword);

        if (UserEmail != "" && UserPassword != "") {
            if (!TextUtils.isEmpty(UserEmail) && !TextUtils.isEmpty(UserPassword)) {
                // Now , the user hasn't logged out from the app , so we will redirect him to the MainActivity directly without logging in again
                progressDialog.setTitle("Wait a minute please !");
                progressDialog.setMessage("Hello again, we're redirecting you to Home !");
                progressDialog.setCancelable(false);
                progressDialog.setBackground(getResources().getDrawable(R.drawable.tasks_background));
                progressDialog.setIcon(R.drawable.ic__cloud_upload);
                progressDialog.setCancelable(false);
                dialog = progressDialog.show();
                dialog.show();

                AllowAcces(UserEmail, UserPassword);
            }
        }
    }

    public void AllowAcces(String UserEmail, String UserPassword) {
        // method 1
        Root.child("Users").addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(@NonNull DataSnapshot snapshot) {
                UserModel oldUser = null;
                // checking if the user with email exists
                for (DataSnapshot user : snapshot.getChildren()) {
                    if (user.getValue(UserModel.class).getEmail() != null) {
                        if (user.getValue(UserModel.class).getEmail().equals(UserEmail)) {
                            oldUser = user.getValue(UserModel.class);
                            break;
                        }
                    }
                }
                if (oldUser != null) {
                    // checking the password registered in the database  with the one that the user entered
                    if (!oldUser.getPassword().equals(UserPassword)) {
                        Toast.makeText(Login_activity.this, "Wrong password !", Toast.LENGTH_SHORT).show();
                        passwordlayout.getEditText().setText("");
                        dialog.dismiss();
                    } else {
                        // the user exists in the database
                        auth.signOut();
                        auth.signInWithEmailAndPassword(UserEmail, UserPassword).addOnCompleteListener(new OnCompleteListener<AuthResult>() {
                            @SuppressLint("ResourceAsColor")
                            @Override
                            public void onComplete(@NonNull Task<AuthResult> task) {
                                if (task.isSuccessful()) {
                                    dialog.dismiss();
                                    Toast.makeText(getApplicationContext(), "Welcome !", Toast.LENGTH_SHORT).show();
                                    startActivity(new Intent(Login_activity.this, MainActivity.class));
                                } else {
                                    Toast.makeText(getApplicationContext(), task.getException().getMessage(), Toast.LENGTH_SHORT).show();
                                    dialog.dismiss();
                                }
                            }
                        });
                    }
                } else {
                    Toast.makeText(getApplicationContext(), "No user with this email !", Toast.LENGTH_SHORT).show();
                    dialog.dismiss();
                }
            }

            @Override
            public void onCancelled(@NonNull DatabaseError error) {
                Toast.makeText(Login_activity.this, "Empty database !", Toast.LENGTH_SHORT).show();
                dialog.dismiss();
            }
        });

        // method 2

//        Root.child("Users").orderByChild("email").equalTo(UserEmail).addListenerForSingleValueEvent(new ValueEventListener() {
//            @Override
//            public void onDataChange(@NonNull DataSnapshot snapshot) {
//                UserModel user = null ;
//                if (snapshot.exists()) {
//                    // checking the password registered in the database  with the one that the user entered
//                    user = snapshot.getValue(UserModel.class);
//                    if (user != null) {
//                        if (!user.getPassword().equals(UserPassword)) {
//                            Toast.makeText(Login_activity.this, "Wrong password !", Toast.LENGTH_SHORT).show();
//                            passwordlayout.getEditText().setText("");
//                            dialog.dismiss();
//                        } else {
//                            // the user exists in the database
//                            auth.signInWithEmailAndPassword(UserEmail, UserPassword).addOnCompleteListener(new OnCompleteListener<AuthResult>() {
//                                @SuppressLint("ResourceAsColor")
//                                @Override
//                                public void onComplete(@NonNull Task<AuthResult> task) {
//                                    if (task.isSuccessful()) {
//                                        dialog.dismiss();
//                                        Toast.makeText(getApplicationContext(), "Welcome !", Toast.LENGTH_SHORT).show();
//                                        startActivity(new Intent(Login_activity.this, MainActivity.class));
//                                    } else {
//                                        Toast.makeText(getApplicationContext(), "No users found !", Toast.LENGTH_SHORT).show();
//                                        dialog.dismiss();
//                                    }
//                                }
//                            });
//                        }
//                    } else {
//                        Toast.makeText(getApplicationContext(), "No user with this email !", Toast.LENGTH_SHORT).show();
//                        dialog.dismiss();
//                    }
//                } else {
//                    Toast.makeText(getApplicationContext(), "No user with this email !", Toast.LENGTH_SHORT).show();
//                }
//            }
//            @Override
//            public void onCancelled(@NonNull DatabaseError error) {
//                dialog.dismiss();
//            }
//        });
    }

    public void SettingUserEmail_Password_AfterUpdatingTheme() {
        String email = getIntent().getStringExtra("email");
        String password = getIntent().getStringExtra("password");
        if (email != null && password != null) {
            emaillayout.getEditText().setText(email);
            passwordlayout.getEditText().setText(password);
        } else {
            emaillayout.getEditText().setText("");
            passwordlayout.getEditText().setText("");
        }
    }

    @RequiresApi(api = Build.VERSION_CODES.M)
    public void Setting_Action_Bar_Status_Bar() {

        //Hiding action bar
        getSupportActionBar().hide();
        // setting the keyboard
        Utils.setUpKeybaord(findViewById(R.id.parent), Login_activity.this);

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
}