package com.example.tasksly;

import static android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS;

import androidx.annotation.NonNull;
import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.graphics.Color;
import android.os.Build;
import android.os.Bundle;
import android.os.SystemClock;
import android.text.TextUtils;
import android.view.WindowInsetsController;
import android.widget.Toast;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.android.material.dialog.MaterialAlertDialogBuilder;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import io.paperdb.Paper;

public class Remember_me_Activity extends AppCompatActivity {

    MaterialAlertDialogBuilder progressDialog;
    AlertDialog dialog;
    FirebaseAuth auth = FirebaseAuth.getInstance();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_remember_me);
        Paper.init(this);
        progressDialog = new MaterialAlertDialogBuilder(this);

        Setting_Action_Bar_Status_Bar();
        RememberMeUser();

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

            } else {
                Intent intent = new Intent(Remember_me_Activity.this, Welcom_activity.class);
                intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(intent);
            }
        }
    }


    public void AllowAcces(String UserEmail, String UserPassword) {
        // method 1
        FirebaseDatabase.getInstance().getReference().child("Users").addListenerForSingleValueEvent(new ValueEventListener() {
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
                        //Toast.makeText(Remember_me_Activity.this, "Wrong password !", Toast.LENGTH_SHORT).show();
                        Intent intent = new Intent(Remember_me_Activity.this, Welcom_activity.class);
                        intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_NEW_TASK);
                        startActivity(intent);
                        dialog.dismiss();
                    }
                    else {
                        // the user exists in the database
                        auth.signOut();
                        auth.signInWithEmailAndPassword(UserEmail, UserPassword).addOnCompleteListener(new OnCompleteListener<AuthResult>() {
                            @SuppressLint("ResourceAsColor")
                            @Override
                            public void onComplete(@NonNull Task<AuthResult> task) {
                                if (task.isSuccessful()) {
                                    dialog.dismiss();
                                    Toast.makeText(getApplicationContext(), "Welcome !", Toast.LENGTH_SHORT).show();
                                    Intent intent = new Intent(Remember_me_Activity.this, MainActivity.class);
                                    intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_NEW_TASK);
                                    startActivity(intent);
                                } else {
                                    Toast.makeText(getApplicationContext(), task.getException().getMessage(), Toast.LENGTH_SHORT).show();
                                    Intent intent = new Intent(Remember_me_Activity.this, Welcom_activity.class);
                                    intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_NEW_TASK);
                                    startActivity(intent);
                                    dialog.dismiss();
                                }
                            }
                        });
                    }
                } else {
                    Toast.makeText(getApplicationContext(), "No user with this email !", Toast.LENGTH_SHORT).show();
                    Intent intent = new Intent(Remember_me_Activity.this, Welcom_activity.class);
                    intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_NEW_TASK);
                    startActivity(intent);
                    dialog.dismiss();
                }
            }

            @Override
            public void onCancelled(@NonNull DatabaseError error) {
                Toast.makeText(Remember_me_Activity.this, "Empty database !", Toast.LENGTH_SHORT).show();
                Intent intent = new Intent(Remember_me_Activity.this, Welcom_activity.class);
                intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(intent);
                dialog.dismiss();
            }
        });
    }


    @RequiresApi(api = Build.VERSION_CODES.M)
    public void Setting_Action_Bar_Status_Bar() {

        //Hiding action bar
        getSupportActionBar().hide();
        // setting the keyboard
        //Utils.setUpKeybaord(findViewById(R.id.parent), Remember_me_Activity.this);

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