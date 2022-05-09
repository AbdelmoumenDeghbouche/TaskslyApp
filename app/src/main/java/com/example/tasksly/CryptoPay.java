package com.example.tasksly;

import androidx.appcompat.app.AppCompatActivity;
import androidx.lifecycle.MutableLiveData;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.StrictMode;
import android.os.SystemClock;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

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
    Button Sent_crypto_button,copy;
    TextView addresslistener,textView;




    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_crypto_pay);


        textView=findViewById(R.id.textView);
        Sent_crypto_button=findViewById(R.id.Sent_crypto_button);
        addresslistener=findViewById(R.id.wallet_hash);
        copy=findViewById(R.id.copy);
        findViewById(R.id.progressBar_cyclic).setVisibility(View.INVISIBLE);
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);

                final String etheriumwalletPath = "walletpath";
                file = new File(getFilesDir() + etheriumwalletPath);// the etherium wallet location
                //create the directory if it does not exist
                if (!file.mkdirs() ) {
                    file.mkdirs();
                }
                else {
                    Toast.makeText(getApplicationContext(), "Directory already created",
                            Toast.LENGTH_LONG).show();

                }


//enter your own infura api key below
                web3 = Web3j.build(new HttpService("cb4257826d1242d09847c75e4523fc1b"));

                setupBouncyCastle();
                web3 = Web3j.build(new HttpService("https://rinkeby.infura.io/v3/cb4257826d1242d09847c75e4523fc1b"));


                ShowToast(" Now Connecting to Ethereum network");
                try {SystemClock.sleep(1000);
                    //if the client version has an error the user will not gain access if successful the user will get connnected
                    Web3ClientVersion clientVersion = web3.web3ClientVersion().sendAsync().get();
                    if (!clientVersion.hasError()) {

                        ShowToast("Connected!");
                    } else {
                        ShowToast(clientVersion.getError().getMessage());
                    }
                } catch (Exception e) {
                    ShowToast(e.getMessage());
                }




//enter your own infura api key below
                web3 = Web3j.build(new HttpService("cb4257826d1242d09847c75e4523fc1b"));

                setupBouncyCastle();
                web3 = Web3j.build(new HttpService("https://rinkeby.infura.io/v3/cb4257826d1242d09847c75e4523fc1b"));


                ShowToast(" Now Connecting to Ethereum network");

                try {
                    //if the client version has an error the user will not gain access if successful the user will get connnected
                    Web3ClientVersion clientVersion = web3.web3ClientVersion().sendAsync().get();
                    if (!clientVersion.hasError()) {

                        ShowToast("Connected!");
                    } else {
                        ShowToast(clientVersion.getError().getMessage());
                    }
                } catch (Exception e) {
                    ShowToast(e.getMessage());
                }
                final String password = "Hamdi";  // this will be your etherium password
                try {
                    // generating the etherium wallet
                    Walletname = WalletUtils.generateLightNewWalletFile(password, file);
                    ShowToast("Wallet generated wallet name is ");
                    credentials = WalletUtils.loadCredentials(password, file + "/" + Walletname);
                    addresslistener.setText("Your address is " + credentials.getAddress());

                }
                catch(Exception e){
                    ShowToast("failed");





        };
        copy.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                ClipboardManager clipboard = (ClipboardManager) getSystemService(Context.CLIPBOARD_SERVICE);
                ClipData clip = ClipData.newPlainText("text", addresslistener.getText().toString());
                clipboard.setPrimaryClip(clip);
            }
        });

        Sent_crypto_button.setVisibility(View.VISIBLE);
        copy.setVisibility(View.VISIBLE);
        addresslistener.setVisibility(View.VISIBLE);







        ;

        Sent_crypto_button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                try {
                    EthGetBalance balanceWei = web3.ethGetBalance(credentials.getAddress(), DefaultBlockParameterName.LATEST).sendAsync()
                            .get();
                    BigInteger balance =balanceWei.getBalance();
                    BigDecimal currentbalance= Convert.fromWei(balance.toString(), Convert.Unit.ETHER);
                    if (currentbalance.compareTo(BigDecimal.valueOf(0.05))>=0){
                        ShowToast("Sent successfully xD");
                       AsyncTask.execute(new Runnable() {
                           @Override
                           public void run() {
                               try{

                                   TransactionReceipt receipt = Transfer.sendFunds(web3, credentials,"0xAe4Bb9C197c7e439d61CAf9f1aFdc61A2c43235F",BigDecimal.valueOf(0.05), Convert.Unit.ETHER).send();

                                   Toast.makeText(CryptoPay.this, "Transaction successful: " +receipt.getTransactionHash(), Toast.LENGTH_LONG).show();
                                   textView.setText("HAHA Paid!!");
                               }
                               catch(Exception e){
                                   ShowToast("low balance");

                               }

                           }
                       } );

                    }  else{
                        ShowToast("not sent yet");
                    }
                }
                catch (Exception e){
                    ShowToast("balance failed");

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
    }}