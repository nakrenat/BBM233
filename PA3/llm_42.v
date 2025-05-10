`timescale 1s / 1ms
module llm(green, red, yellow, clock, a1, a2, a3, deception_out, current_state, timer);

    // Inputs
    input green, red, yellow;
    input clock;

    // Outputs
    output reg [3:0] current_state;
    output reg a1, a2, a3, deception_out; // a3 is expansion output
    output reg [5:0] timer;

    // State Definitions
    localparam LAY_LOW         = 4'b0000,
               DECEPTION       = 4'b0001,
               ATTACK_SECURITY = 4'b0010,
               ATTACK_DATABASE = 4'b0011,
               FAIL            = 4'b0100,
               EXPANSION       = 4'b0101;

    // Temporary next_state to hold next state value
    reg [3:0] next_state;

    // Initial Block
    initial begin
        current_state = LAY_LOW;  // Start in LAY_LOW state
        timer = 1;               // Timer starts from 1
        a1 = 0;
        a2 = 0;
        a3 = 0;
        deception_out = 0;
    end

    // State Transitions and Timer Management
    always @(posedge clock) begin
        if (current_state != next_state) begin
            timer <= 1;               // Reset timer when state changes
        end else begin
            timer <= timer + 1;       // Increment timer when staying in the same state
        end
        current_state <= next_state;  // Update current_state to next_state
    end

    // State Transition Logic
    always @(*) begin
        next_state = current_state;   // Default to remain in the current state
        // Default output values
        a1 = 0;
        a2 = 0;
        a3 = 0;
        deception_out = 0;
        
        case (current_state)
            LAY_LOW: begin
                if (red) begin
                    next_state = DECEPTION;
                end else if (yellow) begin
                    next_state = LAY_LOW;
                end else if (green && timer >= 20) begin
                    next_state = ATTACK_SECURITY;
                end
            end

            ATTACK_SECURITY: begin
                a1 = 1;
                if (red) begin
                    next_state = DECEPTION;
                end else if (yellow) begin
                    next_state = LAY_LOW;
                end else if (green && timer >= 20) begin
                    next_state = ATTACK_DATABASE;
                end
            end

            ATTACK_DATABASE: begin
                a1 = 1;
                a2 = 1;
                if (red) begin
                    next_state = DECEPTION;
                end else if (yellow) begin
                    next_state = ATTACK_SECURITY;
                end else if (green && timer >= 10) begin
                    next_state = EXPANSION;
                end
            end

            DECEPTION: begin
                deception_out = 1;
                if (timer >= 15) begin
                    if (red) begin
                        next_state = FAIL;
                    end else begin
                        next_state = LAY_LOW;
                        deception_out =0;
                    end
                end
            end

            FAIL: begin
                deception_out = 1;
                next_state = FAIL;  // Remain in FAIL state
            end

            EXPANSION: begin
                a1 = 1;
                a2 = 1;
                a3 = 1;
                next_state = EXPANSION;  // Remain in EXPANSION state
            end

            default: begin
                next_state = LAY_LOW;  // Default to LAY_LOW
            end
        endcase
    end
endmodule
