# Demo

<https://www.bilibili.com/video/av59793400?from=search&seid=12598277376962486068>

# Change Log

- support CUDA 10
- Find caffe (caffe-segnet) package in CMakeList
- Add docker image

# Build

## Environment
- Ubuntu 16.04 (Some problems in Ubuntu 18)
- ROS Kinetic
- Cuda 10.0
- Cudnn 7
- Caffe (SegNet)
- Eigen 3
- OpenCV 3
- [optional] docker: 19.03.12 

## Build and install *caffe-segnet-cudnn5*

```sh
git clone https://github.com/yubaoliu/caffe-segnet.git 
cd SegNet/caffe-segnet
mkdir build
cd build
cmake .. -CMAKE_INSTALL_PREFIX=/usr/local
make & make install
```

## Build DS-SLAM

```sh
git clone https://github.com/yubaoliu/DS-SLAM.git
```

# ROS~PACKAGEPATH

```sh
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$HOME/catkin_ws/src/DS-SLAM/Examples/ROS/ORB_SLAM2_PointMap_SegNetM
```

# Caffe Modle

segnet_pascal.caffemodel

```sh
http://mi.eng.cam.ac.uk/~agk34/resources/SegNet/segnet_pascal.caffemodel

or

gdlink 'https://drive.google.com/uc\?export\=download\&id\=1KzyEpaLovCyDKEj-LkAGTT6l-s3IRpSG' | xargs -n1 wget -c -O ./segnet_pascal.caffemodel

https://drive.google.com/file/d/1KzyEpaLovCyDKEj-LkAGTT6l-s3IRpSG/view?usp=sharing
```

Please download and place the folder in the same path with the folder of
prototxts and tools.

# Run

Customize dataset and associate path in launch file

```sh
roslaunch fr3_walk_half.launch
```

# Docker

```sh
docker-compose build
docker-compose up

```
# comment
## segment.cc
这段代码是DS-SLAM中的Segment类的实现，主要包含了语义分割的功能。具体实现步骤如下：

1.在构造函数中，初始化模型文件路径，颜色表路径以及图像分割相关的变量。

2.设置Tracker类指针，方便在图像分割完成后，通知Tracker进行后续操作。

3.定义isNewImgArrived()函数，用于判断是否有新的图像到达。

4.定义Run()函数，实现图像分割的主要逻辑，包括：

4.1 加载模型文件，并等待新的图像到达。

4.2 对新到达的图像进行分割，并将结果保存到mImgSegment中。

4.3 将分割结果进行颜色映射，并保存到mImgSegment_color_final中。

4.4 调用ProduceImgSegment()函数，将分割结果存储到mImgSegmentLatest中，并设置mpTracker的mbNewSegImgFlag标志位。

4.5 如果请求结束，则退出循环。

5.定义CheckFinish()函数和RequestFinish()函数，用于检查和请求结束。

总体来说，这段代码主要实现了图像分割的功能，并将分割结果存储到mImgSegmentLatest中，以供后续的跟踪和建图使用。

