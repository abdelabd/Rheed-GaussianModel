onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /myproject_testbench/ap_clk
add wave -noupdate /myproject_testbench/ap_start
add wave -noupdate /myproject_testbench/ap_rst_n
add wave -noupdate /myproject_testbench/ap_ready
add wave -noupdate /myproject_testbench/ap_idle
add wave -noupdate /myproject_testbench/ap_done
add wave -noupdate /myproject_testbench/input_read_file
add wave -noupdate /myproject_testbench/crop_layer_input_V_data_0_V_TVALID
add wave -noupdate /myproject_testbench/crop_layer_input_V_data_0_V_TREADY
add wave -noupdate /myproject_testbench/layer11_out_V_data_4_V_TVALID
add wave -noupdate /myproject_testbench/layer11_out_V_data_4_V_TREADY
add wave -noupdate /myproject_testbench/layer11_out_V_data_4_V_TDATA
add wave -noupdate /myproject_testbench/layer11_out_V_data_3_V_TVALID
add wave -noupdate /myproject_testbench/layer11_out_V_data_3_V_TREADY
add wave -noupdate /myproject_testbench/layer11_out_V_data_3_V_TDATA
add wave -noupdate /myproject_testbench/layer11_out_V_data_2_V_TVALID
add wave -noupdate /myproject_testbench/layer11_out_V_data_2_V_TREADY
add wave -noupdate /myproject_testbench/layer11_out_V_data_2_V_TDATA
add wave -noupdate /myproject_testbench/layer11_out_V_data_1_V_TVALID
add wave -noupdate /myproject_testbench/layer11_out_V_data_1_V_TREADY
add wave -noupdate /myproject_testbench/layer11_out_V_data_1_V_TDATA
add wave -noupdate /myproject_testbench/layer11_out_V_data_0_V_TVALID
add wave -noupdate /myproject_testbench/layer11_out_V_data_0_V_TREADY
add wave -noupdate /myproject_testbench/layer11_out_V_data_0_V_TDATA
add wave -noupdate /myproject_testbench/crop_layer_input_V_data_0_V_TDATA
add wave -noupdate /myproject_testbench/cropped_images_file
add wave -noupdate /myproject_testbench/image_file
add wave -noupdate /myproject_testbench/img_idx
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {31996073 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 149
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 50
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {95400997 ps} {100284159 ps}
