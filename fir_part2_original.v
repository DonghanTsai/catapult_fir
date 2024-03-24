// ----------------------------------------------------------------------
//  HLS HDL:        Verilog Netlister
//  HLS Version:    2023.2/1059873 Production Release
//  HLS Date:       Mon Aug  7 10:54:31 PDT 2023
// 
//  Generated by:   b08092@cad40
//  Generated date: Sun Mar 24 15:20:01 2024
// ----------------------------------------------------------------------

// 
// ------------------------------------------------------------------
//  Design Unit:    fir_ccs_sample_mem_ccs_ram_sync_1R1W_rport_2_8_8_256_256_8_5_gen
// ------------------------------------------------------------------


module fir_ccs_sample_mem_ccs_ram_sync_1R1W_rport_2_8_8_256_256_8_5_gen (
  q, re, radr, radr_d, re_d, q_d, port_0_r_ram_ir_internal_RMASK_B_d
);
  input [7:0] q;
  output re;
  output [7:0] radr;
  input [7:0] radr_d;
  input re_d;
  output [7:0] q_d;
  input port_0_r_ram_ir_internal_RMASK_B_d;



  // Interconnect Declarations for Component Instantiations 
  assign q_d = q;
  assign re = (port_0_r_ram_ir_internal_RMASK_B_d);
  assign radr = (radr_d);
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_run_fsm
//  FSM Module
// ------------------------------------------------------------------


module fir_run_run_fsm (
  clk, rst, run_wen, fsm_output, SHIFT_C_1_tr0
);
  input clk;
  input rst;
  input run_wen;
  output [4:0] fsm_output;
  reg [4:0] fsm_output;
  input SHIFT_C_1_tr0;


  // FSM State Type Declaration for fir_run_run_fsm_1
  parameter
    run_rlp_C_0 = 3'd0,
    main_C_0 = 3'd1,
    SHIFT_C_0 = 3'd2,
    SHIFT_C_1 = 3'd3,
    main_C_1 = 3'd4;

  reg [2:0] state_var;
  reg [2:0] state_var_NS;


  // Interconnect Declarations for Component Instantiations 
  always @(*)
  begin : fir_run_run_fsm_1
    case (state_var)
      main_C_0 : begin
        fsm_output = 5'b00010;
        state_var_NS = SHIFT_C_0;
      end
      SHIFT_C_0 : begin
        fsm_output = 5'b00100;
        state_var_NS = SHIFT_C_1;
      end
      SHIFT_C_1 : begin
        fsm_output = 5'b01000;
        if ( SHIFT_C_1_tr0 ) begin
          state_var_NS = main_C_1;
        end
        else begin
          state_var_NS = SHIFT_C_0;
        end
      end
      main_C_1 : begin
        fsm_output = 5'b10000;
        state_var_NS = main_C_0;
      end
      // run_rlp_C_0
      default : begin
        fsm_output = 5'b00001;
        state_var_NS = main_C_0;
      end
    endcase
  end

  always @(posedge clk) begin
    if ( rst ) begin
      state_var <= run_rlp_C_0;
    end
    else if ( run_wen ) begin
      state_var <= state_var_NS;
    end
  end

endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_staller
// ------------------------------------------------------------------


module fir_run_staller (
  clk, rst, run_wen, run_wten, input_rsci_wen_comp, coeff_addr_rsci_wen_comp, output_rsci_wen_comp
);
  input clk;
  input rst;
  output run_wen;
  output run_wten;
  input input_rsci_wen_comp;
  input coeff_addr_rsci_wen_comp;
  input output_rsci_wen_comp;


  // Interconnect Declarations
  reg run_wten_reg;


  // Interconnect Declarations for Component Instantiations 
  assign run_wen = input_rsci_wen_comp & coeff_addr_rsci_wen_comp & output_rsci_wen_comp;
  assign run_wten = run_wten_reg;
  always @(posedge clk) begin
    if ( rst ) begin
      run_wten_reg <= 1'b0;
    end
    else begin
      run_wten_reg <= ~ run_wen;
    end
  end
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl
// ------------------------------------------------------------------


module fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl (
  run_wten, coeffs_triosy_obj_iswt0, coeffs_triosy_obj_biwt
);
  input run_wten;
  input coeffs_triosy_obj_iswt0;
  output coeffs_triosy_obj_biwt;



  // Interconnect Declarations for Component Instantiations 
  assign coeffs_triosy_obj_biwt = (~ run_wten) & coeffs_triosy_obj_iswt0;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_output_rsci_output_wait_ctrl
// ------------------------------------------------------------------


module fir_run_output_rsci_output_wait_ctrl (
  output_rsci_iswt0, output_rsci_biwt, output_rsci_irdy
);
  input output_rsci_iswt0;
  output output_rsci_biwt;
  input output_rsci_irdy;



  // Interconnect Declarations for Component Instantiations 
  assign output_rsci_biwt = output_rsci_iswt0 & output_rsci_irdy;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_coeff_addr_rsci_coeff_addr_wait_ctrl
// ------------------------------------------------------------------


module fir_run_coeff_addr_rsci_coeff_addr_wait_ctrl (
  coeff_addr_rsci_iswt0, coeff_addr_rsci_biwt, coeff_addr_rsci_ivld
);
  input coeff_addr_rsci_iswt0;
  output coeff_addr_rsci_biwt;
  input coeff_addr_rsci_ivld;



  // Interconnect Declarations for Component Instantiations 
  assign coeff_addr_rsci_biwt = coeff_addr_rsci_iswt0 & coeff_addr_rsci_ivld;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_coeffs_rsci_1_coeffs_rsc_wait_dp
// ------------------------------------------------------------------


module fir_run_coeffs_rsci_1_coeffs_rsc_wait_dp (
  clk, rst, coeffs_rsci_q_d, coeffs_rsci_q_d_mxwt, coeffs_rsci_biwt, coeffs_rsci_bdwt
);
  input clk;
  input rst;
  input [7:0] coeffs_rsci_q_d;
  output [7:0] coeffs_rsci_q_d_mxwt;
  input coeffs_rsci_biwt;
  input coeffs_rsci_bdwt;


  // Interconnect Declarations
  reg coeffs_rsci_bcwt;
  reg [7:0] coeffs_rsci_q_d_bfwt;


  // Interconnect Declarations for Component Instantiations 
  assign coeffs_rsci_q_d_mxwt = MUX_v_8_2_2(coeffs_rsci_q_d, coeffs_rsci_q_d_bfwt,
      coeffs_rsci_bcwt);
  always @(posedge clk) begin
    if ( rst ) begin
      coeffs_rsci_bcwt <= 1'b0;
    end
    else begin
      coeffs_rsci_bcwt <= ~((~(coeffs_rsci_bcwt | coeffs_rsci_biwt)) | coeffs_rsci_bdwt);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      coeffs_rsci_q_d_bfwt <= 8'b00000000;
    end
    else if ( coeffs_rsci_biwt ) begin
      coeffs_rsci_q_d_bfwt <= coeffs_rsci_q_d;
    end
  end

  function automatic [7:0] MUX_v_8_2_2;
    input [7:0] input_0;
    input [7:0] input_1;
    input  sel;
    reg [7:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_8_2_2 = result;
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_coeffs_rsci_1_coeffs_rsc_wait_ctrl
// ------------------------------------------------------------------


module fir_run_coeffs_rsci_1_coeffs_rsc_wait_ctrl (
  run_wen, run_wten, coeffs_rsci_oswt, coeffs_rsci_biwt, coeffs_rsci_bdwt, coeffs_rsci_biwt_pff,
      coeffs_rsci_oswt_pff
);
  input run_wen;
  input run_wten;
  input coeffs_rsci_oswt;
  output coeffs_rsci_biwt;
  output coeffs_rsci_bdwt;
  output coeffs_rsci_biwt_pff;
  input coeffs_rsci_oswt_pff;



  // Interconnect Declarations for Component Instantiations 
  assign coeffs_rsci_bdwt = coeffs_rsci_oswt & run_wen;
  assign coeffs_rsci_biwt = (~ run_wten) & coeffs_rsci_oswt;
  assign coeffs_rsci_biwt_pff = run_wen & coeffs_rsci_oswt_pff;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_input_rsci_input_wait_ctrl
// ------------------------------------------------------------------


module fir_run_input_rsci_input_wait_ctrl (
  input_rsci_iswt0, input_rsci_biwt, input_rsci_ivld
);
  input input_rsci_iswt0;
  output input_rsci_biwt;
  input input_rsci_ivld;



  // Interconnect Declarations for Component Instantiations 
  assign input_rsci_biwt = input_rsci_iswt0 & input_rsci_ivld;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_coeffs_triosy_obj
// ------------------------------------------------------------------


module fir_run_coeffs_triosy_obj (
  coeffs_triosy_lz, run_wten, coeffs_triosy_obj_iswt0
);
  output coeffs_triosy_lz;
  input run_wten;
  input coeffs_triosy_obj_iswt0;


  // Interconnect Declarations
  wire coeffs_triosy_obj_biwt;


  // Interconnect Declarations for Component Instantiations 
  mgc_io_sync_v2 #(.valid(32'sd0)) coeffs_triosy_obj (
      .ld(coeffs_triosy_obj_biwt),
      .lz(coeffs_triosy_lz)
    );
  fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl fir_run_coeffs_triosy_obj_coeffs_triosy_wait_ctrl_inst
      (
      .run_wten(run_wten),
      .coeffs_triosy_obj_iswt0(coeffs_triosy_obj_iswt0),
      .coeffs_triosy_obj_biwt(coeffs_triosy_obj_biwt)
    );
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_output_rsci
// ------------------------------------------------------------------


module fir_run_output_rsci (
  output_rsc_dat, output_rsc_vld, output_rsc_rdy, output_rsci_oswt, output_rsci_wen_comp,
      output_rsci_idat
);
  output [7:0] output_rsc_dat;
  output output_rsc_vld;
  input output_rsc_rdy;
  input output_rsci_oswt;
  output output_rsci_wen_comp;
  input [7:0] output_rsci_idat;


  // Interconnect Declarations
  wire output_rsci_biwt;
  wire output_rsci_irdy;


  // Interconnect Declarations for Component Instantiations 
  ccs_out_wait_v1 #(.rscid(32'sd4),
  .width(32'sd8)) output_rsci (
      .irdy(output_rsci_irdy),
      .ivld(output_rsci_oswt),
      .idat(output_rsci_idat),
      .rdy(output_rsc_rdy),
      .vld(output_rsc_vld),
      .dat(output_rsc_dat)
    );
  fir_run_output_rsci_output_wait_ctrl fir_run_output_rsci_output_wait_ctrl_inst
      (
      .output_rsci_iswt0(output_rsci_oswt),
      .output_rsci_biwt(output_rsci_biwt),
      .output_rsci_irdy(output_rsci_irdy)
    );
  assign output_rsci_wen_comp = (~ output_rsci_oswt) | output_rsci_biwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_coeff_addr_rsci
// ------------------------------------------------------------------


module fir_run_coeff_addr_rsci (
  coeff_addr_rsc_dat, coeff_addr_rsc_vld, coeff_addr_rsc_rdy, coeff_addr_rsci_oswt,
      coeff_addr_rsci_wen_comp, coeff_addr_rsci_idat_mxwt
);
  input [4:0] coeff_addr_rsc_dat;
  input coeff_addr_rsc_vld;
  output coeff_addr_rsc_rdy;
  input coeff_addr_rsci_oswt;
  output coeff_addr_rsci_wen_comp;
  output [4:0] coeff_addr_rsci_idat_mxwt;


  // Interconnect Declarations
  wire coeff_addr_rsci_biwt;
  wire coeff_addr_rsci_ivld;
  wire [4:0] coeff_addr_rsci_idat;


  // Interconnect Declarations for Component Instantiations 
  ccs_in_wait_v1 #(.rscid(32'sd3),
  .width(32'sd5)) coeff_addr_rsci (
      .rdy(coeff_addr_rsc_rdy),
      .vld(coeff_addr_rsc_vld),
      .dat(coeff_addr_rsc_dat),
      .irdy(coeff_addr_rsci_oswt),
      .ivld(coeff_addr_rsci_ivld),
      .idat(coeff_addr_rsci_idat)
    );
  fir_run_coeff_addr_rsci_coeff_addr_wait_ctrl fir_run_coeff_addr_rsci_coeff_addr_wait_ctrl_inst
      (
      .coeff_addr_rsci_iswt0(coeff_addr_rsci_oswt),
      .coeff_addr_rsci_biwt(coeff_addr_rsci_biwt),
      .coeff_addr_rsci_ivld(coeff_addr_rsci_ivld)
    );
  assign coeff_addr_rsci_idat_mxwt = coeff_addr_rsci_idat;
  assign coeff_addr_rsci_wen_comp = (~ coeff_addr_rsci_oswt) | coeff_addr_rsci_biwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_coeffs_rsci_1
// ------------------------------------------------------------------


module fir_run_coeffs_rsci_1 (
  clk, rst, coeffs_rsci_q_d, run_wen, run_wten, coeffs_rsci_oswt, coeffs_rsci_q_d_mxwt,
      coeffs_rsci_re_d_pff, coeffs_rsci_oswt_pff
);
  input clk;
  input rst;
  input [7:0] coeffs_rsci_q_d;
  input run_wen;
  input run_wten;
  input coeffs_rsci_oswt;
  output [7:0] coeffs_rsci_q_d_mxwt;
  output coeffs_rsci_re_d_pff;
  input coeffs_rsci_oswt_pff;


  // Interconnect Declarations
  wire coeffs_rsci_biwt;
  wire coeffs_rsci_bdwt;
  wire coeffs_rsci_biwt_iff;


  // Interconnect Declarations for Component Instantiations 
  fir_run_coeffs_rsci_1_coeffs_rsc_wait_ctrl fir_run_coeffs_rsci_1_coeffs_rsc_wait_ctrl_inst
      (
      .run_wen(run_wen),
      .run_wten(run_wten),
      .coeffs_rsci_oswt(coeffs_rsci_oswt),
      .coeffs_rsci_biwt(coeffs_rsci_biwt),
      .coeffs_rsci_bdwt(coeffs_rsci_bdwt),
      .coeffs_rsci_biwt_pff(coeffs_rsci_biwt_iff),
      .coeffs_rsci_oswt_pff(coeffs_rsci_oswt_pff)
    );
  fir_run_coeffs_rsci_1_coeffs_rsc_wait_dp fir_run_coeffs_rsci_1_coeffs_rsc_wait_dp_inst
      (
      .clk(clk),
      .rst(rst),
      .coeffs_rsci_q_d(coeffs_rsci_q_d),
      .coeffs_rsci_q_d_mxwt(coeffs_rsci_q_d_mxwt),
      .coeffs_rsci_biwt(coeffs_rsci_biwt),
      .coeffs_rsci_bdwt(coeffs_rsci_bdwt)
    );
  assign coeffs_rsci_re_d_pff = coeffs_rsci_biwt_iff;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run_input_rsci
// ------------------------------------------------------------------


module fir_run_input_rsci (
  input_rsc_dat, input_rsc_vld, input_rsc_rdy, input_rsci_oswt, input_rsci_wen_comp,
      input_rsci_idat_mxwt
);
  input [7:0] input_rsc_dat;
  input input_rsc_vld;
  output input_rsc_rdy;
  input input_rsci_oswt;
  output input_rsci_wen_comp;
  output [7:0] input_rsci_idat_mxwt;


  // Interconnect Declarations
  wire input_rsci_biwt;
  wire input_rsci_ivld;
  wire [7:0] input_rsci_idat;


  // Interconnect Declarations for Component Instantiations 
  ccs_in_wait_v1 #(.rscid(32'sd1),
  .width(32'sd8)) input_rsci (
      .rdy(input_rsc_rdy),
      .vld(input_rsc_vld),
      .dat(input_rsc_dat),
      .irdy(input_rsci_oswt),
      .ivld(input_rsci_ivld),
      .idat(input_rsci_idat)
    );
  fir_run_input_rsci_input_wait_ctrl fir_run_input_rsci_input_wait_ctrl_inst (
      .input_rsci_iswt0(input_rsci_oswt),
      .input_rsci_biwt(input_rsci_biwt),
      .input_rsci_ivld(input_rsci_ivld)
    );
  assign input_rsci_idat_mxwt = input_rsci_idat;
  assign input_rsci_wen_comp = (~ input_rsci_oswt) | input_rsci_biwt;
endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir_run
// ------------------------------------------------------------------


module fir_run (
  clk, rst, input_rsc_dat, input_rsc_vld, input_rsc_rdy, coeffs_triosy_lz, coeff_addr_rsc_dat,
      coeff_addr_rsc_vld, coeff_addr_rsc_rdy, output_rsc_dat, output_rsc_vld, output_rsc_rdy,
      coeffs_rsci_radr_d, coeffs_rsci_q_d, coeffs_rsci_re_d_pff
);
  input clk;
  input rst;
  input [7:0] input_rsc_dat;
  input input_rsc_vld;
  output input_rsc_rdy;
  output coeffs_triosy_lz;
  input [4:0] coeff_addr_rsc_dat;
  input coeff_addr_rsc_vld;
  output coeff_addr_rsc_rdy;
  output [7:0] output_rsc_dat;
  output output_rsc_vld;
  input output_rsc_rdy;
  output [7:0] coeffs_rsci_radr_d;
  input [7:0] coeffs_rsci_q_d;
  output coeffs_rsci_re_d_pff;


  // Interconnect Declarations
  wire run_wen;
  wire run_wten;
  wire input_rsci_wen_comp;
  wire [7:0] input_rsci_idat_mxwt;
  wire [7:0] coeffs_rsci_q_d_mxwt;
  wire coeff_addr_rsci_wen_comp;
  wire [4:0] coeff_addr_rsci_idat_mxwt;
  wire output_rsci_wen_comp;
  reg [7:0] output_rsci_idat;
  wire [4:0] fsm_output;
  wire SHIFT_and_tmp;
  wire or_dcpl_5;
  wire or_dcpl_7;
  wire or_dcpl_11;
  wire or_dcpl_13;
  reg [2:0] SHIFT_i_3_0_sva_2_0;
  reg [3:0] SHIFT_i_3_0_sva_1;
  wire [4:0] nl_SHIFT_i_3_0_sva_1;
  reg reg_coeffs_triosy_obj_iswt0_cse;
  reg reg_coeff_addr_rsci_iswt0_cse;
  reg reg_coeffs_rsci_iswt0_cse;
  reg reg_input_rsci_iswt0_cse;
  wire temp_and_cse;
  wire coeffs_rsci_re_d_iff;
  reg [4:0] addr_sva;
  reg [2:0] MAC_i_3_0_sva_2_0;
  reg [7:0] regs_0_lpi_2;
  reg [7:0] regs_3_lpi_2;
  reg [7:0] regs_4_lpi_2;
  reg [7:0] regs_2_lpi_2;
  reg [7:0] regs_5_lpi_2;
  reg [7:0] regs_1_lpi_2;
  reg [7:0] regs_6_lpi_2;
  reg [7:0] regs_7_lpi_2;
  reg [18:0] temp_sva;
  reg [3:0] MAC_i_3_0_sva_1;
  wire [4:0] nl_MAC_i_3_0_sva_1;
  wire [18:0] temp_sva_2;
  wire [19:0] nl_temp_sva_2;
  wire [7:0] SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;

  wire not_37_nl;
  wire temp_not_1_nl;
  wire not_38_nl;
  wire[15:0] MAC_mul_nl;
  wire[7:0] MAC_mux_nl;
  wire signed [15:0] nl_MAC_mul_sgnd;

  // Interconnect Declarations for Component Instantiations 
  wire  nl_fir_run_coeffs_rsci_1_inst_coeffs_rsci_oswt_pff;
  assign nl_fir_run_coeffs_rsci_1_inst_coeffs_rsci_oswt_pff = fsm_output[2];
  fir_run_input_rsci fir_run_input_rsci_inst (
      .input_rsc_dat(input_rsc_dat),
      .input_rsc_vld(input_rsc_vld),
      .input_rsc_rdy(input_rsc_rdy),
      .input_rsci_oswt(reg_input_rsci_iswt0_cse),
      .input_rsci_wen_comp(input_rsci_wen_comp),
      .input_rsci_idat_mxwt(input_rsci_idat_mxwt)
    );
  fir_run_coeffs_rsci_1 fir_run_coeffs_rsci_1_inst (
      .clk(clk),
      .rst(rst),
      .coeffs_rsci_q_d(coeffs_rsci_q_d),
      .run_wen(run_wen),
      .run_wten(run_wten),
      .coeffs_rsci_oswt(reg_coeffs_rsci_iswt0_cse),
      .coeffs_rsci_q_d_mxwt(coeffs_rsci_q_d_mxwt),
      .coeffs_rsci_re_d_pff(coeffs_rsci_re_d_iff),
      .coeffs_rsci_oswt_pff(nl_fir_run_coeffs_rsci_1_inst_coeffs_rsci_oswt_pff)
    );
  fir_run_coeff_addr_rsci fir_run_coeff_addr_rsci_inst (
      .coeff_addr_rsc_dat(coeff_addr_rsc_dat),
      .coeff_addr_rsc_vld(coeff_addr_rsc_vld),
      .coeff_addr_rsc_rdy(coeff_addr_rsc_rdy),
      .coeff_addr_rsci_oswt(reg_coeff_addr_rsci_iswt0_cse),
      .coeff_addr_rsci_wen_comp(coeff_addr_rsci_wen_comp),
      .coeff_addr_rsci_idat_mxwt(coeff_addr_rsci_idat_mxwt)
    );
  fir_run_output_rsci fir_run_output_rsci_inst (
      .output_rsc_dat(output_rsc_dat),
      .output_rsc_vld(output_rsc_vld),
      .output_rsc_rdy(output_rsc_rdy),
      .output_rsci_oswt(reg_coeffs_triosy_obj_iswt0_cse),
      .output_rsci_wen_comp(output_rsci_wen_comp),
      .output_rsci_idat(output_rsci_idat)
    );
  fir_run_coeffs_triosy_obj fir_run_coeffs_triosy_obj_inst (
      .coeffs_triosy_lz(coeffs_triosy_lz),
      .run_wten(run_wten),
      .coeffs_triosy_obj_iswt0(reg_coeffs_triosy_obj_iswt0_cse)
    );
  fir_run_staller fir_run_staller_inst (
      .clk(clk),
      .rst(rst),
      .run_wen(run_wen),
      .run_wten(run_wten),
      .input_rsci_wen_comp(input_rsci_wen_comp),
      .coeff_addr_rsci_wen_comp(coeff_addr_rsci_wen_comp),
      .output_rsci_wen_comp(output_rsci_wen_comp)
    );
  fir_run_run_fsm fir_run_run_fsm_inst (
      .clk(clk),
      .rst(rst),
      .run_wen(run_wen),
      .fsm_output(fsm_output),
      .SHIFT_C_1_tr0(SHIFT_and_tmp)
    );
  assign temp_and_cse = run_wen & ((fsm_output[3]) | (fsm_output[1]));
  assign MAC_mux_nl = MUX_v_8_8_2(regs_0_lpi_2, regs_1_lpi_2, regs_2_lpi_2, regs_3_lpi_2,
      regs_4_lpi_2, regs_5_lpi_2, regs_6_lpi_2, regs_7_lpi_2, MAC_i_3_0_sva_2_0);
  assign nl_MAC_mul_sgnd = $signed((coeffs_rsci_q_d_mxwt)) * $signed(MAC_mux_nl);
  assign MAC_mul_nl = $unsigned(nl_MAC_mul_sgnd);
  assign nl_temp_sva_2 = temp_sva + conv_s2s_16_19(MAC_mul_nl);
  assign temp_sva_2 = nl_temp_sva_2[18:0];
  assign SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1 = MUX_v_8_8_2x0(regs_0_lpi_2,
      regs_1_lpi_2, regs_2_lpi_2, regs_3_lpi_2, regs_4_lpi_2, regs_5_lpi_2, regs_6_lpi_2,
      SHIFT_i_3_0_sva_2_0);
  assign SHIFT_and_tmp = (SHIFT_i_3_0_sva_1[3]) & (MAC_i_3_0_sva_1[3]);
  assign or_dcpl_5 = (SHIFT_i_3_0_sva_2_0[2]) | (SHIFT_i_3_0_sva_2_0[0]);
  assign or_dcpl_7 = (SHIFT_i_3_0_sva_2_0[2]) | (~ (SHIFT_i_3_0_sva_2_0[0]));
  assign or_dcpl_11 = (~ (SHIFT_i_3_0_sva_2_0[2])) | (SHIFT_i_3_0_sva_2_0[0]);
  assign or_dcpl_13 = ~((SHIFT_i_3_0_sva_2_0[2]) & (SHIFT_i_3_0_sva_2_0[0]));
  assign coeffs_rsci_radr_d = {addr_sva , MAC_i_3_0_sva_2_0};
  assign coeffs_rsci_re_d_pff = coeffs_rsci_re_d_iff;
  always @(posedge clk) begin
    if ( rst ) begin
      reg_coeffs_triosy_obj_iswt0_cse <= 1'b0;
      reg_coeff_addr_rsci_iswt0_cse <= 1'b0;
      reg_coeffs_rsci_iswt0_cse <= 1'b0;
      reg_input_rsci_iswt0_cse <= 1'b0;
      SHIFT_i_3_0_sva_2_0 <= 3'b000;
      SHIFT_i_3_0_sva_1 <= 4'b0000;
      MAC_i_3_0_sva_1 <= 4'b0000;
    end
    else if ( run_wen ) begin
      reg_coeffs_triosy_obj_iswt0_cse <= SHIFT_and_tmp & (fsm_output[3]);
      reg_coeff_addr_rsci_iswt0_cse <= (fsm_output[4]) | (fsm_output[0]);
      reg_coeffs_rsci_iswt0_cse <= fsm_output[2];
      reg_input_rsci_iswt0_cse <= (~((SHIFT_i_3_0_sva_1[0]) | SHIFT_and_tmp)) & (SHIFT_i_3_0_sva_1[2:1]==2'b00)
          & (fsm_output[3]);
      SHIFT_i_3_0_sva_2_0 <= MUX_v_3_2_2((SHIFT_i_3_0_sva_1[2:0]), 3'b111, not_37_nl);
      SHIFT_i_3_0_sva_1 <= nl_SHIFT_i_3_0_sva_1[3:0];
      MAC_i_3_0_sva_1 <= nl_MAC_i_3_0_sva_1[3:0];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      output_rsci_idat <= 8'b00000000;
    end
    else if ( run_wen & SHIFT_and_tmp & (fsm_output[3]) ) begin
      output_rsci_idat <= temp_sva_2[18:11];
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      regs_0_lpi_2 <= 8'b00000000;
    end
    else if ( run_wen & (~((~ (fsm_output[2])) | or_dcpl_5 | (SHIFT_i_3_0_sva_2_0[1])))
        ) begin
      regs_0_lpi_2 <= input_rsci_idat_mxwt;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      regs_1_lpi_2 <= 8'b00000000;
    end
    else if ( run_wen & (~((~ (fsm_output[2])) | or_dcpl_7 | (SHIFT_i_3_0_sva_2_0[1])))
        ) begin
      regs_1_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      regs_2_lpi_2 <= 8'b00000000;
    end
    else if ( run_wen & (~((~ (fsm_output[2])) | or_dcpl_5 | (~ (SHIFT_i_3_0_sva_2_0[1]))))
        ) begin
      regs_2_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      regs_3_lpi_2 <= 8'b00000000;
    end
    else if ( run_wen & (~((~ (fsm_output[2])) | or_dcpl_7 | (~ (SHIFT_i_3_0_sva_2_0[1]))))
        ) begin
      regs_3_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      regs_4_lpi_2 <= 8'b00000000;
    end
    else if ( run_wen & (~((~ (fsm_output[2])) | or_dcpl_11 | (SHIFT_i_3_0_sva_2_0[1])))
        ) begin
      regs_4_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      regs_5_lpi_2 <= 8'b00000000;
    end
    else if ( run_wen & (~((~ (fsm_output[2])) | or_dcpl_13 | (SHIFT_i_3_0_sva_2_0[1])))
        ) begin
      regs_5_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      regs_6_lpi_2 <= 8'b00000000;
    end
    else if ( run_wen & (~((~ (fsm_output[2])) | or_dcpl_11 | (~ (SHIFT_i_3_0_sva_2_0[1]))))
        ) begin
      regs_6_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      regs_7_lpi_2 <= 8'b00000000;
    end
    else if ( run_wen & (~((fsm_output[3]) | ((or_dcpl_13 | (~ (SHIFT_i_3_0_sva_2_0[1])))
        & (fsm_output[2])))) ) begin
      regs_7_lpi_2 <= SHIFT_else_SHIFT_else_slc_regs_8_7_0_1_ctmp_sva_1;
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      temp_sva <= 19'b0000000000000000000;
      MAC_i_3_0_sva_2_0 <= 3'b000;
    end
    else if ( temp_and_cse ) begin
      temp_sva <= MUX_v_19_2_2(19'b0000000000000000000, temp_sva_2, temp_not_1_nl);
      MAC_i_3_0_sva_2_0 <= MUX_v_3_2_2((MAC_i_3_0_sva_1[2:0]), 3'b111, not_38_nl);
    end
  end
  always @(posedge clk) begin
    if ( rst ) begin
      addr_sva <= 5'b00000;
    end
    else if ( run_wen & (fsm_output[3:2]==2'b00) ) begin
      addr_sva <= coeff_addr_rsci_idat_mxwt;
    end
  end
  assign not_37_nl = ~ (fsm_output[3]);
  assign nl_SHIFT_i_3_0_sva_1  = conv_u2s_3_4(SHIFT_i_3_0_sva_2_0) + 4'b1111;
  assign nl_MAC_i_3_0_sva_1  = conv_u2s_3_4(MAC_i_3_0_sva_2_0) + 4'b1111;
  assign temp_not_1_nl = ~ (fsm_output[1]);
  assign not_38_nl = ~ (fsm_output[3]);

  function automatic [18:0] MUX_v_19_2_2;
    input [18:0] input_0;
    input [18:0] input_1;
    input  sel;
    reg [18:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_19_2_2 = result;
  end
  endfunction


  function automatic [2:0] MUX_v_3_2_2;
    input [2:0] input_0;
    input [2:0] input_1;
    input  sel;
    reg [2:0] result;
  begin
    case (sel)
      1'b0 : begin
        result = input_0;
      end
      default : begin
        result = input_1;
      end
    endcase
    MUX_v_3_2_2 = result;
  end
  endfunction


  function automatic [7:0] MUX_v_8_8_2;
    input [7:0] input_0;
    input [7:0] input_1;
    input [7:0] input_2;
    input [7:0] input_3;
    input [7:0] input_4;
    input [7:0] input_5;
    input [7:0] input_6;
    input [7:0] input_7;
    input [2:0] sel;
    reg [7:0] result;
  begin
    case (sel)
      3'b000 : begin
        result = input_0;
      end
      3'b001 : begin
        result = input_1;
      end
      3'b010 : begin
        result = input_2;
      end
      3'b011 : begin
        result = input_3;
      end
      3'b100 : begin
        result = input_4;
      end
      3'b101 : begin
        result = input_5;
      end
      3'b110 : begin
        result = input_6;
      end
      default : begin
        result = input_7;
      end
    endcase
    MUX_v_8_8_2 = result;
  end
  endfunction


  function automatic [7:0] MUX_v_8_8_2x0;
    input [7:0] input_1;
    input [7:0] input_2;
    input [7:0] input_3;
    input [7:0] input_4;
    input [7:0] input_5;
    input [7:0] input_6;
    input [7:0] input_7;
    input [2:0] sel;
    reg [7:0] result;
  begin
    case (sel)
      3'b001 : begin
        result = input_1;
      end
      3'b010 : begin
        result = input_2;
      end
      3'b011 : begin
        result = input_3;
      end
      3'b100 : begin
        result = input_4;
      end
      3'b101 : begin
        result = input_5;
      end
      3'b110 : begin
        result = input_6;
      end
      default : begin
        result = input_7;
      end
    endcase
    MUX_v_8_8_2x0 = result;
  end
  endfunction


  function automatic [18:0] conv_s2s_16_19 ;
    input [15:0]  vector ;
  begin
    conv_s2s_16_19 = {{3{vector[15]}}, vector};
  end
  endfunction


  function automatic [3:0] conv_u2s_3_4 ;
    input [2:0]  vector ;
  begin
    conv_u2s_3_4 =  {1'b0, vector};
  end
  endfunction

endmodule

// ------------------------------------------------------------------
//  Design Unit:    fir
// ------------------------------------------------------------------


module fir (
  clk, rst, input_rsc_dat, input_rsc_vld, input_rsc_rdy, coeffs_rsc_radr, coeffs_rsc_re,
      coeffs_rsc_q, coeffs_triosy_lz, coeff_addr_rsc_dat, coeff_addr_rsc_vld, coeff_addr_rsc_rdy,
      output_rsc_dat, output_rsc_vld, output_rsc_rdy
);
  input clk;
  input rst;
  input [7:0] input_rsc_dat;
  input input_rsc_vld;
  output input_rsc_rdy;
  output [7:0] coeffs_rsc_radr;
  output coeffs_rsc_re;
  input [7:0] coeffs_rsc_q;
  output coeffs_triosy_lz;
  input [4:0] coeff_addr_rsc_dat;
  input coeff_addr_rsc_vld;
  output coeff_addr_rsc_rdy;
  output [7:0] output_rsc_dat;
  output output_rsc_vld;
  input output_rsc_rdy;


  // Interconnect Declarations
  wire [7:0] coeffs_rsci_radr_d;
  wire [7:0] coeffs_rsci_q_d;
  wire coeffs_rsci_re_d_iff;


  // Interconnect Declarations for Component Instantiations 
  fir_ccs_sample_mem_ccs_ram_sync_1R1W_rport_2_8_8_256_256_8_5_gen coeffs_rsci (
      .q(coeffs_rsc_q),
      .re(coeffs_rsc_re),
      .radr(coeffs_rsc_radr),
      .radr_d(coeffs_rsci_radr_d),
      .re_d(coeffs_rsci_re_d_iff),
      .q_d(coeffs_rsci_q_d),
      .port_0_r_ram_ir_internal_RMASK_B_d(coeffs_rsci_re_d_iff)
    );
  fir_run fir_run_inst (
      .clk(clk),
      .rst(rst),
      .input_rsc_dat(input_rsc_dat),
      .input_rsc_vld(input_rsc_vld),
      .input_rsc_rdy(input_rsc_rdy),
      .coeffs_triosy_lz(coeffs_triosy_lz),
      .coeff_addr_rsc_dat(coeff_addr_rsc_dat),
      .coeff_addr_rsc_vld(coeff_addr_rsc_vld),
      .coeff_addr_rsc_rdy(coeff_addr_rsc_rdy),
      .output_rsc_dat(output_rsc_dat),
      .output_rsc_vld(output_rsc_vld),
      .output_rsc_rdy(output_rsc_rdy),
      .coeffs_rsci_radr_d(coeffs_rsci_radr_d),
      .coeffs_rsci_q_d(coeffs_rsci_q_d),
      .coeffs_rsci_re_d_pff(coeffs_rsci_re_d_iff)
    );
endmodule



