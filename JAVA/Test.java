package org.example;

public class Test implements Runnable {
    public static void main(String[] args) {
    }

    public Test() {
        Thread t = new Thread(this);
        t.start();
    }

    public void run() {
        System.out.println("test");
    }
}