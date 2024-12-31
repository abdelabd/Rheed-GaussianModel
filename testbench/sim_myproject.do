# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./myproject.sv"
vlog "./conv_2d_cl_array_ap_fixed_6u_array_ap_fixed_16_2_5_3_0_16u_config7_s.v"
vlog "./relu_array_ap_fixed_16u_array_ap_fixed_16_2_5_3_0_16u_ReLU_config9_s.v"
vlog "./compute_output_buffer_2d_array_array_ap_fixed_16_2_5_3_0_16u_config7_s.v"
vlog "./pooling2d_cl_array_array_ap_fixed_16_2_5_3_0_16u_config10_s.v"
vlog "./dense_array_ap_fixed_16u_array_ap_fixed_16_2_5_3_0_98u_config12_s.v"
vlog "./relu_array_ap_fixed_98u_array_ap_fixed_16_2_5_3_0_98u_relu_config13_s.v"
vlog "./dense_array_ap_fixed_98u_array_ap_fixed_16_2_5_3_0_52u_config14_s.v"
vlog "./relu_array_ap_fixed_52u_array_ap_fixed_16_2_5_3_0_52u_relu_config15_s.v"
vlog "./dense_array_ap_fixed_52u_array_ap_fixed_16_2_5_3_0_5u_config16_s.v"
vlog "./dense_resource_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_config7_mult_s.v"
vlog "./shift_line_buffer_array_ap_fixed_16_2_5_3_0_6u_config7_s.v"
vlog "./pooling2d_cl_array_array_ap_fixed_16_2_5_3_0_16u_config10_s_line_buffer_ArrayVhK.v"
vlog "./dense_resource_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_config7_mult_s_w7_V.v"
vlog "./myproject_mux_325_16_1_1.v"
vlog "./myproject_mux_2568_16_1_1.v"
vlog "./shift_line_buffer_array_ap_fixed_16_2_5_3_0_6u_config7_s_line_buffer_Array_V_xdS.v"
vlog "./myproject_mux_42_16_1_1.v"
vlog "./dense_wrapper_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_config12_s.v"
vlog "./dense_wrapper_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_config14_s.v"
vlog "./dense_wrapper_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_config16_s.v"
vlog "./fifo_w16_d49_A.v"
vlog "./dense_wrapper_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_config12_s_w12_V.v"
vlog "./dense_wrapper_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_config14_s_w14_V.v"
vlog "./dense_wrapper_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_config16_s_w16_V.v"
vlog "./myproject_mul_mul_16s_14s_30_1_1.v"
vlog "./fifo_w16_d9_A.v"
vlog "./start_for_pooling2d_cl_array_ap_fixed_6u_array_ap_fixed_16_2_5_3_0_6u_config6bbk.v"
vlog "./start_for_conv_2d_cl_array_ap_fixed_6u_array_ap_fixed_16_2_5_3_0_16u_config7_U0.v"
vlog "./start_for_relu_array_ap_fixed_16u_array_ap_fixed_16_2_5_3_0_16u_ReLU_config9_U0.v"
vlog "./start_for_pooling2d_cl_array_array_ap_fixed_16_2_5_3_0_16u_config10_U0.v"
vlog "./start_for_dense_array_ap_fixed_16u_array_ap_fixed_16_2_5_3_0_98u_config12_U0.v"
vlog "./start_for_relu_array_ap_fixed_98u_array_ap_fixed_16_2_5_3_0_98u_relu_config13bck.v"
vlog "./start_for_dense_array_ap_fixed_98u_array_ap_fixed_16_2_5_3_0_52u_config14_U0.v"
vlog "./start_for_relu_array_ap_fixed_52u_array_ap_fixed_16_2_5_3_0_52u_relu_config15bdk.v"
vlog "./start_for_dense_array_ap_fixed_52u_array_ap_fixed_16_2_5_3_0_5u_config16_U0.v"




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
