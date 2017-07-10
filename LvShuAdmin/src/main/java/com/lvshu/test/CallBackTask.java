package com.lvshu.test;

/**
 * Created by 田原 on 2017/1/2.
 */
public class CallBackTask {
    private CallBackBody body;

    public CallBackTask(CallBackBody body) {
        this.body = body;
    }

    public void start(Object context) {
        final Thread t = new Thread(new Runnable() {
            public void run() {
                try {
                    body.execute(context);
                } catch (Exception e) {
                    e.printStackTrace();
                    body.onFailure(context);
                }
                body.onSuccess(context);
            }
        });
        t.start();
    }

}
