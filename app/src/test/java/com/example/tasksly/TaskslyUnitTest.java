package com.example.tasksly;

import org.junit.Test;

import static org.junit.Assert.*;


public class TaskslyUnitTest {
    @Test
    public void closestdayfinder() {
        String str=Utils.nextDayDate("SUNDAY");
        assertEquals(str.substring(0, 4), "2022");
        assertEquals(str.substring(5, 7), "05");
        assertEquals(str.substring(8, 10), "22");

    }
}