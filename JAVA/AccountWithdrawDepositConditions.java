package org.example;

import java.util.concurrent.*;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class AccountWithdrawDepositConditions {
    private static Account account = new Account();

    public static void main(String[] args) {
        ExecutorService executor = Executors.newFixedThreadPool(2);

        // Create and launch 100 threads

            executor.execute(new DepositTask());
            executor.execute(new WithdrawTask());
            executor.shutdown();

        System.out.println("Thread 1\t\tThread 2\t\tBalance");
    }

    // A thread for adding a penny to the account
    private static class DepositTask implements Runnable {
        public void run() {
            while(true){
                account.deposit((int)(Math.random() * 10) + 1);
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
            }

        }
    }

    private static class WithdrawTask implements Runnable{
        public void run(){
            while(true){
                account.withdraw((int)(Math.random() * 10) + 1);
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }

            }
        }
    }

    // An inner class for account
    private static class Account {
        private static Lock lock = new ReentrantLock();
        private static Condition newDeposit = lock.newCondition();
        private int balance = 0;

        public int getBalance() {
            return balance;
        }

        public synchronized void deposit(int amount) {
            lock.lock();
             try {
                balance += amount;
                System.out.println("Deposit " + amount + "\t\t\t\t\t" + getBalance());
                newDeposit.signalAll();
            }finally{
                lock.unlock();
            }
        }

        public synchronized void withdraw(int amount) {
            lock.lock();

            try {
                Thread.sleep(5);
                while(balance<amount){
                    System.out.println("\t\t\tWait for a deposit");
                    newDeposit.await();
                }
                balance -= amount;
                System.out.println("\t\t\tWithdraw " + amount +"\t\t" + getBalance());
            }
            catch (InterruptedException ignored) {
            }
            finally {
                lock.unlock();
            }



        }
    }
}