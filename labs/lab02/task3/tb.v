module tb;
  reg  [1:0] t_a;
  reg  [1:0] t_b;
  wire t_gt, t_lt, t_eq;

  // TODO: instantiate DUT here, connecting t_i0, t_i1, t_s, t_y to its ports
  comp2 DUT (
    .A(t_a),
    .B(t_b),
    .GT(t_gt),
    .LT(t_lt),
    .EQ(t_eq)
  );

  // Waveform dump configuration
  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, DUT);
    end
  end

  initial begin
       t_a = 2'b00; t_b = 2'b00;
    #5 t_a = 2'b01; t_b = 2'b00;
    #5 t_a = 2'b10; t_b = 2'b00;
    #5 t_a = 2'b11; t_b = 2'b00;

    #5 t_a = 2'b00; t_b = 2'b01;
    #5 t_a = 2'b01; t_b = 2'b01;
    #5 t_a = 2'b10; t_b = 2'b01;
    #5 t_a = 2'b11; t_b = 2'b01;

    #5 t_a = 2'b00; t_b = 2'b10;
    #5 t_a = 2'b01; t_b = 2'b10;
    #5 t_a = 2'b10; t_b = 2'b10;
    #5 t_a = 2'b11; t_b = 2'b10;

    #5 t_a = 2'b00; t_b = 2'b11;
    #5 t_a = 2'b01; t_b = 2'b11;
    #5 t_a = 2'b10; t_b = 2'b11;
    #5 t_a = 2'b11; t_b = 2'b11;
    #5 $finish;
  end

  initial
    $monitor($time, " A=%b B=%b | GT=%b | LT=%b | EQ=%b" , t_a, t_b, t_gt, t_lt, t_eq);

endmodule
