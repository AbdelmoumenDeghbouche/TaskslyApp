package com.example.tasksly;

import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.RequiresApi;
import androidx.recyclerview.widget.RecyclerView;

import com.google.android.material.card.MaterialCardView;

import java.util.ArrayList;

public class Task_list_adapter extends RecyclerView.Adapter<Task_list_adapter.Viewholder> {
    private ArrayList<Task_Model> tasks_list = new ArrayList<>();
    private Context context;

    public Task_list_adapter(Context context) {
        this.context = context;
    }

    public void setTasks(ArrayList<Task_Model> tasks_list) {
        this.tasks_list = tasks_list;
        notifyDataSetChanged();
    }

    @NonNull
    @Override
    public Viewholder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater layoutInflater = LayoutInflater.from(parent.getContext());
        View view;
        view = layoutInflater.inflate(R.layout.task_recycler_view, parent, false);
        return new Viewholder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull Viewholder holder, int position) {
        holder.txt_task_name.setText(tasks_list.get(position).getTask_title().toString());
        holder.txt_time_of_task.setText(tasks_list.get(position).getTime());
        holder.txt_description_of_task.setText("description");
        holder.parent_relative_layout_of_task_name.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(context.getApplicationContext(), TaskActivity.class);
                intent.putExtra("TaskModel", tasks_list.get(position));
                intent.putExtra("selected_task", position);
                intent.putExtra("category_name", tasks_list.get(position).getCategory().getCategory_name());
                intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                context.getApplicationContext().startActivity(intent);
            }
        });
        if (tasks_list.get(position).isIs_finished()) {
            holder.img_view_check_box_oval_not_checked.setVisibility(View.GONE);
            holder.img_view_check_box_oval_checked.setVisibility(View.VISIBLE);

        } else {
            holder.img_view_check_box_oval_checked.setVisibility(View.GONE);
            holder.img_view_check_box_oval_not_checked.setVisibility(View.VISIBLE);

        }
        holder.img_view_check_box_oval_not_checked.setOnClickListener(new View.OnClickListener() {
            @RequiresApi(api = Build.VERSION_CODES.N)
            @Override
            public void onClick(View view) {
                int row_index_task = position;
                if (holder.img_view_check_box_oval_not_checked.getVisibility() == View.VISIBLE) {
                    holder.img_view_check_box_oval_not_checked.setVisibility(View.GONE);
                    String categoty= tasks_list.get(position).getCategory().getCategory_name();
                    holder.img_view_check_box_oval_checked.setVisibility(View.VISIBLE);
                    Utils.completed_tasks.add(Utils.completed_tasks.size(), tasks_list.get(position));
                    tasks_list.get(position).setIs_finished(true);
                    tasks_list.remove(position);
                    Utils.category_map.replace(categoty,tasks_list);


                }

            }
        });
        holder.txt_description_of_task.setText(tasks_list.get(position).getDescription());
        holder.txt_view_date_of_task_in_RV.setText(tasks_list.get(position).getDate());
        holder.img_view_check_box_oval_checked.setOnClickListener(new View.OnClickListener() {
            @RequiresApi(api = Build.VERSION_CODES.N)
            @Override
            public void onClick(View view) {
                if (holder.img_view_check_box_oval_checked.getVisibility() == View.VISIBLE) {
                    holder.img_view_check_box_oval_checked.setVisibility(View.GONE);
                    holder.img_view_check_box_oval_not_checked.setVisibility(View.VISIBLE);
                    tasks_list.get(position).setIs_finished(false);
                    ArrayList<Task_Model> new_arrayList = Utils.category_map.get(tasks_list.get(position).getCategory().getCategory_name());
                    if (null != new_arrayList) {
                        new_arrayList.add(new_arrayList.size(), tasks_list.get(position));
                        Utils.category_map.replace(tasks_list.get(position).getCategory().getCategory_name(), new_arrayList);
                        tasks_list.remove(position);

                    }


                }

            }
        });
    }


    @Override
    public int getItemCount() {
        return tasks_list.size();
    }

    class Viewholder extends RecyclerView.ViewHolder {
        private MaterialCardView card_view_layout_of_task_item;
        private RelativeLayout parent_relative_layout_of_task_name;
        private TextView txt_time_of_task, txt_description_of_task, txt_task_name, txt_view_date_of_task_in_RV;
        private ImageView img_view_clock, img_view_check_box_oval_checked, img_view_check_box_oval_not_checked;

        public Viewholder(@NonNull View itemView) {
            super(itemView);
            parent_relative_layout_of_task_name = itemView.findViewById(R.id.parent_relative_layout_of_task_name);
            card_view_layout_of_task_item = itemView.findViewById(R.id.card_view_layout_of_task_item);
            txt_time_of_task = itemView.findViewById(R.id.txt_time_of_task);
            img_view_clock = itemView.findViewById(R.id.img_view_clock);
            img_view_check_box_oval_checked = itemView.findViewById(R.id.img_view_check_box_oval_checked);
            img_view_check_box_oval_not_checked = itemView.findViewById(R.id.img_view_check_box_oval_not_checked);
            txt_description_of_task = itemView.findViewById(R.id.txt_description_of_task);
            txt_task_name = itemView.findViewById(R.id.txt_task_name);
            txt_view_date_of_task_in_RV = itemView.findViewById(R.id.txt_view_date_of_task_in_RV);

        }
    }
}
