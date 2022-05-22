package com.example.tasksly;

import android.app.Dialog;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.google.android.material.card.MaterialCardView;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;

public class Home_Fragment extends Fragment {
    private RecyclerView category_recyclerview;
    public static Categoty_list_adapter adapter;
    private TextView UserNameText , txt_hello_name;
    private ImageView img_user_profile;
    String image ;
    private TextView txt_name_of_client;
    DatabaseReference Root ;
    private MaterialCardView card_view_holding_user_image_profile;
    private Dialog add_category_dialogue;
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {


        View view = inflater.inflate(R.layout.fragment_home_, container, false) ;

        // set the fragment2 (list of tasks that will appear when we click on a specific category )  when we entered the mainactivity
        getParentFragmentManager().beginTransaction()
                //.setCustomAnimations(android.R.anim.slide_in_left, android.R.anim.slide_out_right)
                .replace(R.id.fragment2, new Tasks_fragment())
                .commit();


        initViewsOfMainActivity(view);
        settingInitialUserName();


        Utils.initCategories(); // charging the arraylist with the categories
        ArrayList<Category_Model> categories = Utils.GetAllCatgoriesFromFirebse(); // this function is returning the arraylist that we charged in the precedent line


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
                startActivity(new Intent(getActivity().getApplication(), Profile_activity.class));
            }
        });

        return view ;
    }
    private void initViewsOfMainActivity(View view) {
        Root = FirebaseDatabase.getInstance().getReference() ;
        UserNameText = view.findViewById(R.id.txt_name_of_client);
        category_recyclerview = view.findViewById(R.id.category_recyclerview);
        img_user_profile = view.findViewById(R.id.img_user_profile);
        txt_hello_name = view.findViewById(R.id.txt_hello_name);
        card_view_holding_user_image_profile =view.findViewById(R.id.card_view_holding_user_image_profile);
        txt_name_of_client = view.findViewById(R.id.txt_name_of_client);
    }

    public void settingInitialUserName(){
        Root.child("Users").child(FirebaseAuth.getInstance().getCurrentUser().getUid()).addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(@NonNull DataSnapshot snapshot) {
                if (snapshot.exists()){
                    UserModel model = snapshot.getValue(UserModel.class);
                    UserNameText.setText(model.getName());
                    if (!model.getImage().equals("")){
                        image = model.getImage() ;
                        Picasso.get().load(model.getImage()).into(img_user_profile);
                    } else {
                        img_user_profile.setImageResource(R.drawable.ic_avataaars);
                    }
                }
            }

            @Override
            public void onCancelled(@NonNull DatabaseError error) {

            }
        });
    }

}