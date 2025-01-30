
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
6. Nur EINMAL nach controller starten notwendig


## Troubleshooting

### Video
- area_counterforce
	- ERROR: es wird immer invert_rotation von davor geladen
		- evtl wird invert_rotation nicht richtig zurückgesetzt?
	- WORKS wenn controller neu gestartet wurden
		- rqt_reconfigure settings
			- Area_counterforce
				- counterforce_area_scaledown_dist: no idea
				- area_counterforce_x: max
				- area_counterforce_y: max
				- area_counterforce_torque_rot: max
	- recorded
		- no reaction
		- with reaction
- area_doublespeed
	- ERROR: es wird immer invert_rotation von davor geladen
		- evtl wird invert_rotation nicht richtig zurückgesetzt?
	- recorded
		- no reaction
		- with reaction
- area_rotation
	- WORKS
	- recorded
		- no reaction
		- with reaction
- force
	- WORKS
	- recorded
		- no reaction
		- with reaction
- section_tracking
	- ERROR funktioniert nicht
		- evtl muss robotrainer_deviation dabei laufen
		- `roslaunch robotrainer_deviation robotrainer_deviation.launch`
- wall
	- ERROR komische fehler mit position der Wände
		- Evtl werden die daten falsch geladen
	- WORKS wenn controller neu geladen
	- recorded

### Why is the area modality not working?
- there are different spatial_control_action_types
	- none (0)
	- modalities (1)
	- modalities_controllers (2)
- Areas are only available with the modalities (1) selection
- [ ] Warum waren die anderen Modalities auskommentiert für die RoSy study? Es muss doch einen Grund gehabt haben
- [ ] Was ist der unterschied zwischen den spatial_control_action_types: modalities (1) und modalities_controller(2)? Werden gesetzt über rqt_reconfigure.
- Here is the respective code for that:
```cpp
// robotrainer_control/robotrainer_controllers/src/fts_base_controller.cpp

switch (modalities_used_) {
        case base_modalities:

            msg_before_modality.linear.x=base_vel[0];
            msg_before_modality.linear.y=base_vel[1];
            msg_before_modality.linear.z= 0.0;
            msg_before_modality.angular.x= 0.0;
            msg_before_modality.angular.y= 0.0;
            msg_before_modality.angular.z=base_vel[2];

            force_modality_ptr_->update(msg_before_modality, after_force_mod);
            // TODO(denis): Commented output for the RoSy-Study in Oct. 2020
            // (Andreas): Commented in again on Jan 2025
            walls_modality_ptr_->update(after_force_mod, after_walls_mod);
            pathtracking_modality_ptr_->update(after_walls_mod, after_pathtrack_mod);
            area_modality_ptr_->update(after_pathtrack_mod, after_area_mod);

            vel_after_modalities[0] = after_area_mod.linear.x;
            vel_after_modalities[1] = after_area_mod.linear.y;
            vel_after_modalities[2] = after_area_mod.angular.z;
            break;

        case controller_modalities:
            msg_before_modality.linear.x=base_vel[0];
            msg_before_modality.linear.y=base_vel[1];
            msg_before_modality.linear.z= 0.0;
            msg_before_modality.angular.x= 0.0;
            msg_before_modality.angular.y= 0.0;
            msg_before_modality.angular.z=base_vel[2];

            robotrainer_helper_types::wrench_twist input_msg_before_modality;
            robotrainer_helper_types::wrench_twist output_msg_after_modality;

            input_msg_before_modality.twist_ = msg_before_modality;
            input_msg_before_modality.wrench_.force.x = force_input[0];
            input_msg_before_modality.wrench_.force.y = force_input[1];
            input_msg_before_modality.wrench_.force.z = 0.0;
            input_msg_before_modality.wrench_.torque.x = 0.0;
            input_msg_before_modality.wrench_.torque.y = 0.0;
            input_msg_before_modality.wrench_.torque.z = force_input[2];

            force_controller_modality_ptr_->update(input_msg_before_modality, output_msg_after_modality);
            // TODO(denis): Commented output for the RoSy-Study in Oct. 2020
            // (Andreas): Commented in again on Jan 2025
            walls_controller_modality_ptr_->update(output_msg_after_modality, output_msg_after_modality);
            pathtracking_controller_modality_ptr_->update(output_msg_after_modality, output_msg_after_modality);

            vel_after_modalities[0] = output_msg_after_modality.twist_.linear.x;
            vel_after_modalities[1] = output_msg_after_modality.twist_.linear.y;
            vel_after_modalities[2] = output_msg_after_modality.twist_.angular.z;
            break;
    }
```

```cpp
// robotrainer_control/robotrainer_controllers/src/fts_base_controller.cpp

ROS_INFO("[FTS_Base_Ctrlr]: Applying Control actions as set in dynamic reconfigure!");

        // TODO(denis): Enalbed modalities to be on also if not configured
        //              modalities configuraiton should than also stop controller
        int modality_type = config.spatial_control_action_type;
        if (modality_type == 1) {
            if (modalities_configured_) {
                modalities_used_ = base_modalities;
                begin_scaledown_at_this_dist_ = config.counterforce_area_scaledown_dist;
                areaCounterForce_[0] = config.area_counter_force_x;
                areaCounterForce_[1] = config.area_counter_force_y;
                areaCounterForce_[2] = config.area_counter_torque_rot;
            } else {
                ROS_ERROR("Request to use base_modalities although none have been configured yet. Please send a configuration first!");
                modalities_used_ = none;
        }
        } else if (modality_type == 2) {
            if (modalities_configured_) {
                modalities_used_ = controller_modalities;
            } else {
                ROS_ERROR("Request to use controller_modalities although none have been configured yet. Please send a configuration first!");
                modalities_used_ = none;
            }
        } else {
            modalities_used_ = none;
        }
```