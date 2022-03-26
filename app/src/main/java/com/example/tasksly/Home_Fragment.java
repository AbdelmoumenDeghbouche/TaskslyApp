package com.example.tasksly;

import android.app.Dialog;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.os.Bundle;

import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.google.android.material.card.MaterialCardView;

import java.util.ArrayList;

public class Home_Fragment extends Fragment {
    private RecyclerView category_recyclerview;
    private Categoty_list_adapter adapter;
    private TextView txt_hello_name;
    private ImageView img_user_profile;
    private TextView txt_name_of_client;
    private MaterialCardView card_view_holding_user_image_profile;
    private Dialog add_category_dialogue;
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_home_, container, false) ;

        // set the fragment2 (list of tasks that will appear when we click on a specific category )  when we entered the mainactivity

        getParentFragmentManager().beginTransaction()
                //.setCustomAnimations(android.R.anim.slide_in_left, android.R.anim.slide_out_right)
                .replace(R.id.fragment2, new Fragment2())
                .commit();


        initViewsOfMainActivity(view);
        Utils.initCategories(); // charging the arraylist with the categories
        ArrayList<Category_Model> categories = Utils.getCategories_list(); // this function is returning the arraylist that we charged in the precedent line

        // setting the categories recycler view

        adapter = new Categoty_list_adapter(view.getContext());
        category_recyclerview.setAdapter(adapter);
        LinearLayoutManager linearLayoutManager = new LinearLayoutManager(view.getContext(),LinearLayoutManager.HORIZONTAL,false);
        category_recyclerview.setLayoutManager(linearLayoutManager);
        adapter.setCategories(categories);

        // goes to Profile activity when clicking
        img_user_profile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getActivity().getApplication(), Profile_activity.class);
                startActivity(intent);
            }
        });

        return view ;
    }
    private void initViewsOfMainActivity(View view) {
        category_recyclerview = view.findViewById(R.id.category_recyclerview);
        img_user_profile = view.findViewById(R.id.img_user_profile);
        txt_hello_name = view.findViewById(R.id.txt_hello_name);
        card_view_holding_user_image_profile =view.findViewById(R.id.card_view_holding_user_image_profile);
        txt_name_of_client = view.findViewById(R.id.txt_name_of_client);
    }

}