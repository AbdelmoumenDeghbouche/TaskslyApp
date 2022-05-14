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
import androidx.appcompat.app.AppCompatActivity;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.android.material.textfield.TextInputLayout;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

public class Forget_password_activity extends AppCompatActivity {

    RelativeLayout SubmitButton;
    TextView maintext, secondtext;
    ImageView mainImage;
    TextInputLayout emaillayout;
    String userEmail;
    DatabaseReference Root;
    ProgressBar progressBar;
    String emailPattern = "[a-zA-Z0-9._-]+@[a-z]+\\.+[a-z]+";
    FirebaseAuth auth = FirebaseAuth.getInstance();
    UserModel oldUser = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_forget_password);
//setting the status bar , action bar colors , keyboard interaction
        Setting_Action_Bar_Status_Bar();

        initialisation();
        handlingAnimation();
        hadlingOnClicks();
    }


    private void handlingAnimation() {
        Animations.FromUpToDown(mainImage);
        Animations.FromeLeftToRight(maintext);
        Animations.FromeLeftToRight1(secondtext);
        Animations.FromeRightToLeftEditetext2(emaillayout);
        Animations.FromeRightToLeft(SubmitButton);
    }

    public void initialisation() {
        Root = FirebaseDatabase.getInstance().getReference();
        SubmitButton = findViewById(R.id.forget_password_submit_button);
        maintext = findViewById(R.id.signup_main_text);
        mainImage = findViewById(R.id.forget_password_image);
        emaillayout = findViewById(R.id.forget_password_email_layout);
        secondtext = findViewById(R.id.signup_second_text);
        progressBar = findViewById(R.id.progres);
    }

    public void hadlingOnClicks() {
        SubmitButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                gettingUserData();

                if (userEmail.isEmpty()) {
                    Toast.makeText(Forget_password_activity.this, "Please enter your email !", Toast.LENGTH_SHORT).show();
                } else if (!userEmail.matches(emailPattern)) {
                    Toast.makeText(Forget_password_activity.this, "Invalid Email form !", Toast.LENGTH_SHORT).show();
                } else {
                    progressBar.setVisibility(View.VISIBLE);
                    verifyingEmailUser(userEmail);
                }
            }
        });
    }

    private void verifyingEmailUser(String email) {
        // method 1 ( we can use this method in the previous code of login , favorite items ... will give us the same result )
//        Root.child("Users").orderByChild("email").equalTo(email).addListenerForSingleValueEvent(new ValueEventListener() {
//            @Override
//            public void onDataChange(@NonNull DataSnapshot snapshot) {
//                if (snapshot.exists()) {
//                    // means that there is this email register in the firebase database
//                    Intent intent = new Intent(Forget_password_activity.this, Phone_number_activity.class) ;
//                    intent.putExtra("email",email);
//                    startActivity(intent);
//                    progressBar.setVisibility(View.GONE);
//                } else {
//                    Toast.makeText(Forget_password_activity.this, "No account found with this email !", Toast.LENGTH_SHORT).show();
//                    progressBar.setVisibility(View.GONE);
//                }
//            }
//
//            @Override
//            public void onCancelled(@NonNull DatabaseError error) {
//                progressBar.setVisibility(View.GONE);
//            }
//        });

        // method 2

        Root.child("Users").addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(@NonNull DataSnapshot snapshot) {
                // checking if the user with email exists
                for (DataSnapshot user : snapshot.getChildren()) {
                    if (user.getValue(UserModel.class).getEmail() != null) {
                        if (user.getValue(UserModel.class).getEmail().equals(email)) {
                            oldUser = user.getValue(UserModel.class);
                            break;
                        }
                    }
                }
                if (oldUser != null) {
                    // means that there is this email register in the fire base database , and we are signing with it to see it it works and to help us in the update
                    auth.signOut();
                    // we are signing in with the ser account that have's the old password to delete it after
                    auth.signInWithEmailAndPassword(email, oldUser.getPassword()).addOnCompleteListener(new OnCompleteListener<AuthResult>() {
                        @Override
                        public void onComplete(@NonNull Task<AuthResult> task) {
                            if (task.isSuccessful()) {
                                // we are going to send the email and the old password of this user
                                Intent intent = new Intent(Forget_password_activity.this, Phone_number_activity.class);
                                intent.putExtra("email", email);
                                intent.putExtra("oldpassword", oldUser.getPassword());
                                intent.putExtra("phonenumber", String.valueOf(oldUser.getPhonenumber()));
                                Log.d("old password for this user ========> ", oldUser.getPassword());
                                startActivity(intent);
                                progressBar.setVisibility(View.GONE);
                            } else {
                                Toast.makeText(Forget_password_activity.this, task.getException().getMessage(), Toast.LENGTH_SHORT).show();
                                progressBar.setVisibility(View.GONE);
                            }
                        }
                    });
                } else {
                    Toast.makeText(Forget_password_activity.this, "No account found with this email !", Toast.LENGTH_SHORT).show();
                    progressBar.setVisibility(View.GONE);
                }
            }

            @Override
            public void onCancelled(@NonNull DatabaseError error) {
                progressBar.setVisibility(View.GONE);
            }
        });
    }

    public void Setting_Action_Bar_Status_Bar() {

        //Hiding action bar
        getSupportActionBar().hide();
        // setting the keyboard
        Utils.setUpKeybaord(findViewById(R.id.parent), Forget_password_activity.this);

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
        userEmail = emaillayout.getEditText().getText().toString().trim();
    }

}