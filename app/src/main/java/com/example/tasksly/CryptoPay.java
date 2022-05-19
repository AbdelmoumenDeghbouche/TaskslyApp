package com.example.tasksly;

import static android.view.WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.os.Build;
import android.os.Bundle;
import android.os.StrictMode;
import android.util.Log;
import android.view.View;
import android.view.WindowInsetsController;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;

import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.web3j.crypto.Credentials;
import org.web3j.crypto.WalletUtils;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.DefaultBlockParameterName;
import org.web3j.protocol.core.methods.response.EthGetBalance;
import org.web3j.protocol.core.methods.response.TransactionReceipt;
import org.web3j.protocol.core.methods.response.Web3ClientVersion;
import org.web3j.protocol.http.HttpService;
import org.web3j.tx.Transfer;
import org.web3j.utils.Convert;

import java.io.File;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.security.Provider;
import java.security.Security;

public class CryptoPay extends AppCompatActivity {
    Web3j web3;
    File file;
    String Walletname;
    Credentials credentials;
    RelativeLayout Sent_crypto_button, copy;
    TextView addresslistener;
    NetworkChangeListener networkChangeListener = new NetworkChangeListener();

    ProgressBar progressBar ;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_crypto_pay);

        Setting_ui();
        initialisation();

        Strict_mode_and_File_initial();
        initial_web3();
        initial_wallet_address();
        handlingonClicks();

    }

    private void initial_wallet_address(){
        progressBar.setVisibility(View.VISIBLE);
        final String password = "Hamdi";  // this will be your etherium password
        try {
            // generating the etherium wallet
            Walletname = WalletUtils.generateLightNewWalletFile(password, file);
            Log.d("Cryptopay", "Wallet generated ");
            credentials = WalletUtils.loadCredentials(password, file + "/" + Walletname);
            addresslistener.setText(credentials.getAddress());
            progressBar.setVisibility(View.GONE);

        } catch (Exception e) {
            ShowToast("failed");
            progressBar.setVisibility(View.GONE);
        }
    }

    private void initial_web3(){
        //enter your own infura api key below
        web3 = Web3j.build(new HttpService("cb4257826d1242d09847c75e4523fc1b"));

        setupBouncyCastle();
        web3 = Web3j.build(new HttpService("https://rinkeby.infura.io/v3/cb4257826d1242d09847c75e4523fc1b"));


        Log.d("Cryptopay", " Now Connecting to Ethereum network");
        try {
            //if the client version has an error the user will not gain access if successful the user will get connnected
            Web3ClientVersion clientVersion = web3.web3ClientVersion().sendAsync().get();
            if (!clientVersion.hasError()) {

                Log.d("Cryptopay", "Connected to ether chain!");
            } else {
                Log.d("Cryptopay", clientVersion.getError().getMessage());
            }
        } catch (Exception e) {
            ShowToast(e.getMessage());
        }
    }

    private void Strict_mode_and_File_initial() {
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);

        final String etheriumwalletPath = "walletpath";
        file =new

                File(getFilesDir() +etheriumwalletPath);// the etherium wallet location
        //create the directory if it does not exist
        if(!file.mkdirs())

        {
            file.mkdirs();
        } else

        {
            Log.d("Cryptopay", "Directory already created");
        }
    }

   private void handlingonClicks(){
       copy.setOnClickListener(new View.OnClickListener() {
           @Override
           public void onClick(View view) {
               ClipboardManager clipboard = (ClipboardManager) getSystemService(Context.CLIPBOARD_SERVICE);
               ClipData clip = ClipData.newPlainText("text", addresslistener.getText().toString());
               clipboard.setPrimaryClip(clip);
               Toast.makeText(CryptoPay.this, "wallet address has been copied successfully !", Toast.LENGTH_SHORT).show();
           }
       });
       Sent_crypto_button.setOnClickListener(new View.OnClickListener() {
           @Override
           public void onClick(View view) {
               try {
                   progressBar.setVisibility(view.VISIBLE);
                   EthGetBalance balanceWei = web3.ethGetBalance(credentials.getAddress(), DefaultBlockParameterName.LATEST).sendAsync()
                           .get();
                   BigInteger balance = balanceWei.getBalance();
                   BigDecimal currentbalance = Convert.fromWei(balance.toString(), Convert.Unit.ETHER);
                   if (currentbalance.compareTo(BigDecimal.valueOf(0.037)) >= 0) {
                       //Loading must happen here
                       //TODO:Ichou must do loading here

                       ShowToast("Sent successfully");

                       try {
                           TransactionReceipt receipt = Transfer.sendFunds(web3, credentials, "0xA68b889E16971D8B71d92BA2775a11477cAc405F", BigDecimal.valueOf(0.036), Convert.Unit.ETHER).send();
                           Log.d("Cryptopay", "Transaction successful: " + receipt.getTransactionHash());
                           Intent intent = new Intent(CryptoPay.this, CongratsMembership.class);
                           progressBar.setVisibility(view.GONE);
                           startActivity(intent);
                       } catch (Exception e) {
                           progressBar.setVisibility(view.GONE);
                           Log.d("Cryptopay", "onClick: low balance");
                       }

                   } else {
                       progressBar.setVisibility(view.GONE);
                       ShowToast("not sent yet");
                   }
               } catch (Exception e) {
                   progressBar.setVisibility(view.GONE);
                   Log.d("Cryptopay", "balance failed");
               }
           }
       });
   }

    private void setupBouncyCastle() {
        final Provider provider = Security.getProvider(BouncyCastleProvider.PROVIDER_NAME);
        if (provider == null) {
            // Web3j will set up a provider  when it's used for the first time.
            return;
        }
        if (provider.getClass().equals(BouncyCastleProvider.class)) {
            return;
        }
        //There is a possibility  the bouncy castle registered by android may not have all ciphers
        //so we  substitute with the one bundled in the app.
        Security.removeProvider(BouncyCastleProvider.PROVIDER_NAME);
        Security.insertProviderAt(new BouncyCastleProvider(), 1);
    }

    public void ShowToast(String message) {
        runOnUiThread(() -> {
            Toast.makeText(this, message, Toast.LENGTH_LONG).show();
        });
    }

    public void initialisation(){
        progressBar = findViewById(R.id.progres);
        Sent_crypto_button = findViewById(R.id.Sent_crypto_button);
        addresslistener = findViewById(R.id.wallet_hash);
        copy = findViewById(R.id.copy);

    }

    public void Setting_ui(){
        getSupportActionBar().hide();
        // changing the color of the status bar
        this.getWindow().setStatusBarColor(this.getColor(R.color.white));

        // to change the color of the icons in status bar to dark
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(APPEARANCE_LIGHT_STATUS_BARS, APPEARANCE_LIGHT_STATUS_BARS);
        }
        // to change the color of the icons in the navigation bar to dark
        getWindow().setNavigationBarColor(ContextCompat.getColor(CryptoPay.this, R.color.white)); //setting bar color
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            this.getWindow().getDecorView().getWindowInsetsController().setSystemBarsAppearance(WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS, WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS);
        }
    }
    @Override
    protected void onStart() {
        IntentFilter intentFilter = new IntentFilter(ConnectivityManager.CONNECTIVITY_ACTION);
        registerReceiver(networkChangeListener,intentFilter);
        super.onStart();

    }

    @Override
    protected void onStop() {

        unregisterReceiver(networkChangeListener);
        super.onStop();
    }
}