# Quickstart
```bash
# Autostart
# ROS-Master + State_publisher + Laserscanner + Diagnostics + FTS.launch + Teleop

# LED + phidgets + battery
srt 

# RQT with node list service call and errors
roslaunch za_experimental rqt_overview.launch

# RVIZ with TF + Laser + Map + Model
roslaunch za_experimental rviz.launch
# roslaunch za_experimental rviz.launch standalone:=true

# Controller + AMCL + Map_server + Driver
# entspricht rt2_adaptive
roslaunch za_experimental rt2.launch

# Init drivers
rt2_init

# Recover drivers from emergency
rt2_recover

# Launch cameras
roslaunch robotrainer_bringup rt2_camera_tracking.launch