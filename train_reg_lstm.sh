LOGDIR=./log
CAFFE=/opt/caffe_new/build/tools/caffe
SOLVER=./lstm_cardiac_solver.prototxt

GLOG_log_dir=$LOGDIR $CAFFE train -solver $SOLVER




