package com.example.tasksly.Controller;


import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.tasksly.Module.welcom_activity_Model;
import com.example.tasksly.R;

import java.util.ArrayList;

public class welcom_activity_recycler_adapter extends RecyclerView.Adapter<welcom_activity_recycler_adapter.ViewHolder> {
    ArrayList<welcom_activity_Model> liste;
    Context context;
    long DURATION = 1000;
    long DURATION1 = 750;
    long DURATION2 = 350;
    boolean ON_ATTACH = true;

    public welcom_activity_recycler_adapter(ArrayList<welcom_activity_Model> liste, Context context) {
        this.context = context;
        this.liste = liste;
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.welcom_card_item, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position) {
        holder.imageView.setImageResource(liste.get(position).getImg());
        holder.maintext.setText(liste.get(position).getMaintext());
        holder.secondtext.setText(liste.get(position).getSecondtext());
        FromdowntoupImage(holder.imageView, position);
        FromuptoDownText2(holder.maintext, position);
        FromuptoDownText(holder.secondtext, position);
    }


    @Override
    public void onAttachedToRecyclerView(@NonNull RecyclerView recyclerView) {

        recyclerView.addOnScrollListener(new RecyclerView.OnScrollListener() {
            @Override
            public void onScrollStateChanged(@NonNull RecyclerView recyclerView, int newState) {
                ON_ATTACH = true;
                super.onScrollStateChanged(recyclerView, newState);
            }
        });

        super.onAttachedToRecyclerView(recyclerView);
    }

    private void FromdowntoupImage(ImageView itemView, int i) {
        if (!ON_ATTACH) {
            i = -1;
        }
//        boolean not_first_item = i == -1;
//        i = i + 1;
        itemView.setTranslationY(itemView.getY() - 710);
        itemView.setAlpha(0.f);
        AnimatorSet animatorSet = new AnimatorSet();
        ObjectAnimator animatorTranslateX = ObjectAnimator.ofFloat(itemView, "translationY", itemView.getY() - 700, 0);
        ObjectAnimator animatorAlpha = ObjectAnimator.ofFloat(itemView, "alpha", 1.f);
        ObjectAnimator.ofFloat(itemView, "alpha", 0.f).start();
        //animatorTranslateX.setStartDelay(not_first_item ? DURATION : (i * DURATION));
        animatorTranslateX.setDuration((true ? 2 : 1) * DURATION);
        animatorSet.playTogether(animatorTranslateX, animatorAlpha);
        animatorSet.start();
    }

    private void FromuptoDownText(TextView itemView, int i) {
        if (!ON_ATTACH) {
            i = -1;
        }
//        boolean not_first_item = i == -1;
//        i = i + 1;
        itemView.setTranslationY(itemView.getY() + 300);
        itemView.setAlpha(0.f);
        AnimatorSet animatorSet = new AnimatorSet();
        ObjectAnimator animatorTranslateX = ObjectAnimator.ofFloat(itemView, "translationY", itemView.getY() + 300, 0);
        ObjectAnimator animatorAlpha = ObjectAnimator.ofFloat(itemView, "alpha", 1.f);
        ObjectAnimator.ofFloat(itemView, "alpha", 0.f).start();
        // animatorTranslateX.setStartDelay(not_first_item ? DURATION1 : (i * DURATION1));
        animatorTranslateX.setDuration((true ? 2 : 1) * DURATION1);
        animatorSet.playTogether(animatorTranslateX, animatorAlpha);
        animatorSet.start();
    }

    private void FromuptoDownText2(TextView itemView, int i) {
        if (!ON_ATTACH) {
            i = -1;
        }
//        boolean not_first_item = i == -1;
//        i = i + 1;
        itemView.setTranslationY(itemView.getY() + 300);
        itemView.setAlpha(0.f);
        AnimatorSet animatorSet = new AnimatorSet();
        ObjectAnimator animatorTranslateX = ObjectAnimator.ofFloat(itemView, "translationY", itemView.getY() + 300, 0);
        ObjectAnimator animatorAlpha = ObjectAnimator.ofFloat(itemView, "alpha", 1.f);
        ObjectAnimator.ofFloat(itemView, "alpha", 0.f).start();
        //  animatorTranslateX.setStartDelay(not_first_item ? DURATION2 : (i * DURATION2));
        animatorTranslateX.setDuration((/*not_first_item*/true ? 2 : 1) * DURATION2);
        animatorSet.playTogether(animatorTranslateX, animatorAlpha);
        animatorSet.start();
    }


    @Override
    public int getItemCount() {
        return liste.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder {
        TextView maintext, secondtext;
        ImageView imageView;

        public ViewHolder(@NonNull View itemView) {
            super(itemView);
            maintext = itemView.findViewById(R.id.main_text);
            secondtext = itemView.findViewById(R.id.second_text);
            imageView = itemView.findViewById(R.id.main_img);
            getAdapterPosition();
        }
    }
}
