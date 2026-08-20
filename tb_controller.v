module tb_controller;

    // Inputs to DUT
    reg clk;
    reg reset;
    reg timer_done;

    // Outputs from DUT
    wire A_red;
    wire A_yellow;
    wire A_green;
    wire B_red;
    wire B_yellow;
    wire B_green;
     // instant tiate
      controller uut (
            .clk(clk),
            .reset(reset),
            .timer_done(timer_done),
            .A_red(A_red),
            .A_yellow(A_yellow),
            .A_green(A_green),
            .B_red(B_red),
            .B_yellow(B_yellow),
            .B_green(B_green)
        );
        //clock generation
        always #5 clk=~clk;
        initial begin
        clk=0;
        reset=1;
        timer_done=0;
        
        #10
        reset=0;
        //timer not don
        #20;
        timer_done=1;
        //timer done
        #10;
        timer_done=1;
        #10;
        timer_done=1;
        #10;
        timer_done=1;
        #10;
        timer_done=0;
        // 4 TIMER DONE WILL CHECK FOR ALL 4 TRANSITION STATE AND THEN ITS BECOME O,
        
        //how long to clock go
        #100;
        $finish;
        
        end
        
endmodule