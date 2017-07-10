# ResRNN
Implementation of a two path ResRNN architecture (Circle-RNN was invented).

### This repository is an implementation of our IPMI 2017 paper:
Xue W., Nachum I.B., Pandey S., Warrington J., Leung S., Li S. (2017) Direct Estimation of Regional Wall Thicknesses via Residual Recurrent Neural Network. In: Information Processing in Medical Imaging. IPMI 2017. Lecture Notes in Computer Science, vol 10265. Springer.

https://link.springer.com/chapter/10.1007/978-3-319-59050-9_40 or https://arxiv.org/pdf/1705.09728.pdf

### ON Circle-RNN

In caffe.proto, add the following line to message RecurrentParameter {}

optional uint32 depth = 6 [default = 0];
