package com.example.tasksly;

import static android.content.ContentValues.TAG;
import static android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS;

import android.annotation.SuppressLint;
import android.app.Dialog;
import android.app.TimePickerDialog;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsetsController;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.TimePicker;
import android.widget.Toast;

import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;
import androidx.fragment.app.DialogFragment;

import com.github.drjacky.imagepicker.ImagePicker;
import com.google.android.material.datepicker.MaterialDatePicker;
import com.google.android.material.datepicker.MaterialPickerOnPositiveButtonClickListener;

import java.net.URL;
import java.util.ArrayList;

public class TaskActivity extends AppCompatActivity implements AdapterView.OnItemSelectedListener, TimePickerDialog.OnTimeSetListener {
    MaterialDatePicker.Builder builder = MaterialDatePicker.Builder.datePicker().setTitleText("SELECT A DATE");
    final MaterialDatePicker materialDatePicker = builder.build();
    private Dialog add_task_dialogue;
    private Dialog add_desc_dialogue;
    private ImageView back_button_from_task_activity_to_main;
    private String[] categories = new String[Utils.getCategories_list().size() - 1];
    private Spinner spinner_categories;
    private LinearLayout linear_layout_scan_table_ocr_of_task, Linear_layout_add_task, Linear_layout_import_image, Linear_layout_Take_photo_by_camera, linear_layout_date_of_task, linear_layout_time_of_task, linear_layout_description_of_task;
    private EditText edit_text_name_of_the_task;
    private int selected_task_from_RV;
    private int selected_category;
    private EditText edit_text_desc_of_the_task;
    private Button btn_confirm_description;

    NetworkChangeListener networkChangeListener = new NetworkChangeListener();


    private String incoming_text_description_of_task_from_desc_activity;
    private TextView txt_date_of_the_task_in_task_activity, txt_time_of_task_in_activity_task;
    private int counter;

    @Override
    public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {


    }


    @Override
    public void onNothingSelected(AdapterView<?> parent) {


    }

    @SuppressLint("UseCompatLoadingForDrawables")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_task);
        getSupportActionBar().hide();
        add_task_dialogue = new Dialog(TaskActivity.this);
        add_task_dialogue.setContentView(R.layout.add_task_or_imort_image_dialogue);
        add_task_dialogue.getWindow().setBackgroundDrawable(getDrawable(R.drawable.background_of_dialogue_add_category));
        add_task_dialogue.getWindow().setLayout(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        add_task_dialogue.setCancelable(true);
        add_task_dialogue.getWindow().getAttributes().windowAnimations = R.style.animation_of_add_category;

        add_desc_dialogue = new Dialog(TaskActivity.this);
        add_desc_dialogue.setContentView(R.layout.editeesctiptioneftaskdialogue);
        add_desc_dialogue.getWindow().setBackgroundDrawable(getDrawable(R.drawable.background_of_dialogue_add_category));
        add_desc_dialogue.getWindow().setLayout(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        add_desc_dialogue.setCancelable(true);
        add_desc_dialogue.getWindow().getAttributes().windowAnimations = R.style.animation_of_add_category;

        Linear_layout_add_task = add_task_dialogue.findViewById(R.id.Linear_layout_add_task);
        Linear_layout_import_image = add_task_dialogue.findViewById(R.id.Linear_layout_import_image);
        Linear_layout_Take_photo_by_camera = add_task_dialogue.findViewById(R.id.Linear_layout_Take_photo_by_camera);
        edit_text_name_of_the_task = findViewById(R.id.edit_text_name_of_the_task);
        txt_date_of_the_task_in_task_activity = findViewById(R.id.txt_date_of_the_task_in_task_activity);
        linear_layout_date_of_task = findViewById(R.id.linear_layout_date_of_task);
        linear_layout_time_of_task = findViewById(R.id.linear_layout_time_of_task);
        txt_time_of_task_in_activity_task = findViewById(R.id.txt_time_of_task_in_activity_task);
        linear_layout_description_of_task = findViewById(R.id.linear_layout_description_of_task);

        btn_confirm_description = add_desc_dialogue.findViewById(R.id.btn_confirm_description);

        edit_text_desc_of_the_task = add_desc_dialogue.findViewById(R.id.edit_text_desc_of_the_task);


        Intent intent = getIntent();
        Task_Model task_model = intent.getParcelableExtra("TaskModel");

        if (null != intent) {
            edit_text_name_of_the_task.setText(task_model.getTask_title());
            txt_date_of_the_task_in_task_activity.setText(task_model.getDate());
            txt_time_of_task_in_activity_task.setText(task_model.getTime());


        }

        Intent intent1 = getIntent();

        Linear_layout_add_task.setClickable(false);
        Linear_layout_add_task.setVisibility(View.GONE);
        Linear_layout_add_task.setFocusable(false);


        Linear_layout_Take_photo_by_camera.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                add_task_dialogue.dismiss();
                ImagePicker.Companion.with(TaskActivity.this)
                        .crop()
                        .cameraOnly()
                        .start();

            }

        });
        Linear_layout_import_image.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                add_task_dialogue.dismiss();
                ImagePicker.Companion.with(TaskActivity.this)
                        .crop()
                        .galleryOnly()
                        .start();
            }
        });
        linear_layout_time_of_task.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                DialogFragment timePicker = new TimePickerFragment();
                timePicker.show(getSupportFragmentManager(), "time_picker");

            }
        });

        for (int i = 0; i < Utils.categories_list.size() - 1; i++) {
            categories[i] = Utils.categories_list.get(i).getCategory_name();

        }
        this.getWindow().setStatusBarColor(this.getColor(R.color.mainbluex));

        // to change the color of the icons in status bar to dark
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(APPEARANCE_LIGHT_STATUS_BARS, APPEARANCE_LIGHT_STATUS_BARS);
        }
        // to change the color of the icons in the navigation bar to dark
        getWindow().setNavigationBarColor(ContextCompat.getColor(TaskActivity.this, R.color.mainbluex)); //setting bar color
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS, WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS);
        }
        back_button_from_task_activity_to_main = findViewById(R.id.back_button_from_task_activity_to_main);

        linear_layout_scan_table_ocr_of_task = findViewById(R.id.linear_layout_scan_table_ocr_of_task);
        spinner_categories = findViewById(R.id.spinner_categories);
        spinner_categories.setOnItemSelectedListener(this);

        ArrayAdapter arrayAdapter = new ArrayAdapter(this, android.R.layout.simple_spinner_item, categories);
        arrayAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner_categories.setAdapter(arrayAdapter);
        linear_layout_scan_table_ocr_of_task.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                add_task_dialogue.show();

            }
        });
        linear_layout_date_of_task.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                datepicker();

            }
        });

        Intent intent3 = getIntent();
        String category_name = intent3.getStringExtra("category_name");
        Category_Model category_model = new Category_Model(category_name);
        spinner_categories.setSelection(Utils.getIndexOfCategoryModelByCategoryName(category_name));


        linear_layout_description_of_task.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick (View v) {
                add_desc_dialogue.show();
                edit_text_desc_of_the_task.setText(task_model.getDescription().toString());
                btn_confirm_description.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        task_model.setDescription(edit_text_desc_of_the_task.getText().toString());
                        add_desc_dialogue.dismiss();
                    }
                });

            }
        });

        back_button_from_task_activity_to_main.setOnClickListener(new View.OnClickListener() {
            @RequiresApi(api = Build.VERSION_CODES.N)
            @Override
            public void onClick(View v) {
                onBackPressed();
                String category_name = intent.getStringExtra("category_name");
                task_model.setTask_title(edit_text_name_of_the_task.getText().toString());
                task_model.setDate(txt_date_of_the_task_in_task_activity.getText().toString());
                task_model.setTime(txt_time_of_task_in_activity_task.getText().toString());
                selected_task_from_RV = intent1.getIntExtra("selected_task", -1);
                if (spinner_categories.getSelectedItem().toString().equals(category_name)) {
                    Toast.makeText(TaskActivity.this, "Task Updated successfully", Toast.LENGTH_SHORT).show();
                    task_model.setCategory(new Category_Model(category_name));
//                    task_model.setCategory(new Category_Model(categories[selected_category]));
                    ArrayList<Task_Model> the_new_array_list = new ArrayList<>();
                    the_new_array_list = Utils.category_map.get(category_name);
                    Log.d(TAG, "onClick: title" + task_model.getTask_title());
                    the_new_array_list.set(selected_task_from_RV, task_model);
                    Utils.category_map.replace(category_name, the_new_array_list);
                } else {
                    task_model.setCategory(new Category_Model(spinner_categories.getSelectedItem().toString()));
                    ArrayList<Task_Model> the_new_array_list = new ArrayList<>();
                    the_new_array_list = Utils.category_map.get(category_name);
                    the_new_array_list.remove(selected_task_from_RV);
                    Utils.category_map.replace(category_name, the_new_array_list);
                    the_new_array_list = Utils.category_map.get(spinner_categories.getSelectedItem().toString());
                    the_new_array_list.add(the_new_array_list.size(), task_model);
                    Utils.category_map.replace(spinner_categories.getSelectedItem().toString(), the_new_array_list);


                }


            }
        });

    }


    public void datepicker() {
        materialDatePicker.show(TaskActivity.this.getSupportFragmentManager(), "DATE_PICKER");
        materialDatePicker.addOnPositiveButtonClickListener(new MaterialPickerOnPositiveButtonClickListener() {
            @Override
            public void onPositiveButtonClick(Object selection) {
                txt_date_of_the_task_in_task_activity.setText(materialDatePicker.getHeaderText());
            }
        });
    }


    @Override
    public void onTimeSet(TimePicker view, int hourOfDay, int minute) {

        txt_time_of_task_in_activity_task = findViewById(R.id.txt_time_of_task_in_activity_task);
        txt_time_of_task_in_activity_task.setText(hourOfDay + ":" + minute);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        Uri uri = data.getData();
        if (uri != null) {
            URL url = Utils.ParseUrl(uri);
            if (null != url) {
                Utils.OcrExtraction(url.toString());
                Toast.makeText(this, "Image Uploaded Successfully", Toast.LENGTH_SHORT).show();
            } else {
                Toast.makeText(this, "Operation Failed Please Upload the Image Again", Toast.LENGTH_LONG).show();


            }
        } else {
            Toast.makeText(this, "Please Upload Your Photo", Toast.LENGTH_LONG).show();
        }
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
