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


## Mapping
```bash
srt
# Start mapping with continous rotation
roslaunch robotrainer_bringup rt2_mapping.launch
rt2_init

# For visualizing the mapping process
roslaunch za_experimental rviz.launch

# Save generated files to path:
cd ~/workspace/ros_ws_melodic_robotrainer/src/cob_environments/cob_default_env_config/iras
rosrun map_server map_saver -f map
```

## Transport 
- Put RoboTrainer in Hadrwareconfiguration
	- angular 1, linear 1 -> beides ganz nach innen
- Without srt
```bash
rt2_transport
rt2_init # Sollte eigentlich auch mit RB+Start funktionieren
```

## Get battery state

```bash
rostopic echo /power_state
```