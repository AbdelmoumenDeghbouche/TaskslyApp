package com.example.tasksly;

import static android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS;

import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.ContactsContract;
import android.view.View;
import android.view.WindowInsetsController;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;
import com.squareup.picasso.Picasso;

public class CongratsMembership extends AppCompatActivity {

    ImageView congrats , userImage ;
    TextView userName ;
    RelativeLayout backHome ;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_congrats_membership);
        Setting_ui();
        intialisation();
        SettingAnimation();
        initialUserImage_Name();
        handelingOnClicks();
    }

    public void handelingOnClicks(){
        backHome.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(CongratsMembership.this,Profile_activity.class));
            }
        });
    }
    public void initialUserImage_Name(){
        FirebaseDatabase.getInstance().getReference().child("Users").child(FirebaseAuth.getInstance().getCurrentUser().getUid()).addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(@NonNull DataSnapshot snapshot) {
                UserModel model = snapshot.getValue(UserModel.class);
                userName.setText(model.getName());
                if (!model.getImage().equals("")){
                    Picasso.get().load(model.getImage()).into(userImage);
                } else {
                    userImage.setImageResource(R.drawable.ic_avataaars);
                }
            }
            @Override
            public void onCancelled(@NonNull DatabaseError error) {
                userImage.setImageResource(R.drawable.ic_avataaars);
                userName.setText("User");
            }
        });
    }
    public void SettingAnimation(){
        congrats.setAnimation(AnimationUtils.loadAnimation(CongratsMembership.this, R.anim.congrats_animation));
        new Handler(Looper.getMainLooper()).postDelayed(new Runnable() {
            @Override
            public void run() {
                //Do something after 100ms
                congrats.setVisibility(View.GONE);
            }
        }, 5000);

    }
    public void intialisation(){
        congrats = findViewById(R.id.image);
        userImage = findViewById(R.id.user_picture);
        backHome = findViewById(R.id.back_home);
        userName = findViewById(R.id.user_name);
    }
    public void Setting_ui(){
        getSupportActionBar().hide();
        // changing the color of the status bar
        this.getWindow().setStatusBarColor(this.getColor(R.color.white));

        // to change the color of the icons in status bar to dark
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(APPEARANCE_LIGHT_STATUS_BARS, APPEARANCE_LIGHT_STATUS_BARS);
        }
        // to change the color of the icons in the navigation bar to dark
        getWindow().setNavigationBarColor(ContextCompat.getColor(CongratsMembership.this, R.color.white)); //setting bar color
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS, WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS);
        }
    }
}