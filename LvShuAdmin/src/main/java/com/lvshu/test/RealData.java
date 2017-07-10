package com.lvshu.test;

import java.util.concurrent.Callable;

/**
 * Created by 田原 on 2017/1/2.
 */
public class RealData implements Callable<String> {
    protected String data;
    public RealData(String data) {
        this.data = data;
    }
    /**
     * Computes a result, or throws an exception if unable to do so.
     *
     * @return computed result
     * @throws Exception if unable to compute a result
     */
    @Override
    public String call() throws Exception {
        //利用sleep方法来表示真是业务是非常缓慢的
        try {
            System.out.println("1111111111111111");
            Thread.sleep(10000);
            System.out.println("2222222222222222");
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return data;
    }
}
