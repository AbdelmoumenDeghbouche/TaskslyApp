package com.example.tasksly;

import static android.content.ContentValues.TAG;

import android.os.AsyncTask;
import android.os.Build;
import android.os.SystemClock;
import android.util.Log;
import android.widget.Toast;

import androidx.annotation.RequiresApi;

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

public class OcrRequestAsync extends AsyncTask<String, Void, Response> {

    String url;

    @RequiresApi(api = Build.VERSION_CODES.N)

    @Override
    protected void onPostExecute(Response response) {
        Log.d(TAG, "onPostExecute: Nice Nice");
        try {
            ArrayList<TaskCell> cells = new ArrayList<>();
            //make the response body to a string s
            String s = response.body().string();
            //make s a json object
            JSONObject jsonObject = new JSONObject(s);

            Log.d(TAG, "onPostExecute: " + jsonObject);

            JSONArray jsonArray = jsonObject.optJSONArray("result").optJSONObject(0).optJSONArray("prediction").optJSONObject(0).getJSONArray("cells");
            System.out.println(jsonArray);


            /*
            Explanation:
            we iterate the jsonArray which has cells, so we are getting cells!
            we make an array of cells and we will have the ability to know the place
            of the cell in the table (col and row)

             */

            for (int i = 0; i < jsonArray.length(); i++) {
                String tx = jsonArray.getJSONObject(i).getString("text");
                int col = jsonArray.getJSONObject(i).getInt("col");
                int row = jsonArray.getJSONObject(i).getInt("row");
                cells.add(new TaskCell(tx, row, col));

            }
            // Now we have the cells arraylist filled with the cells
            // we need to know the size of the array (col and rows)
            int colsize = 0;

            for (TaskCell cell : cells) {
                if (cell.col > colsize) {
                    colsize = cell.col;
                } else {
                    break;
                }
            }
            int rowsize = cells.size() / colsize;
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
//            DateFormat dateFormat = new SimpleDateFormat("hh:mm:");

            int j;
            int row;
            for (int i = 1; i < colsize; i++) {
                j = i + colsize;

                if (Math.floorDiv(j + 1, colsize) * colsize < j + 1) {
                    row = Math.floorDiv(j + 1, colsize) + 1;
                } else {
                    row = Math.floorDiv(j + 1, colsize);
                }

                while (j <= cells.size() && row <= rowsize) {
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                        Utils.AddTaskByTaskModel(new Task_Model(cells.get(j).text, cells.get((row - 1) * colsize).text, Utils.nextDayDate(cells.get(i).text), new Category_Model("general"), "", true));
                        j += colsize;
                        row += 1;
                    }
                }
            }


        } catch (IOException e) {
            e.printStackTrace();
        } catch (JSONException e) {
            e.printStackTrace();

        }catch (Exception e){
            Log.d(TAG, "onPostExecute: WE ARE VENOM!");
        }


//        text.setText(response.header("message"));

        super.onPostExecute(response);
    }


    @Override
    protected Response doInBackground(String... string) {
        final MediaType MEDIA_TYPE_PNG = MediaType.parse("image/jpeg");
        OkHttpClient client = new OkHttpClient();
        url = string[0];

//        RequestBody requestBody = RequestBody.create(MEDIA_TYPE_PNG,"{'data' :[{\"filename\":\"https://hustleandhomeschool.com/wp-content/uploads/2020/08/Screen-Shot-2020-08-24-at-2.18.41-PM-1024x880.png\", \"object\": [{\"name\":\"category1\", \"ocr_text\":\"text inside the bounding box\", \"bndbox\": {\"xmin\": 1,\"ymin\": 1,\"xmax\": 100, \"ymax\": 100}}]}], \"urls\":[\"https://hustleandhomeschool.com/wp-content/uploads/2020/08/Screen-Shot-2020-08-24-at-2.18.41-PM-1024x880.png\"]}");
//        RequestBody requestBody = RequestBody.create(MEDIA_TYPE_PNG,"{'data' :[{'filename':'https://hustleandhomeschool.com/wp-content/uploads/2020/08/Screen-Shot-2020-08-24-at-2.18.41-PM-1024x880.png', 'object': [{'name':'category1', 'ocr_text':'text inside the bounding box', 'bndbox': {'xmin' 1,'ymin': 1,'xmax': 100, 'ymax': 100}}]}], 'urls':['https://hustleandhomeschool.com/wp-content/uploads/2020/08/Screen-Shot-2020-08-24-at-2.18.41-PM-1024x880.png']}");
//        RequestBody requestBody = new MultipartBody.Builder()
//                .setType(MultipartBody.FORM)
//                .addFormDataPart("file","C:\\Users\\hamdi\\OneDrive\\Desktop\\weekimage",RequestBody.create(MEDIA_TYPE_PNG,new File("C:\\Users\\hamdi\\OneDrive\\Desktop\\weekimage")))
//                .build();
        RequestBody requestBody = new FormBody.Builder()
                .add("urls", url).build();

        Request request = new Request.Builder()
                .url("https://app.nanonets.com/api/v2/OCR/Model/00a8c75a-7b17-45db-b3ab-ac967d253fa5/LabelUrls/")
                .post(requestBody)
                .addHeader("Authorization", Credentials.basic("Ckw7XtVJvjai7nfdkJzDm6saaDgWBXLT", ""))
                .build();

        Response response = null;
        try {
            response = client.newCall(request).execute();

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
