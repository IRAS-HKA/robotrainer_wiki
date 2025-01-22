
## Default Startup
```bash
srt
roslaunch za_experimental rt2.launch
rt2_init
```

## Mapping
```bash
roslaunch robotrainer_bringup rt2_mapping.launch

# Save generated files to path:
cd ~/workspace/ros_ws_melodic_robotrainer/src/cob_environments/cob_default_env_config/iras
rosrun map_server map_saver -f map
```

## How to start controller parameterization
```bash
roslaunch za_experimental rqt_reconfigure.launch
```
- click: activate_force_parameterization
	follow instructions in console
	1. forward
	2. left
	3. right
	4. turn left
	5. turn right


## How to start Spatial Control Actions (SCA) or Modalities
```bash
# Start panel and data_srv
roslaunch robotrainer_panel robotrainer.launch
```
- Go to "Data Service" Tab and click "Load to Active"
	- path: /robotrainer_control/robotrainer_data_service/yamls/test.yaml
	- or path: /robotrainer_control/robotrainer_parameters/yamls/XX.yaml
```bash
# Start rqt reconfigure
roslaunch za_experimental rqt_reconfigure.launch
```
- In "FTSBaseController/RobotrainerControlActions"
- **Be sure that RoboTrainer is not standing inside a control area, otherwise it will start moving**
- tick apply_control_actions