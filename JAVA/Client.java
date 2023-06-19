package org.example;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class Client {
    public static void main(String[] args){
             // Create a fixed thread pool with maximum three threads
             ExecutorService executor = Executors.newFixedThreadPool(3);


             // Submit runnable tasks to the executor
             executor.execute(new myClass('A'));
             executor.execute(new myClass('b'));
              executor.execute(new myClass('c'));

            // Shut down the executor
              executor.shutdown();
           }
      }


