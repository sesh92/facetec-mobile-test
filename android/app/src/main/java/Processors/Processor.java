package Processors;

public abstract class Processor {
    public abstract boolean isSuccess();
    public abstract void finishedCallback(ProcessPromise promise);
}

