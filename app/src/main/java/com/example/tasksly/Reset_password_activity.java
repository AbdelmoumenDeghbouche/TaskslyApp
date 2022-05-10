package com.example.tasksly;

import static android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS;

import android.content.Intent;
import android.graphics.Color;
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

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.Task;
import com.google.android.material.textfield.TextInputLayout;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

public class Reset_password_activity extends AppCompatActivity {

    ProgressBar progressBar;
    RelativeLayout SubmitButton, doneButton;
    TextView maintext, secondtext;
    ImageView mainImage;
    TextInputLayout passwordlayout, confirmpasswordlayout;
    String userPassword, userConfirmPassword;
    DatabaseReference Root;
    FirebaseAuth auth = FirebaseAuth.getInstance();
    UserModel oldUser = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_reset_password);
//setting the status bar , action bar colors , keyboard interaction
        Setting_Action_Bar_Status_Bar();

        initialisation();
        handlingAnimation();
        hadlingOnClicks();
    }

    private void hadlingOnClicks() {
        SubmitButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                progressBar.setVisibility(View.VISIBLE);
                gettingUserData();
                if (userPassword.isEmpty() || userConfirmPassword.isEmpty()) {
                    Toast.makeText(Reset_password_activity.this, "Please enter all your passwords !", Toast.LENGTH_SHORT).show();
                    progressBar.setVisibility(View.GONE);
                } else if (userPassword.length() < 7) {
                    Toast.makeText(Reset_password_activity.this, "Password too short !", Toast.LENGTH_SHORT).show();
                    progressBar.setVisibility(View.GONE);
                } else if (!userPassword.equals(userConfirmPassword)) {
                    Toast.makeText(Reset_password_activity.this, "The passwords are note the same !", Toast.LENGTH_SHORT).show();
                    progressBar.setVisibility(View.GONE);
                } else if (userPassword.equals(getIntent().getStringExtra("oldpassword"))) {
                    // means that the new password must be different from the old password that is stored in the firebase database
                    Toast.makeText(Reset_password_activity.this, "This is the same as your old password !", Toast.LENGTH_SHORT).show();
                    progressBar.setVisibility(View.GONE);
                } else {
//                    we gave it the new password entered by the user as a parameter
                    updatePassword2(userPassword);
                }
            }
        });
    }

    private void handlingAnimation() {
        Animations.FromUpToDown(mainImage);
        Animations.FromeLeftToRight(maintext);
        Animations.FromeLeftToRight1(secondtext);
        Animations.FromeRightToLeftEditetext(passwordlayout);
        Animations.FromeRightToLeftEditetext1(confirmpasswordlayout);
        Animations.FromeRightToLeft(SubmitButton);
    }

    public void initialisation() {
        SubmitButton = findViewById(R.id.reset_password_submit_button);
        maintext = findViewById(R.id.reset_password_main_text);
        secondtext = findViewById(R.id.reset_password_second_text);
        mainImage = findViewById(R.id.reset_password_image);
        passwordlayout = findViewById(R.id.reset_password_layout);
        confirmpasswordlayout = findViewById(R.id.reset_confirm_password_layout);
        progressBar = findViewById(R.id.pprogres);
    }

    private void updatePassword2(String userPassword) {
// this is the email of the account that the user wants to change the password for
        String email = getIntent().getStringExtra("email");

        Root = FirebaseDatabase.getInstance().getReference();
        Root.child("Users").addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(@NonNull DataSnapshot snapshot) {
                UserModel oldUser = null;
                // checking if the user with email exists
                for (DataSnapshot user : snapshot.getChildren()) {
                    if (user.getValue(UserModel.class).getEmail() != null) {
                        // searching for accounts that have the same email account because every single account have a specific email account
                        if (user.getValue(UserModel.class).getEmail().equals(email)) {
                            oldUser = user.getValue(UserModel.class);
                            // means that we have found an account with the same email account
                            if (oldUser != null) {
                                // means that we have this user account in this oldUser variable , and now we will update the password
                                Root.child("Users").child(user.getKey()).child("password").setValue(userPassword).addOnCompleteListener(new OnCompleteListener<Void>() {
                                    // here we have updated the user password but just in the firebase realTime database , and not in the authentication
                                    @Override
                                    public void onComplete(@NonNull Task<Void> task) {
                                        if (task.isSuccessful()) {
                                            auth.sendPasswordResetEmail(email).addOnCompleteListener(new OnCompleteListener<Void>() {
                                                @Override
                                                public void onComplete(@NonNull Task<Void> task) {
                                                    if (task.isSuccessful()) {
                                                        progressBar.setVisibility(View.GONE);
                                                        Intent intent = new Intent(Reset_password_activity.this, Confirme_password_email_Activity.class);
                                                        intent.putExtra("email", getIntent().getStringExtra("email"));
                                                        intent.putExtra("password", passwordlayout.getEditText().getText().toString().trim());
                                                        startActivity(intent);
                                                        Toast.makeText(Reset_password_activity.this, "You need to confirm your password in the link we sent to your email !", Toast.LENGTH_LONG).show();
                                                        auth.signOut();
                                                    } else {
                                                        progressBar.setVisibility(View.GONE);
                                                        Toast.makeText(Reset_password_activity.this, task.getException().getMessage(), Toast.LENGTH_SHORT).show();
                                                    }
                                                }
                                            }).addOnFailureListener(new OnFailureListener() {
                                                @Override
                                                public void onFailure(@NonNull Exception e) {
                                                    progressBar.setVisibility(View.GONE);
                                                    Toast.makeText(Reset_password_activity.this, e.getMessage(), Toast.LENGTH_SHORT).show();
                                                }
                                            });
                                        } else {
                                            Toast.makeText(Reset_password_activity.this, task.getException().getMessage(), Toast.LENGTH_SHORT).show();
                                            progressBar.setVisibility(View.GONE);
                                        }
                                    }
                                });
                            } else {
                                Toast.makeText(Reset_password_activity.this, "Can't find this user !", Toast.LENGTH_SHORT).show();
                                progressBar.setVisibility(View.GONE);
                            }
                            break;
                        }
                    }
                }
            }

            @Override
            public void onCancelled(@NonNull DatabaseError error) {
                progressBar.setVisibility(View.GONE);
            }
        });
    }

    @RequiresApi(api = Build.VERSION_CODES.M)
    public void Setting_Action_Bar_Status_Bar() {

        //Hiding action bar
        getSupportActionBar().hide();
        // setting the keyboard
        Utils.setUpKeybaord(findViewById(R.id.resetpassword), Reset_password_activity.this);

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
        userPassword = passwordlayout.getEditText().getText().toString().trim();
        userConfirmPassword = confirmpasswordlayout.getEditText().getText().toString().trim();
    }

}