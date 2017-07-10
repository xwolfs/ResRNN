# ResRNN
Implementation of a two path ResRNN architecture (Circle-RNN was invented).

### This repository is an implementation of our IPMI 2017 paper:
Xue W., Nachum I.B., Pandey S., Warrington J., Leung S., Li S. (2017) Direct Estimation of Regional Wall Thicknesses via Residual Recurrent Neural Network. In: Information Processing in Medical Imaging. IPMI 2017. Lecture Notes in Computer Science, vol 10265. Springer.

https://link.springer.com/chapter/10.1007/978-3-319-59050-9_40 or https://arxiv.org/pdf/1705.09728.pdf

Two RNN modules are deployed for temporal dynamic modeling and spatial context modeling.

![Temporal RNN](https://github.com/xwolfs/ResRNN/blob/master/TRNN.pdf)

![Spatial RNN](https://github.com/xwolfs/ResRNN/blob/master/SRNN.pdf)

### ON implementation of Circle-RNN

To implement Circle-RNN,the following modifications to the caffe toolbox are required:
1. add 'circle_lstm_layer.hpp' to '/caffe/include/caffe/layers', add 'circle_lstm_layer.cpp' to '/caffe/src/caffe/layers';
2. In 'caffe.proto', add the following line to 'message RecurrentParameter'
    'optional uint32 depth = 6 [default = 0];'
Note: LSTM units is employed in Circle-RNN.

#### Example of Circle-RNN 
'''
layer {
  name: "lstm1"
  type: "CircleLSTM"
  bottom: "ip1_permute"
  bottom: "clip_permute"
  top: "wt_lstm1"
  recurrent_param {
    num_output: 6
    weight_filler {
      type: "uniform"
      min: -0.05
      max: 0.05
    }
    bias_filler {
      type: "constant"
      value: 0
    }
    depth: 0
  }
}
'''
The parameters *depth* indicates how many rounds the RNN network is unrolled. 
* *depth=0* : the number of rounds equals the number of time steps of the sequences.
* *depth=1* : the RNN network is unrolled once. This is equivalent to the original RNN in caffe with LSTM unit;

