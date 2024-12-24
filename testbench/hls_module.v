module hls_module(
    input wire ap_clk,
    input wire ap_rst_n,
    input wire ap_start,
    output reg ap_done,
    output reg ap_idle,
    output reg ap_ready,
    input wire [7:0] input_data,
    output reg [7:0] output_data
);

	// State definitions
	reg started;

	always @(posedge ap_clk or negedge ap_rst_n) begin
		 if (!ap_rst_n) begin
			  // Reset all signals and outputs
			  ap_done <= 0;
			  ap_idle <= 1;
			  ap_ready <= 1;
			  output_data <= 0;
			  started <= 0;
		 end else begin
			  if (ap_ready && ap_idle && ap_start) begin
					// Start the operation
					ap_idle <= 0;
					ap_ready <= 0;
					started <= 1;
			  end
			  
			  if (started) begin
					// Set output_data to input_data
					
					/////// MODULE LOGIC ///////////
					output_data <= input_data; // Extend input_data to match output width
					
					/////// END MODULE LOGIC ///////////
					
					ap_done <= 1;  // Indicate the operation is complete
					ap_idle <= 1;  // Go back to idle state
					ap_ready <= 1;

			  end else begin
					ap_done <= 0; // Clear the done signal once it's processed
			  end
		 end
	end

endmodule

`timescale 1ns / 1ps

module hls_module_testbench();

	// Parameters for the HLS module
	reg ap_clk;
	reg ap_rst_n;
	reg ap_start;
	wire ap_done;
	wire ap_idle;
	wire ap_ready;

	// Image data input to the HLS module
	reg [7:0] input_data;  // Assuming each pixel is 8 bits
	wire [7:0] output_data; // Adjust according to your HLS module output width

	// Instantiate the HLS module (Replace 'hls_module' with actual module name)
	hls_module dut (
		 .ap_clk(ap_clk),
		 .ap_rst_n(ap_rst_n),
		 .ap_start(ap_start),
		 .ap_done(ap_done),
		 .ap_idle(ap_idle),
		 .ap_ready(ap_ready),
		 .input_data(input_data),
		 .output_data(output_data)
	);

	// Clock generation
	initial begin
		 ap_clk = 0;
		 forever #5 ap_clk = ~ap_clk; // 100MHz clock
	end

	// Image data array
	reg [7:0] image_data [0:9]; // [0:9]; // Adjust size based on the number of pixels in the image
	integer i;

	// File handling
	integer output_file;

	initial begin
		 // Initialize signals
		 ap_rst_n = 0;
		 ap_start = 0;
		 input_data = 0;

		 // Apply reset
		 #20;
		 ap_rst_n = 1;

		 // Load image data from binary file
		 $readmemb("data/image_data.bin", image_data); // Load from binary file

		 // Open the file to save output data in binary
		 output_file = $fopen("data/output_data.bin", "wb");
		 if (output_file == 0) begin
			  $display("Error: Could not open file for writing.");
			  $stop;
		 end
		 else begin
			  $display("Could indeed open file for writing.");
		 end

		 // Start the HLS module
		 #10;
		 ap_start = 1;
		 #10;
		 ap_start = 0;

		 // Feed the image data sequentially
		 for (i = 0; i < 10; i = i + 1) begin
			  input_data = image_data[i];  // Load each pixel
			  
			  // Wait for computation to complete
			  wait (ap_done);
			  #10; // Give ModelSim some time before writing
			  $fwrite(output_file, "%b\n", output_data);

		 end
		
		 // Close the output file
		 $fclose(output_file);

		 // End simulation
		 #20;
		 $stop;
	end

endmodule
