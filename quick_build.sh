echo "------------------------------------------------"
echo "Configuring and building libORB_SLAM2_PointMap_SegNetM.so ..."

cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j2

cd ..

echo "------------------------------------------------"
echo "ROS: Configuring and building Executable TUM ..."

cd Examples/ROS/ORB_SLAM2_PointMap_SegNetM
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j2

cd ../../../../



