package com.example.tasksly;

import static android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS;
import static com.yalantis.ucrop.UCropFragment.TAG;

import android.annotation.SuppressLint;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.WindowInsetsController;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.google.android.material.datepicker.MaterialDatePicker;
import com.google.android.material.datepicker.MaterialPickerOnPositiveButtonClickListener;
import com.google.android.material.dialog.MaterialAlertDialogBuilder;
import com.google.android.material.timepicker.MaterialTimePicker;
import com.google.android.material.timepicker.TimeFormat;
import com.google.gson.Gson;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.TimeZone;

public class Add_task extends AppCompatActivity {
    int Notification_year;
    int Notification_day;
    int Notification_month;
    private long notificationId = 1;
    Calendar calendar;
    EditText TaskTitle;
    RecyclerView recyclerView;
    RelativeLayout relativeLayout, relativeLayout2, task_done_button;
    public static Categoty_list_adapter adapter;
    boolean is_clicked;
    TextView select_date_text, select_time_text;
    LinearLayout select_date_button, select_time_button;
    MaterialTimePicker materialTimePicker = new MaterialTimePicker.Builder()
            .setTitleText("SELECT A TIME")
            .setTimeFormat(TimeFormat.CLOCK_12H)
            .build();
    MaterialAlertDialogBuilder progressDialog;
    public static AlertDialog dialog;
    MaterialDatePicker.Builder builder = MaterialDatePicker.Builder.datePicker().setTitleText("SELECT A DATE");
    final MaterialDatePicker materialDatePicker = builder.build();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_task);
        getSupportActionBar().hide();


        // changing the color of the status bar
        this.getWindow().setStatusBarColor(this.getColor(R.color.white));

        // to change the color of the icons in status bar to dark
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(APPEARANCE_LIGHT_STATUS_BARS, APPEARANCE_LIGHT_STATUS_BARS);
        }
        // to change the color of the icons in the navigation bar to dark
        getWindow().setNavigationBarColor(ContextCompat.getColor(Add_task.this, R.color.white)); //setting bar color
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS, WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS);
        }


        AssingElements();
        Handlingonoffclicks();
        Utils.initCategories(); // charging the arraylist with the categories
        ArrayList<Category_Model> categories = Utils.getCategories_list(); // this function is returning the arraylist that we charged in the precedent line

        // setting the categories recycler view

        adapter = new Categoty_list_adapter(getApplicationContext());
        recyclerView.setAdapter(adapter);
        LinearLayoutManager linearLayoutManager = new LinearLayoutManager(getApplicationContext(), LinearLayoutManager.HORIZONTAL, false);
        recyclerView.setLayoutManager(linearLayoutManager);
        adapter.setCategories(categories);
        // this is a date picker algorithm
        datepicker();
        timepicker();
        //when done is pressed
        donepressed();
    }

    public void AssingElements() {

        relativeLayout = findViewById(R.id.On_relalive_layout);
        relativeLayout2 = findViewById(R.id.Off_relalive_layout);
        recyclerView = findViewById(R.id.creat_task_recyclerview);
        TaskTitle = findViewById(R.id.add_task_title);
        task_done_button = findViewById(R.id.task_done_button);
        is_clicked = true;
        task_done_button = findViewById(R.id.task_done_button);
        select_date_text = findViewById(R.id.select_date_text);
        select_time_text = findViewById(R.id.select_time_text);
        select_date_button = findViewById(R.id.select_date_button);
        select_time_button = findViewById(R.id.select_time_button);

    }

    public void Handlingonoffclicks() {

        // handling on off clicks

        findViewById(R.id.parent_layout).setOnClickListener(new View.OnClickListener() {
            @SuppressLint("ResourceAsColor")
            @Override
            public void onClick(View view) {
                if (is_clicked) {
                    relativeLayout.setVisibility(View.GONE);
                    relativeLayout2.setVisibility(View.VISIBLE);
                } else {
                    relativeLayout.setVisibility(View.VISIBLE);
                    relativeLayout2.setVisibility(View.GONE);
                }
                is_clicked = !is_clicked;
            }
        });

//        task_done_button.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//            }
//        });

    }

    public void donepressed() {
        task_done_button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (TaskTitle.getText().toString().equals("")) {
                    Toast.makeText(Add_task.this, "Please Fill The title of your task", Toast.LENGTH_SHORT).show();
                } else {
                    String time = "", date = "";

                    try {
                        time = materialTimePicker.getHour() + ":" + materialTimePicker.getMinute();
                        //date = materialDatePicker.getHeaderText();
                        // here we will create the time that we will put in the notification


                    } catch (NullPointerException e) {
                        Log.d(TAG, "onClick: " + e);
                    }
                    Gson gson = new Gson();
                    date = select_date_text.getText().toString().trim();

                    // this date and time variables are used just to create a different parent for very child

                    String date_now = new SimpleDateFormat("MM/dd/yyyy").format(Calendar.getInstance().getTime());
                    String time_now = new SimpleDateFormat("HH:mm:ss a").format(Calendar.getInstance().getTime());
                    Task_Model task_model = new Task_Model(TaskTitle.getText().toString(), time, date, Utils.getCategories_list().get(adapter.getRow_index()), null, is_clicked, date_now, time_now);
                    task_model.setDescription("");
                    progressDialog = new MaterialAlertDialogBuilder(Add_task.this);
                    progressDialog.setTitle("Wait a minute please !");
                    progressDialog.setMessage("We are saving your task...");
                    progressDialog.setCancelable(false);
                    progressDialog.setBackground(getResources().getDrawable(R.drawable.tasks_background));
                    progressDialog.setIcon(R.drawable.ic__cloud_upload);
                    progressDialog.setCancelable(false);
                    dialog = progressDialog.show();
                    dialog.show();


                    // adding task to firebase

                    Utils.AddTaskToFirebase(task_model);
                    Tasks_fragment.adapter.notifyDataSetChanged();

                    // initializing thr notification ...


                    notificationId  = Long.parseLong(String.valueOf(System.currentTimeMillis()));

                    Intent intent = new Intent(Add_task.this, AlarmReceiver.class);
                    intent.putExtra("notificationId", notificationId);
                    intent.putExtra("message", task_model.getTask_title());

                    PendingIntent alarmIntent = PendingIntent.getBroadcast(Add_task.this, 0, intent, PendingIntent.FLAG_IMMUTABLE);

                    AlarmManager alarmManager = (AlarmManager) getSystemService(ALARM_SERVICE);

                    // set hour and minute alarm
                    int hour = materialTimePicker.getHour();
                    int minute = materialTimePicker.getMinute();

                    Calendar startTime = Calendar.getInstance();

                    // to make for us the format of the date year-month-day
                    datepicker();

                    // set day and month and year alarm

                    startTime.set(Calendar.YEAR, Notification_year);
                    startTime.set(Calendar.MONTH, Notification_month);
                    startTime.set(Calendar.DAY_OF_MONTH, Notification_day);
                    startTime.set(Calendar.HOUR_OF_DAY, hour);
                    startTime.set(Calendar.MINUTE, minute);
                    startTime.set(Calendar.SECOND, 0);
                    startTime.set(Calendar.MILLISECOND, 0);
                    long alarmStartTime = startTime.getTimeInMillis();


                    Log.d("yeaaaaaaaaaaaaaaaaaaaaar", String.valueOf(Notification_year));
                    Log.d("daaaaaaaaaaaaaaaaaaaaaay", String.valueOf(Notification_day));
                    Log.d("moixxxxxxxxxxxxxxxxxxxxx", String.valueOf(Notification_month));
                    Log.d("houuuuuuuuuuuuuuuuuuuuur", String.valueOf(hour));
                    Log.d("minuuuuuuuuuuuuuuuuuuuute", String.valueOf(minute));



                    alarmManager.set(AlarmManager.RTC_WAKEUP, alarmStartTime, alarmIntent);
                    Toast.makeText(Add_task.this, "Alarm added successfully !", Toast.LENGTH_SHORT).show();

                }
            }
        });
    }

    public void timepicker() {

        select_time_button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                materialTimePicker.show(Add_task.this.getSupportFragmentManager(), "TIME_PICKER");
            }
        });
        materialTimePicker.addOnPositiveButtonClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                select_time_text.setText(materialTimePicker.getHour() + ":" + materialTimePicker.getMinute());
            }
        });


    }

    public void datepicker() {

        select_date_button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                materialDatePicker.show(Add_task.this.getSupportFragmentManager(), "DATE_PICKER");
            }
        });
        materialDatePicker.addOnPositiveButtonClickListener(new MaterialPickerOnPositiveButtonClickListener() {
            @Override
            public void onPositiveButtonClick(Object selection) {

                // this is to get the specific day , month , year

                Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("UTC"));
                calendar.setTimeInMillis((Long) selection);
                SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
                String formattedDate = format.format(calendar.getTime());
                Notification_year = Integer.parseInt(formattedDate.substring(0, 4));
                Notification_month = Integer.parseInt(formattedDate.substring(4, 6));
                Notification_day = Integer.parseInt(formattedDate.substring(6, 8));

                select_date_text.setText(materialDatePicker.getHeaderText().trim());
            }
        });
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
    }


}