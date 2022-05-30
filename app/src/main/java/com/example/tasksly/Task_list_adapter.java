package com.example.tasksly;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.graphics.Paint;
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
    private final Context context;
    int row_ind = 0;
    private ArrayList<Task_Model> tasks_list = new ArrayList<>();


    public Task_list_adapter(Context context) {
        this.context = context;
    }

    @SuppressLint("NotifyDataSetChanged")
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
    public void onBindViewHolder(@NonNull Viewholder holder, @SuppressLint("RecyclerView") int position) {
        holder.txt_task_name.setText(tasks_list.get(position).getTask_title());
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
                context.startActivity(intent);
            }
        });
        if (tasks_list.get(position).isIs_finished()) {
            holder.img_view_check_box_oval_not_checked.setVisibility(View.GONE);
            holder.img_view_check_box_oval_checked.setVisibility(View.VISIBLE);
            holder.txt_task_name.setPaintFlags(holder.txt_task_name.getPaintFlags() | Paint.STRIKE_THRU_TEXT_FLAG);

        } else {
            holder.img_view_check_box_oval_checked.setVisibility(View.GONE);
            holder.img_view_check_box_oval_not_checked.setVisibility(View.VISIBLE);

        }
        holder.img_view_check_box_oval_not_checked.setOnClickListener(new View.OnClickListener() {
            @RequiresApi(api = Build.VERSION_CODES.N)
            @Override
            public void onClick(View view) {
                if (Utils.should_i_delete_the_task_from_the_adapter) {
                    holder.img_view_check_box_oval_not_checked.setVisibility(View.GONE);
                    String categoty = tasks_list.get(position).getCategory().getCategory_name();
                    holder.img_view_check_box_oval_checked.setVisibility(View.VISIBLE);

                    Utils.completed_tasks.add(Utils.completed_tasks.size(), tasks_list.get(position));
                    Task_Model new_finished_task = new Task_Model(tasks_list.get(position).getTask_title(), tasks_list.get(position).getTime(), tasks_list.get(position).getDate(), tasks_list.get(position).getCategory(), tasks_list.get(position).getDescription(), true, tasks_list.get(position).getCurrent_date(), tasks_list.get(position).getCurrent_time());
                    new_finished_task.setIs_finished(true);
                    Utils.UpdateTask(tasks_list.get(position), new_finished_task, context);
                    tasks_list.get(position).setIs_finished(true);
                    tasks_list.remove(position);
                    Utils.tasks_list = Utils.GetAllTasksFromFirebase();

                    notifyDataSetChanged();
                } else {
                    holder.img_view_check_box_oval_not_checked.setVisibility(View.GONE);
                    String categoty = tasks_list.get(position).getCategory().getCategory_name();
                    holder.img_view_check_box_oval_checked.setVisibility(View.VISIBLE);
                    Utils.completed_tasks.add(Utils.completed_tasks.size(), tasks_list.get(position));
                    Task_Model new_finished_task = new Task_Model(tasks_list.get(position).getTask_title(), tasks_list.get(position).getTime(), tasks_list.get(position).getDate(), tasks_list.get(position).getCategory(), tasks_list.get(position).getDescription(), true, tasks_list.get(position).getCurrent_date(), tasks_list.get(position).getCurrent_time());
                    new_finished_task.setIs_finished(true);
                    Utils.UpdateTask(tasks_list.get(position), new_finished_task, context);
                    tasks_list.get(position).setIs_finished(true);
                    notifyDataSetChanged();
                }


            }
        });
        holder.txt_description_of_task.setText(tasks_list.get(position).getDescription());
        holder.txt_view_date_of_task_in_RV.setText(tasks_list.get(position).getDate());
        holder.img_view_check_box_oval_checked.setOnClickListener(new View.OnClickListener() {
            @RequiresApi(api = Build.VERSION_CODES.N)
            @Override
            public void onClick(View view) {


                tasks_list.get(position).setIs_finished(false);
                Task_Model new_finished_task = new Task_Model(tasks_list.get(position).getTask_title(), tasks_list.get(position).getTime(), tasks_list.get(position).getDate(), tasks_list.get(position).getCategory(), tasks_list.get(position).getDescription(), true, tasks_list.get(position).getCurrent_date(), tasks_list.get(position).getCurrent_time());
                new_finished_task.setIs_finished(false);

                Utils.UpdateTask(tasks_list.get(position), new_finished_task, context);
                holder.img_view_check_box_oval_checked.setVisibility(View.GONE);
                holder.img_view_check_box_oval_not_checked.setVisibility(View.VISIBLE);
                tasks_list.remove(position);
                notifyDataSetChanged();


            }
        });


    }


    @Override
    public int getItemCount() {
        if (tasks_list != null) {
            return tasks_list.size();
        }
        return 0;
    }

    class Viewholder extends RecyclerView.ViewHolder {
        private final MaterialCardView card_view_layout_of_task_item;
        private final RelativeLayout parent_relative_layout_of_task_name;
        private final TextView txt_time_of_task;
        private final TextView txt_description_of_task;
        private final TextView txt_task_name;
        private final TextView txt_view_date_of_task_in_RV;
        private final ImageView img_view_clock;
        private final ImageView img_view_check_box_oval_checked;
        private final ImageView img_view_check_box_oval_not_checked;

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
