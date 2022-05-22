package com.example.tasksly;

import static android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS;

import android.app.Dialog;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsetsController;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;

import com.chaos.view.PinView;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;
import com.squareup.picasso.Picasso;

public class Profile_activity extends AppCompatActivity {

    LinearLayout join_membership,PlanningLayout, private_tasks_layout, CompletedLayout, CancelledLayout, TotalLayout ,edit;
    RelativeLayout relative_layout_submitting_pin_code_private_tasks_first_time;
    PinView pin_code_private_tasks_first_time;
    TextView user_name , user_email,text_pin_code_submission_head ;
    ImageView user_image ;
    Dialog Pin_code_submission_of_private_tasks_first_time;
    NetworkChangeListener networkChangeListener = new NetworkChangeListener();
    DatabaseReference root = FirebaseDatabase.getInstance().getReference();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_profile);
        getSupportActionBar().hide();
        Pin_code_submission_of_private_tasks_first_time = new Dialog(Profile_activity.this);
        Pin_code_submission_of_private_tasks_first_time.setContentView(R.layout.private_tasks_pin_dialogue);
        Pin_code_submission_of_private_tasks_first_time.getWindow().setBackgroundDrawable(getDrawable(R.drawable.background_of_dialogue_add_category));
        Pin_code_submission_of_private_tasks_first_time.getWindow().setLayout(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        Pin_code_submission_of_private_tasks_first_time.setCancelable(true);
        Pin_code_submission_of_private_tasks_first_time.getWindow().getAttributes().windowAnimations = R.style.animation_of_add_category;

        relative_layout_submitting_pin_code_private_tasks_first_time = Pin_code_submission_of_private_tasks_first_time.findViewById(R.id.relative_layout_submitting_pin_code_private_tasks_first_time);
        pin_code_private_tasks_first_time = Pin_code_submission_of_private_tasks_first_time.findViewById(R.id.pin_code_private_tasks_first_time);
        text_pin_code_submission_head = Pin_code_submission_of_private_tasks_first_time.findViewById(R.id.text_pin_code_submission_head);




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
        private_tasks_layout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Profile_activity.this,DifferentTasksListActivity.class);
                if (Utils.private_task_pin_code.equals("")){
                    Pin_code_submission_of_private_tasks_first_time.show();
                    relative_layout_submitting_pin_code_private_tasks_first_time.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            if (pin_code_private_tasks_first_time.getText().toString().trim().length()<4){
                                Toast.makeText(Profile_activity.this, "Please Enter The PIN code correctly", Toast.LENGTH_SHORT).show();
                            }
                            else {
                                Utils.private_task_pin_code = pin_code_private_tasks_first_time.getText().toString().trim();
                                intent.putExtra("NameOfActivity","Private Tasks");
                                Pin_code_submission_of_private_tasks_first_time.dismiss();
                                pin_code_private_tasks_first_time.setText("");
                                startActivity(intent);
                            }

                        }
                    });
                }
                else {
                    Pin_code_submission_of_private_tasks_first_time.show();
                    text_pin_code_submission_head.setText("PIN CODE \n Submission !");
                    relative_layout_submitting_pin_code_private_tasks_first_time.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            if (pin_code_private_tasks_first_time.getText().toString().trim().length()<4){
                                Toast.makeText(Profile_activity.this, "Please Enter The PIN code correctly", Toast.LENGTH_SHORT).show();
                            }
                            else {
                                if (pin_code_private_tasks_first_time.getText().toString().trim().equals(Utils.private_task_pin_code)){
                                    intent.putExtra("NameOfActivity","Private Tasks");
                                    Pin_code_submission_of_private_tasks_first_time.dismiss();
                                    pin_code_private_tasks_first_time.setText("");
                                    startActivity(intent);
                                }
                                else {
                                    Toast.makeText(Profile_activity.this, "Wrong PIN Code Please Check and try again", Toast.LENGTH_SHORT).show();
                                }
                            }

                        }
                    });



                }

            }
        });
        PlanningLayout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Profile_activity.this,DifferentTasksListActivity.class);
                intent.putExtra("NameOfActivity","Planning Tasks");
                startActivity(intent);
            }
        });
        CompletedLayout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Profile_activity.this,DifferentTasksListActivity.class);
                intent.putExtra("NameOfActivity","Completed Tasks");
                startActivity(intent);
            }
        });
        TotalLayout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Profile_activity.this,DifferentTasksListActivity.class);
                intent.putExtra("NameOfActivity","All Tasks");
                startActivity(intent);
            }
        });
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
        private_tasks_layout = findViewById(R.id.private_tasks_layout);
        CompletedLayout = findViewById(R.id.completed_tasks_layout);
        CancelledLayout = findViewById(R.id.canceled_tasks_layout);
        TotalLayout = findViewById(R.id.total_tasks_layout);
    }

    public void handelingAnimations(){
        Animations.FromeLeftToRightLinear(PlanningLayout);
        Animations.FromeLeftToRightLinear1(private_tasks_layout);
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


