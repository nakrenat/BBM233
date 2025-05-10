module two_s_complement(In, Out);
    input [3:0] In;   // 4-bit input
    output [3:0] Out; // 4-bit output

    // Out3
    assign Out[3] = In[3] ^ (In[2]|In[1]|In[0]);

    // Out2
    assign Out[2] = In[2] ^ (In[1]|In[0]);

    // Out1
    assign Out[1] = In[1]^In[0];

    // Out0
    assign Out[0] = In[0];

endmodule
