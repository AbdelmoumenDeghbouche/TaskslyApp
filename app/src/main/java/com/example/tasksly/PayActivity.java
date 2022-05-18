package com.example.tasksly;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;

public class PayActivity extends AppCompatActivity {
    Button crypto_pay_option_button, google_pay_option_button;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pay);
        crypto_pay_option_button = findViewById(R.id.crypto_pay_option_button);
        google_pay_option_button = findViewById(R.id.google_pay_option_button);
        crypto_pay_option_button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(PayActivity.this, CryptoPay.class);
                startActivity(intent);
            }
        });
    }
}