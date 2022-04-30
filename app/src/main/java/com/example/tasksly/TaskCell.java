package com.example.tasksly;

public class TaskCell {
    //The cell is needed for the OcrExtraction
    //mainly this class is treated as a Struct (record in pascal)
    //there is a record type in java 14 but for simplicity we will use this class model instead
    int col,row;
    String text;
    public TaskCell(String text,int row,int col){
        this.col=col;
        this.row=row;
        this.text=text;
    }
}
