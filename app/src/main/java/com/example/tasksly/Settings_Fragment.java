package com.example.tasksly;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;

import androidx.fragment.app.Fragment;

public class Settings_Fragment extends Fragment {

    RelativeLayout On_relalive_layout_sound,On_relalive_layout_vibrate_on_mute,Off_relalive_layout_vibrate_on_mute ,Off_relalive_layout_sound, On_relalive_layout_vibration, Off_relalive_layout_vibration;
    boolean is_clicked;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_settings_, container, false);
        AssingElements(view);
        Handlingonoffclicks(view);

        return view;
    }

    public void AssingElements(View view) {

        On_relalive_layout_sound = view.findViewById(R.id.On_relalive_layout_sound);
        Off_relalive_layout_sound = view.findViewById(R.id.Off_relalive_layout_sound);
        On_relalive_layout_vibration = view.findViewById(R.id.On_relalive_layout_vibration);
        Off_relalive_layout_vibration = view.findViewById(R.id.Off_relalive_layout_vibration);
        On_relalive_layout_vibrate_on_mute=view.findViewById(R.id.On_relalive_layout_vibrate_on_mute);
        Off_relalive_layout_vibrate_on_mute = view.findViewById(R.id.Off_relalive_layout_vibrate_on_mute);
        is_clicked = true;

    }

    public void Handlingonoffclicks(View view) {

        // handling on off clicks

        view.findViewById(R.id.parent_layout_sound).setOnClickListener(new View.OnClickListener() {
            @SuppressLint("ResourceAsColor")
            @Override
            public void onClick(View view) {
                if (is_clicked) {
                    On_relalive_layout_sound.setVisibility(View.GONE);
                    Off_relalive_layout_sound.setVisibility(View.VISIBLE);
                } else {
                    On_relalive_layout_sound.setVisibility(View.VISIBLE);
                    Off_relalive_layout_sound.setVisibility(View.GONE);
                }
                is_clicked = !is_clicked;
            }
        });
        view.findViewById(R.id.parent_layout_vibration).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (!is_clicked) {
                    On_relalive_layout_vibration.setVisibility(View.GONE);
                    Off_relalive_layout_vibration.setVisibility(View.VISIBLE);
                } else {
                    On_relalive_layout_vibration.setVisibility(View.VISIBLE);
                    Off_relalive_layout_vibration.setVisibility(View.GONE);
                }
                is_clicked = !is_clicked;
            }
        });
        view.findViewById(R.id.parent_layout_vibrate_on_mute).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (!is_clicked) {
                    On_relalive_layout_vibrate_on_mute.setVisibility(View.GONE);
                    Off_relalive_layout_vibrate_on_mute.setVisibility(View.VISIBLE);
                } else {
                    On_relalive_layout_vibrate_on_mute.setVisibility(View.VISIBLE);
                    Off_relalive_layout_vibrate_on_mute.setVisibility(View.GONE);
                }
                is_clicked = !is_clicked;

            }
        });

    }
}