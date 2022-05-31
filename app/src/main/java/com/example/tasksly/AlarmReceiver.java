package com.example.tasksly;

import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Build;

import androidx.annotation.RequiresApi;
import androidx.core.app.NotificationCompat;

public class AlarmReceiver extends BroadcastReceiver {

    private static final String CHANNEL_ID = "SAMPLE_CHANNEL";


    @RequiresApi(api = Build.VERSION_CODES.O)
    @Override
    public void onReceive(Context context, Intent intent) {

        long notificationId = intent.getIntExtra("notification",0);
        String message = intent.getStringExtra("message");

        Intent mainIntent = new Intent(context, MainActivity.class);
        PendingIntent contentIntent = PendingIntent.getActivity(context,0,mainIntent,PendingIntent.FLAG_IMMUTABLE);

        NotificationManager notificationManager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);


        if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.N)
        {
            CharSequence channel_name = "My notification";
            int importance = notificationManager.IMPORTANCE_DEFAULT;


            NotificationChannel channel = new NotificationChannel( CHANNEL_ID, channel_name, importance);
            notificationManager.createNotificationChannel(channel);
        }


            NotificationCompat.Builder builder = new NotificationCompat.Builder(context, CHANNEL_ID).setSmallIcon(R.drawable.ic_alarm)
                    .setContentTitle("TaskSly Reminder")
                    .setContentText(message)
                    .setContentIntent(contentIntent)
                    .setPriority(NotificationCompat.PRIORITY_DEFAULT)
                    .setAutoCancel(true);


            notificationManager.notify((int) notificationId,builder.build());


    }
}
