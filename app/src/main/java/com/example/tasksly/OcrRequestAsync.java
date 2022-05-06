package com.example.tasksly;

import static android.content.ContentValues.TAG;

import android.os.AsyncTask;
import android.os.SystemClock;
import android.util.Log;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;

import okhttp3.Credentials;
import okhttp3.FormBody;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class OcrRequestAsync extends AsyncTask<String,Void, Response> {

    String url;
    @Override
    protected void onPostExecute(Response response) {
        Log.d(TAG, "onPostExecute: Nice Nice");
        try {
            ArrayList<TaskCell> cells=new ArrayList<>();
            //make the response body to a string s
            String s = response.body().string();
            //make s a json object
            JSONObject jsonObject = new JSONObject(s);
            JSONArray jsonArray=jsonObject.optJSONArray("result").optJSONObject(0).optJSONArray("prediction").optJSONObject(1).getJSONArray("cells");
            /*
            Explanation:
            we iterate the jsonArray which has cells, so we are getting cells!
            we make an array of cells and we will have the ability to know the place
            of the cell in the table (col and row)

             */

            for (int i=0;i<jsonArray.length();i++){
                String tx=jsonArray.getJSONObject(i).getString("text");
                int col=jsonArray.getJSONObject(i).getInt("col");
                int row=jsonArray.getJSONObject(i).getInt("row");
                cells.add(new TaskCell(tx,row,col));

            }
            // Now we have the cells arraylist filled with the cells
            // we need to know the size of the array (col and rows)
            int colsize=0;
            for (TaskCell cell:cells){
                if (cell.col>colsize){
                    colsize=cell.col;
                }
                else{
                    break;
                }
            }
            int rowsize=cells.size()/colsize;
            //Awesome we now have the shape of the table!!
            /*
            we know that the first cell is empty so we will skip it
            lets say cell is in row1 col 2
            that's sunday right!
            what we gonna do is we keep the col number and go down !
            row2
            row3
            row4..
            those are tasks in sunday
             */


        } catch (IOException e) {
            e.printStackTrace();
        } catch (JSONException e) {
            e.printStackTrace();

        }


//        text.setText(response.header("message"));

        super.onPostExecute(response);
    }


    @Override
    protected Response doInBackground(String... string) {
        final MediaType MEDIA_TYPE_PNG = MediaType.parse("image/jpeg");
        OkHttpClient client = new OkHttpClient();
        url=string[0];

//        RequestBody requestBody = RequestBody.create(MEDIA_TYPE_PNG,"{'data' :[{\"filename\":\"https://hustleandhomeschool.com/wp-content/uploads/2020/08/Screen-Shot-2020-08-24-at-2.18.41-PM-1024x880.png\", \"object\": [{\"name\":\"category1\", \"ocr_text\":\"text inside the bounding box\", \"bndbox\": {\"xmin\": 1,\"ymin\": 1,\"xmax\": 100, \"ymax\": 100}}]}], \"urls\":[\"https://hustleandhomeschool.com/wp-content/uploads/2020/08/Screen-Shot-2020-08-24-at-2.18.41-PM-1024x880.png\"]}");
//        RequestBody requestBody = RequestBody.create(MEDIA_TYPE_PNG,"{'data' :[{'filename':'https://hustleandhomeschool.com/wp-content/uploads/2020/08/Screen-Shot-2020-08-24-at-2.18.41-PM-1024x880.png', 'object': [{'name':'category1', 'ocr_text':'text inside the bounding box', 'bndbox': {'xmin' 1,'ymin': 1,'xmax': 100, 'ymax': 100}}]}], 'urls':['https://hustleandhomeschool.com/wp-content/uploads/2020/08/Screen-Shot-2020-08-24-at-2.18.41-PM-1024x880.png']}");
//        RequestBody requestBody = new MultipartBody.Builder()
//                .setType(MultipartBody.FORM)
//                .addFormDataPart("file","C:\\Users\\hamdi\\OneDrive\\Desktop\\weekimage",RequestBody.create(MEDIA_TYPE_PNG,new File("C:\\Users\\hamdi\\OneDrive\\Desktop\\weekimage")))
//                .build();
        RequestBody requestBody = new FormBody.Builder()
                .add("urls", url).build();

        Request request = new Request.Builder()
                .url("https://app.nanonets.com/api/v2/OCR/Model/be7000b1-9b15-492b-aa19-7eaa9875f220/LabelUrls/")
                .post(requestBody)
                .addHeader("Authorization", Credentials.basic("2N3zzNh1ctAtE8z2jL0JoAxQlmvBHt7C", ""))
                .build();

        Response response = null;
        try {
            response= client.newCall(request).execute();

            Log.d(TAG, "doInBackground: Nice ");
            SystemClock.sleep(3000);
        } catch (IOException e) {
            e.printStackTrace();
            Log.d(TAG, "doInBackground: BAD");
            SystemClock.sleep(3000);
        }
        return response;
    }
}
