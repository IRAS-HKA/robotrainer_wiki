
## Default Startup
```bash
srt
roslaunch za_experimental rt2.launch
rt2_init
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
1. Go to "Data Service" Tab and click "Load to Active"
	- path: /robotrainer_control/robotrainer_data_service/yamls/iras_demo.yaml
	- or path: /robotrainer_control/robotrainer_parameters/yamls/XX.yaml
```bash
# Start rqt reconfigure
roslaunch za_experimental rqt_reconfigure.launch
```
1. In  "FTSBaseController/RobotrainerControlActions"
2. **Be sure that RoboTrainer is not standing inside a control area, otherwise it will start moving**
3. switch on tab "Spatial_control_actions"
4. select "spatial_control_action_type: modalities_controller (2)"
5. tick apply_control_actions