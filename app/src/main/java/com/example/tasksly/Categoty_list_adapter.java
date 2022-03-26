package com.example.tasksly;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Color;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.google.android.material.card.MaterialCardView;

import java.util.ArrayList;

public class Categoty_list_adapter extends RecyclerView.Adapter {
    private ArrayList<Category_Model> categories = new ArrayList<>();
    private final Context context;
    private int row_index;
    private int counter;

    public Categoty_list_adapter(Context context) {
        this.context = context;
    }

    public void setCategories(ArrayList<Category_Model> categories) {
        this.categories = categories;
        notifyDataSetChanged();
    }

    @Override
    public int getItemViewType(int position) {
        if (categories.get(position).getCategory_name().toLowerCase().contains("category")) {
            return 1;
        }
        return 0;
    }

    @NonNull
    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater layoutInflater = LayoutInflater.from(parent.getContext());
        View view;
        if (viewType == 1) {
            view = layoutInflater.inflate(R.layout.add_category_view, parent, false);
            return new ViewHolderTwo(view);
        }
        view = layoutInflater.inflate(R.layout.category_item_recycler_view, parent, false);
        return new ViewHolderOne(view);

    }

    @SuppressLint("ResourceAsColor")
    @Override
    public void onBindViewHolder(@NonNull RecyclerView.ViewHolder holder, @SuppressLint("RecyclerView") int position) {
        if (categories.get(position).getCategory_name().toLowerCase().contains("category")) {
            ViewHolderTwo viewHolderTwo = (ViewHolderTwo) holder;
            viewHolderTwo.txt_has_no_utility.setText("");
            viewHolderTwo.parent_cardview_layout_of_add_category.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    //TODO : WORK ON THE FUNCTIONALITY OF THIS VIEW
                    Toast.makeText(context, "Category added", Toast.LENGTH_SHORT).show();
                }
            });
        } else {
            ViewHolderOne viewHolderOne = (ViewHolderOne) holder;
            viewHolderOne.txt_category_name.setText(categories.get(position).getCategory_name());
            viewHolderOne.parent_cardview_layout_of_category_name.setOnClickListener(new View.OnClickListener() {
                @Override
                @SuppressLint("ResourceAsColor")
                public void onClick(View view) {
                    row_index = position;
                    notifyDataSetChanged();

                }
            });
            if (row_index == position) {
                if (row_index == 0 && counter == 0) {
                    viewHolderOne.parent_relative_layout_of_category_name.setBackgroundResource(R.drawable.cardview_style);
                    viewHolderOne.txt_category_name.setTextColor(Color.BLACK);

                    counter++;
                } else if (row_index == position) {
                    viewHolderOne.parent_relative_layout_of_category_name.setBackgroundResource(R.drawable.cardview_style2);
                    viewHolderOne.txt_category_name.setTextColor(Color.WHITE);

                }
            } else {
                viewHolderOne.parent_relative_layout_of_category_name.setBackgroundResource(R.drawable.cardview_style);
                viewHolderOne.txt_category_name.setTextColor(Color.BLACK);

            }

        }

    }

    @Override
    public int getItemCount() {
        return categories.size();
    }

    static class ViewHolderTwo extends RecyclerView.ViewHolder {
        //this view holder will hold the add category layout
        //return 1
        private final MaterialCardView parent_cardview_layout_of_add_category;
        private final RelativeLayout parent_relative_layout_of_add_category;
        private final TextView txt_has_no_utility;
        private final ImageView add_category_image_view;

        public ViewHolderTwo(@NonNull View itemView) {
            super(itemView);
            parent_cardview_layout_of_add_category = itemView.findViewById(R.id.parent_cardview_layout_of_add_category);
            parent_relative_layout_of_add_category = itemView.findViewById(R.id.parent_relative_layout_of_add_category);
            txt_has_no_utility = itemView.findViewById(R.id.txt_has_no_utility);
            add_category_image_view = itemView.findViewById(R.id.add_category_image_view);
        }
    }

    class ViewHolderOne extends RecyclerView.ViewHolder {
        //this view holder will hold the category NAME layout
        //return 0
        private final RelativeLayout parent_relative_layout_of_category_name;
        private final MaterialCardView parent_cardview_layout_of_category_name;
        private final TextView txt_category_name;

        public ViewHolderOne(@NonNull View itemView) {
            super(itemView);
            parent_cardview_layout_of_category_name = itemView.findViewById(R.id.parent_cardview_layout_of_category_name);
            parent_relative_layout_of_category_name = itemView.findViewById(R.id.parent_relative_layout_of_category_name);
            txt_category_name = itemView.findViewById(R.id.txt_category_name);


        }
    }
}
