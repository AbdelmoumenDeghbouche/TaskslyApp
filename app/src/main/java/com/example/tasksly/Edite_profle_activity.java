package com.example.tasksly;

import static android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS;

import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.view.WindowInsetsController;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
import com.google.android.material.dialog.MaterialAlertDialogBuilder;
import com.google.android.material.textfield.TextInputLayout;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;
import com.google.firebase.storage.FirebaseStorage;
import com.google.firebase.storage.StorageReference;
import com.google.firebase.storage.UploadTask;
import com.squareup.picasso.Picasso;

public class Edite_profle_activity extends AppCompatActivity {

    LinearLayout select_picture;
    TextInputLayout namelayout, numberlayout;
    TextView email_text, userNametext;
    RelativeLayout done_button;
    DatabaseReference root;
    ImageView user_image;
    Uri image_uri;
    MaterialAlertDialogBuilder progressDialog;

    AlertDialog dialog;
    ProgressBar progressBar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_edite_profle);
        setting_ui();

        initialisation();
        initialise_text_views();
        handelingOnClicks();

    }

    public void setting_ui() {
// changing the color of the status bar
        this.getWindow().setStatusBarColor(this.getColor(R.color.white));
        getSupportActionBar().hide();

        // to change the color of the icons in status bar to dark
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(APPEARANCE_LIGHT_STATUS_BARS, APPEARANCE_LIGHT_STATUS_BARS);
        }
        // to change the color of the icons in the navigation bar to dark
        getWindow().setNavigationBarColor(ContextCompat.getColor(Edite_profle_activity.this, R.color.white)); //setting bar color
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS, WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS);
        }
    }

    public void initialisation() {
        progressBar = findViewById(R.id.progrres);
        root = FirebaseDatabase.getInstance().getReference();
        user_image = findViewById(R.id.user_picture);
        select_picture = findViewById(R.id.select_image);
        namelayout = findViewById(R.id.name_layout);
        numberlayout = findViewById(R.id.phone_layout);
        email_text = findViewById(R.id.email_text);
        userNametext = findViewById(R.id.name_text);
        done_button = findViewById(R.id.Done);
        progressDialog = new MaterialAlertDialogBuilder(this);

    }

    public void handelingOnClicks() {
        select_picture.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // its let us open a window that makes us able to select a picture from owr device
                Intent intent = new Intent();
                intent.setType("image/*");
                intent.setAction(Intent.ACTION_GET_CONTENT);
                startActivityForResult(intent.createChooser(intent, "pick an image !"), 10);
                user_image.setClickable(false);
            }
        });
        done_button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (namelayout.getEditText().getText().toString().isEmpty() || numberlayout.getEditText().getText().toString().toString().isEmpty()) {
                    Toast.makeText(Edite_profle_activity.this, "All fields must be full !", Toast.LENGTH_SHORT).show();
                } else {
                    progressDialog.setTitle("Wait a minute please !");
                    progressDialog.setMessage("Your profile is being updated  ...");
                    progressDialog.setCancelable(false);
                    progressDialog.setBackground(getResources().getDrawable(R.drawable.tasks_background));
                    progressDialog.setIcon(R.drawable.ic_refresh);
                    progressDialog.setCancelable(false);
                    dialog = progressDialog.show();
                    dialog.show();

                    Update_User(image_uri, namelayout.getEditText().getText().toString(), numberlayout.getEditText().getText().toString());
                }
            }
        });
    }

    public void initialise_text_views() {
        root.child("Users").child(FirebaseAuth.getInstance().getCurrentUser().getUid()).addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(@NonNull DataSnapshot snapshot) {
                if (snapshot.exists()) {
                    progressBar.setVisibility(View.GONE);
                    UserModel model = snapshot.getValue(UserModel.class);
                    userNametext.setText(model.getName());
                    email_text.setText(model.getEmail());
                    namelayout.getEditText().setText(model.getName());
                    numberlayout.getEditText().setText("0" + model.getPhonenumber());
                    if (!snapshot.getValue(UserModel.class).getImage().equals("")) {
                        Picasso.get().load(model.getImage()).into(user_image);
                    } else {
                        user_image.setImageResource(R.drawable.ic_avataaars);
                    }
                } else {
                    progressBar.setVisibility(View.GONE);
                    userNametext.setText("user");
                    email_text.setText("email");
                    user_image.setImageResource(R.drawable.ic_avataaars);
                }
            }

            @Override
            public void onCancelled(@NonNull DatabaseError error) {
                userNametext.setText("user");
                email_text.setText("email");
                user_image.setImageResource(R.drawable.ic_avataaars);
                progressBar.setVisibility(View.GONE);
            }
        });
    }

    public void Update_User(Uri image, String name, String number) {
        root.child("Users").child(FirebaseAuth.getInstance().getCurrentUser().getUid()).child("name").setValue(name).addOnCompleteListener(new OnCompleteListener<Void>() {
            @Override
            public void onComplete(@NonNull Task<Void> task) {
                if (task.isSuccessful()) {
                    root.child("Users").child(FirebaseAuth.getInstance().getCurrentUser().getUid()).child("phonenumber").setValue(Integer.parseInt(number)).addOnCompleteListener(new OnCompleteListener<Void>() {
                        @Override
                        public void onComplete(@NonNull Task<Void> task) {
                            if (task.isSuccessful()) {
                                if (image != null) { // the user changed his profile image  , so we will charge his new profile picture
                                    StorageReference storage = FirebaseStorage.getInstance().getReference().child("Users pictures").child((FirebaseAuth.getInstance().getCurrentUser().getUid()));
                                    storage.putFile(image).addOnCompleteListener(new OnCompleteListener<UploadTask.TaskSnapshot>() {
                                        // we charge the new image in the storage firebase after that we charge it in the real time data base
                                        @Override
                                        public void onComplete(@NonNull Task<UploadTask.TaskSnapshot> task) {
                                            // which means that we have uploaded the image to the firebase
                                            // and now we are going to get our image uri as a string
                                            if (task.isSuccessful()) {
                                                storage.getDownloadUrl().addOnSuccessListener(new OnSuccessListener<Uri>() {
                                                    @Override
                                                    public void onSuccess(Uri uri) {
                                                        // this uri makes us able to charge the image in the imageview every time ( its like url )
                                                        root.child("Users").child(FirebaseAuth.getInstance().getCurrentUser().getUid()).child("image").setValue(uri.toString()).addOnCompleteListener(new OnCompleteListener<Void>() {
                                                            @Override
                                                            public void onComplete(@NonNull Task<Void> task) {
                                                                if (task.isSuccessful()) {
                                                                    Toast.makeText(Edite_profle_activity.this, "Profile updated successfully !", Toast.LENGTH_SHORT).show();
                                                                    dialog.dismiss();
                                                                    startActivity(new Intent(Edite_profle_activity.this, MainActivity.class));
                                                                } else {
                                                                    Toast.makeText(Edite_profle_activity.this, task.getException().getMessage(), Toast.LENGTH_SHORT).show();
                                                                    dialog.dismiss();
                                                                }
                                                            }
                                                        });
                                                    }
                                                });
                                            } else {
                                                Toast.makeText(Edite_profle_activity.this, task.getException().getMessage(), Toast.LENGTH_SHORT).show();
                                                dialog.dismiss();
                                            }
                                        }
                                    });
                                } else {
                                    Toast.makeText(Edite_profle_activity.this, "Profile updated successfully !", Toast.LENGTH_SHORT).show();
                                    dialog.dismiss();
                                    startActivity(new Intent(Edite_profle_activity.this, MainActivity.class));
                                }
                            } else { // the user did not change his profile image
                                Toast.makeText(Edite_profle_activity.this, task.getException().getMessage(), Toast.LENGTH_SHORT).show();
                                dialog.dismiss();
                            }
                        }
                    });
                } else {
                    Toast.makeText(Edite_profle_activity.this, task.getException().getMessage(), Toast.LENGTH_SHORT).show();
                    dialog.dismiss();
                }
            }
        });
    }

    // gets the image that we select from our phone and puts it in the imageuri variable
    @Override
    public void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == 10 && resultCode == -1 && data != null && data.getData() != null) {
            // this is the uri of the image that w have selected from the Phone Gallery
            image_uri = data.getData();
            user_image.setImageURI(image_uri);
            Toast.makeText(Edite_profle_activity.this, "Image selected successfully !", Toast.LENGTH_SHORT).show();
        }
    }
}