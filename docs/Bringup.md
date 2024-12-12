## General useful commands
```bash
# switch to full sudo user
su student-admin

# stop or restart service
sudo systemctl stop robotrainer.service

# shutdown all ROS nodes
rosnode kill -a

# Start SR2 dashboard
roslaunch sr2_dashboard sr2_dashboard_new.launch
# ERROR: no param .yaml file found
#roslaunch sr2_dashboard sr2_dashboard_robotrainer_editor.launch
# OR load params and start from rqt plugin
rosparam load /home/robotrainer/workspace/ros_ws_melodic_robotrainer/src/sr2_dashboard/resources/config/neue_yaml.yaml
# rqt Diagnostic Viewer Plugin
rqt
```

## Controller inputs:
- `START+RB` for initializing controls `rosservice call /base/driver/init`
- `RB`dead-man-switch
- `D`or `X`mode is DirectInput or XInput. XInput is newer protocol and should always be used
- `Mode` switches left DPad with left controller

## Launch files
```bash
# Rviz Control Actions editor
roslaunch robotrainer_panel robotrainer.launch

# Rqt SR2 dashboard
roslaunch sr2_dashboard sr2_dashboard_new.launch
```