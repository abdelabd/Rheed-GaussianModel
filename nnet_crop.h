#ifndef CROP_LAYER_H_
#define CROP_LAYER_H_

#include "ap_fixed.h"
#include "nnet_common.h"
#include "hls_stream.h"
#include <cmath>
#include <cstdlib>
#include <iostream>
#include <fstream>
#include <string>

namespace nnet {

template<typename T>
void log_variable(const std::string& name, const T& value) {
    std::ofstream outfile("variables.txt", std::ios::app); // Open file in append mode
    if (outfile.is_open()) {
        outfile << name << " = " << value << std::endl;
        outfile.close();
    } else {
        // Handle error: unable to open file
    }
}


struct crop_config {
    // IO size
    static const unsigned in_height = 48;
    static const unsigned in_width = 128;
    static const unsigned n_chan = 1;
    static const unsigned n_crop_boxes = 5;
    static const unsigned crop_rows = 20;
    static const unsigned crop_cols = 20;
};

// Let's do everything in rolled-up form for now
template <class data1_T, class index_T, class res_T, typename CONFIG_T>
void crop(
    hls::stream<data1_T> &image,      // [CONFIG_T::in_height*CONFIG_T::in_width*CONFIG_T::n_chan], 
    hls::stream<res_T> &cropped_images)      // TODO: See if you can unstream cropped_images, or wrapper function e.g. crop_box_filter(box_idx) 
    {


    index_T crop_coordinates_local[CONFIG_T::n_crop_boxes][4];
    crop_coordinates_local[0][0] = 0.38787913 * CONFIG_T::in_height;
    crop_coordinates_local[0][1] = 0.37316015 * CONFIG_T::in_width;
    crop_coordinates_local[0][2] = 0.86787915 * CONFIG_T::in_height;
    crop_coordinates_local[0][3] = 0.67316014 * CONFIG_T::in_width;
    // [[[0.38787913, 0.37316015, 0.86787915, 0.67316014]],
    //    [[0.12388999, 0.35435632, 0.60389   , 0.65435636]]]


    hls::stream<res_T> cropped_images_stream[CONFIG_T::n_crop_boxes];
    std::cout << "CONFIG_T::n_crop_boxes = " << CONFIG_T::n_crop_boxes << std::endl;
    // set buffer sizes
    for (unsigned box_idx = 0; box_idx < CONFIG_T::n_crop_boxes; box_idx++) {
        // #pragma set_directive_stream -depth CONFIG_T::crop_rows*CONFIG_T::crop_cols*CONFIG_T::n_chan -type fifo crop/cropped_images_stream[box_idx];
        #pragma HLS STREAM variable=cropped_images_stream[box_idx] depth=CONFIG_T::crop_rows*CONFIG_T::crop_cols*CONFIG_T::n_chan
    }


    row_loop:
    for (index_T src_row = 0; src_row < CONFIG_T::in_height; src_row++) {
        col_loop:
        for (index_T src_col=0; src_col < CONFIG_T::in_width; src_col++ ){
            chan_loop:
            for (index_T src_chan = 0; src_chan < CONFIG_T::n_chan; src_chan++) {
                res_T in_data = image.read(); //TODO: res_T and input1_T must be the same type, change to image_T

                crop_box_loop:
                for (unsigned box_idx = 0; box_idx < CONFIG_T::n_crop_boxes; box_idx++) {
                    #pragma HLS UNROLL

                    index_T y1 = crop_coordinates_local[box_idx][0];
                    index_T x1 = crop_coordinates_local[box_idx][1];
                    index_T y2 = crop_coordinates_local[box_idx][2];
                    index_T x2 = crop_coordinates_local[box_idx][3];

                    if((src_row >= y1) && (src_row < y2) && (src_col >= x1) && (src_col < x2)){
                        cropped_images_stream[box_idx].write(in_data);

                    }

                }
            }
        }
    }

    for(unsigned box_idx = 0; box_idx < CONFIG_T::n_crop_boxes; box_idx++) {
        for (unsigned i = 0; i < CONFIG_T::crop_rows*CONFIG_T::crop_cols*CONFIG_T::n_chan; i++) {
            cropped_images.write(cropped_images_stream[box_idx].read());
        }
    }




    

    }



} // namespace nnet

#endif