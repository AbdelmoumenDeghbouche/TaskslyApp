package com.example.tasksly.View;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;

import androidx.fragment.app.Fragment;

import com.example.tasksly.R;

public class Settings_Fragment extends Fragment {

    RelativeLayout relativeLayout, relativeLayout2;
    boolean is_clicked;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_settings_, container, false) ;
        AssingElements(view);
        Handlingonoffclicks(view);

        return view ;
    }
    public void AssingElements(View view){

        relativeLayout = view.findViewById(R.id.On_relalive_layout);
        relativeLayout2 = view.findViewById(R.id.Off_relalive_layout);
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