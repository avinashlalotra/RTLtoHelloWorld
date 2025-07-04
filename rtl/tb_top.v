`timescale 1ns / 1ns

module top_tb;
    // Simulation parameters
    parameter CLK_PERIOD = 20; // 
    parameter NO_OF_LEDS = 4;
   
    // Testbench signals
    reg clk;
    reg resetn;
    reg ser_rx;
    wire ser_tx;
    wire [NO_OF_LEDS-1:0] led;
    wire reset_led;
    
    // Instantiate the SOC with debug signals
    top #(
        .NO_OF_LEDS(NO_OF_LEDS)
    )uut (
        .clk(clk),
        .resetn(resetn),
        .ser_rx(ser_rx),
        .ser_tx(ser_tx),
        .led(led),
        .reset_led(reset_led)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end


    initial begin
        // Initialize signals
        #100;
        clk = 0;
        resetn = 0;
        ser_rx = 1;
        #100;   // Wait 100ns
        resetn = 1;  // Release reset

        // Run simulation for some time
        #1000;

        $finish;
    end

endmodule
