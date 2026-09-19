// tb.v
// Starter testbench template -- YOU complete this file.

module tb;

  parameter TB_WIDTH = 8;
  parameter TB_DEPTH = 4;

  // TODO: declare the inputs and outputs
  reg [$clog2(TB_DEPTH)-1:0] t_sel;
  wire [TB_WIDTH-1:0]         t_dout;
  // TODO: instantiate DUT here
  lut #(
    .WIDTH(TB_WIDTH),
    .DEPTH(TB_DEPTH)
  )
  DUT(
    .sel(t_sel),
    .dout(t_dout)
  );
  // Waveform dump configuration (DO NOT CHANGE)
  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, DUT);
    end
  end

  integer i;
  initial begin
  // TODO: apply different input combinations
  for(i = 0; i < TB_DEPTH; i = i + 1) begin
    t_sel = i; 
    #5;
  end
  $finish;
  end

  initial begin
  $monitor($time, " sel=%d | dout=%d", t_sel, t_dout); // change as required
  end
endmodule
