# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./myproject.sv"
vlog "./crop_array_ap_uint_14_array_ap_fixed_16_2_5_3_0_1u_config2_s.v"
vlog "./conv_2d_cl_array_ap_fixed_1u_array_ap_fixed_16_2_5_3_0_6u_config3_s.v"
vlog "./relu_array_ap_fixed_6u_array_ap_fixed_16_2_5_3_0_6u_ReLU_config5_s.v"
vlog "./fifo_w16_d1_A.v"
vlog "./fifo_w16_d121_A.v"
vlog "./fifo_w16_d1936_A.v"
vlog "./fifo_w16_d2304_A_x.v"
vlog "./fifo_w16_d2304_A.v"
vlog "./compute_output_buffer_2d_array_array_ap_fixed_16_2_5_3_0_6u_config3_s.v"
vlog "./dense_resource_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_config3_mult_s.v"
vlog "./dense_resource_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_config3_mult_s_w3_V.v"
vlog "./myproject_mul_mul_16s_16s_30_1_1.v"
vlog "./myproject_mul_mul_16s_13s_29_1_1.v"
vlog "./shift_line_buffer_array_ap_fixed_16_2_5_3_0_1u_config3_s.v"
vlog "./shift_line_buffer_array_ap_fixed_16_2_5_3_0_1u_config3_s_line_buffer_Array_V_bkb.v"
vlog "./pooling2d_cl_array_ap_fixed_6u_array_ap_fixed_16_2_5_3_0_6u_config6_s.v"
vlog "./pooling2d_cl_array_ap_fixed_6u_array_ap_fixed_16_2_5_3_0_6u_config6_s_line_bufYi.v"
vlog "./myproject_mux_164_16_1_1.v"
vlog "./dense_array_ap_fixed_6u_array_ap_fixed_16_2_5_3_0_98u_config8_s.v"
vlog "./dense_array_ap_fixed_98u_array_ap_fixed_16_2_5_3_0_5u_config10_s.v"
vlog "./dense_wrapper_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_config8_s.v"
vlog "./dense_wrapper_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_config8_s_w8_V.v"
vlog "./myproject_mux_646_16_1_1.v"
vlog "./myproject_mul_mul_16s_12s_28_1_1.v"
vlog "./relu_array_ap_fixed_98u_array_ap_fixed_16_2_5_3_0_98u_relu_config9_s.v"
vlog "./start_for_conv_2d_cl_array_ap_fixed_1u_array_ap_fixed_16_2_5_3_0_6u_config3_U0.v"
vlog "./start_for_relu_array_ap_fixed_6u_array_ap_fixed_16_2_5_3_0_6u_ReLU_config5_U0.v"
vlog "./start_for_pooling2d_cl_array_ap_fixed_6u_array_ap_fixed_16_2_5_3_0_6u_config6yd2.v"
vlog "./start_for_dense_array_ap_fixed_6u_array_ap_fixed_16_2_5_3_0_98u_config8_U0.v"
vlog "./start_for_relu_array_ap_fixed_98u_array_ap_fixed_16_2_5_3_0_98u_relu_config9_U0.v"
vlog "./start_for_dense_array_ap_fixed_98u_array_ap_fixed_16_2_5_3_0_5u_config10_U0.v"
vlog "./start_for_softmax_array_array_ap_fixed_16_2_5_3_0_5u_softmax_config11_U0.v"
vlog "./dense_wrapper_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_config10_s.v"
vlog "./dense_wrapper_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_config10_s_w10_V.v"
vlog "./myproject_mux_1287_16_1_1.v"
vlog "./softmax_array_array_ap_fixed_16_2_5_3_0_5u_softmax_config11_s.v"
vlog "./softmax_stable_array_array_ap_fixed_16_2_5_3_0_5u_softmax_config11_s.v"
vlog "./softmax_stable_array_array_ap_fixed_16_2_5_3_0_5u_softmax_config11_s_invert_txdS.v"
vlog "./softmax_stable_array_array_ap_fixed_16_2_5_3_0_5u_softmax_config11_s_exp_table3.v"




# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work myproject_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do myproject_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
