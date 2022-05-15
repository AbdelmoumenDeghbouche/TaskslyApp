package com.example.tasksly;

import static android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS;

import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.view.WindowInsetsController;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
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

public class Profile_activity extends AppCompatActivity {

    LinearLayout PlanningLayout, PendingLayout, CompletedLayout, CancelledLayout, TotalLayout ,edit;
    TextView user_name , user_email ;
    ImageView user_image ;
    Button join_membership;
    DatabaseReference root = FirebaseDatabase.getInstance().getReference();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_profile);
        getSupportActionBar().hide();
        join_membership=findViewById(R.id.join_membership);
        join_membership.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent=new Intent(Profile_activity.this,PayActivity.class);
                startActivity(intent);
            }
        });
        // changing the color of the status bar
        this.getWindow().setStatusBarColor(this.getColor(R.color.white));

        // to change the color of the icons in status bar to dark
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(APPEARANCE_LIGHT_STATUS_BARS, APPEARANCE_LIGHT_STATUS_BARS);
        }
        // to change the color of the icons in the navigation bar to dark
        getWindow().setNavigationBarColor(ContextCompat.getColor(Profile_activity.this, R.color.white)); //setting bar color
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS, WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS);
        }

        initialisation();
        handelingAnimations();
        initial_elements();

        edit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(Profile_activity.this,Edite_profle_activity.class));
            }
        });

    }

    public void initialisation() {
        user_email = findViewById(R.id.user_email);
        user_name = findViewById(R.id.user_name);
        user_image = findViewById(R.id.img_user_profile);
        edit = findViewById(R.id.Edite_profile);
        PlanningLayout = findViewById(R.id.planing_layout);
        PendingLayout = findViewById(R.id.running_tasks_layout);
        CompletedLayout = findViewById(R.id.completed_tasks_layout);
        CancelledLayout = findViewById(R.id.canceled_tasks_layout);
        TotalLayout = findViewById(R.id.total_tasks_layout);
    }

    public void handelingAnimations(){
        Animations.FromeLeftToRightLinear(PlanningLayout);
        Animations.FromeLeftToRightLinear1(PendingLayout);
        Animations.FromeLeftToRightLinear2(CompletedLayout);
        Animations.FromeLeftToRightLinear3(CancelledLayout);
        Animations.FromeLeftToRightLinear4(TotalLayout);

    }

    public void initial_elements(){
        root.child("Users").child(FirebaseAuth.getInstance().getCurrentUser().getUid()).addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(@NonNull DataSnapshot snapshot) {
                if (snapshot.exists()){
                    UserModel model = snapshot.getValue(UserModel.class);
                    user_name.setText(model.getName());
                    user_email.setText(model.getEmail());
                    if (!model.getImage().equals("")){
                        Picasso.get().load(model.getImage()).into(user_image);
                    } else {
                        user_image.setImageResource(R.drawable.ic_avataaars);
                    }
                }
            }
            @Override
            public void onCancelled(@NonNull DatabaseError error) {

            }
        });
    }

}