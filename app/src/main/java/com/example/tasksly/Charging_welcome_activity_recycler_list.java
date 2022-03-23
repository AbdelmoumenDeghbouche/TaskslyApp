package com.example.tasksly;

import java.util.ArrayList;

public class Charging_welcome_activity_recycler_list {
    public static ArrayList<welcom_activity_recycler_class> GetMainPageListe(){
        ArrayList<welcom_activity_recycler_class> list = new ArrayList<>();
        list.add(new welcom_activity_recycler_class(R.drawable.welcom2,"Welcome to Tasksly","Create an account to save all schedules\n and  access them from"));
        list.add(new welcom_activity_recycler_class(R.drawable.welcom1,"Organize your works","Let’s organize your works with priority and \n do everything without stress."));
        return list ;
    }

}
