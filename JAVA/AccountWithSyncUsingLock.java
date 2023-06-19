package org.example;

import java.util.concurrent.*;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class AccountWithSyncUsingLock {
    private static Account account = new Account();

    public static void main(String[] args) {
        ExecutorService executor = Executors.newCachedThreadPool();

        // Create and launch 100 threads
        for (int i = 0; i < 100; i++) {
            executor.execute(new AddAPennyTask());
        }

        executor.shutdown();

        // Wait until all tasks are finished
        while (!executor.isTerminated()) {
        }

        System.out.println("What is balance? " + account.getBalance());
    }

    // A thread for adding a penny to the account
    private static class AddAPennyTask implements Runnable {
        public void run() {
            account.deposit(1);
        }
    }

    // An inner class for account
    private static class Account {
        private static Lock lock = new ReentrantLock();
        private int balance = 0;

        public int getBalance() {
            return balance;
        }

        public synchronized void deposit(int amount) {
            int newBalance = balance + amount;
            lock.lock();
//            System.out.println("lock is locked");

            try {
                Thread.sleep(5);
            }
            catch (InterruptedException ignored) {
            }
            lock.unlock();
//            System.out.println("lock is unlocked");

            balance = newBalance;
        }
    }
}