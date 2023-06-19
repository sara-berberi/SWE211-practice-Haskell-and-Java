package org.example;

public class myClass implements Runnable {
    char charToPrint;
    int i=0;

    public myClass(char c ){
        this.charToPrint = c ;
        i++;

    }
    public void run(){
        for(int i =0; i<3; i++){
            System.out.println(charToPrint+"..."+this.i);
        }
    }
}