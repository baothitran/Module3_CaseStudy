package com.cg.case_m3.model;

public class Memory {
    private int memoryId;
    private String memory;

    public Memory(int memoryId, String memory) {
        this.memoryId = memoryId;
        this.memory = memory;
    }

    public Memory() {
    }

    public int getMemoryId() {
        return memoryId;
    }

    public void setMemoryId(int memoryId) {
        this.memoryId = memoryId;
    }

    public String getMemory() {
        return memory;
    }

    public void setMemory(String memory) {
        this.memory = memory;
    }
}
