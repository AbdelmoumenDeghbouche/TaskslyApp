package com.example.tasksly;

import android.annotation.SuppressLint;
import android.os.Bundle;

import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.EditText;
import android.widget.RelativeLayout;

import java.util.ArrayList;


public class Add_task_Fragment extends Fragment {

    EditText TaskTitle ;
    RecyclerView recyclerView ;
    RelativeLayout relativeLayout, relativeLayout2;
    Categoty_list_adapter adapter;
    boolean is_clicked;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment

        View view = inflater.inflate(R.layout.fragment_add_task_, container, false) ;
        AssingElements(view);
        Handlingonoffclicks(view);
        Utils.initCategories(); // charging the arraylist with the categories
        ArrayList<Category_Model> categories = Utils.getCategories_list(); // this function is returning the arraylist that we charged in the precedent line

        // setting the categories recycler view

        adapter = new Categoty_list_adapter(view.getContext());
        recyclerView.setAdapter(adapter);
        LinearLayoutManager linearLayoutManager = new LinearLayoutManager(view.getContext(),LinearLayoutManager.HORIZONTAL,false);
        recyclerView.setLayoutManager(linearLayoutManager);
        adapter.setCategories(categories);


        return  view ;
    }

    public void AssingElements(View view){

        relativeLayout = view.findViewById(R.id.On_relalive_layout);
        relativeLayout2 = view.findViewById(R.id.Off_relalive_layout);
        recyclerView = view.findViewById(R.id.creat_task_recyclerview);
        TaskTitle = view.findViewById(R.id.add_task_title);
        is_clicked = true;

    }


    public void Handlingonoffclicks(View view){

        // handling on off clicks

        view.findViewById(R.id.parent_layout).setOnClickListener(new View.OnClickListener() {
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

    }
}