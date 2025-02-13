# Shortcuts
```bash
alias srt=`rospack find robotrainer_bringup`/scripts/robotrainer_on_login.bash
alias rt2_transport=`rospack find robotrainer_bringup`/scripts/robotrainer_transport.bash

# Applications
alias rt2_mapping="roslaunch robotrainer_bringup rt2_mapping.launch"
alias rt2_adaptive="roslaunch robotrainer_bringup rt2_adaptive.launch"
alias rt2_camera="roslaunch robotrainer_bringup rt2_camera_tracking.launch"
alias rt2_performance="roslaunch robotrainer_bringup rt2_user_performance.launch"
alias rt2_user_study_manager="roslaunch robotrainer_bringup rt2_user_study_manager.launch"

#Kinematics
alias kin_rt2_11='rosservice call /robotrainer_hw/set_state "{angular_key: 1, linear_key: 1}"'
alias kin_rt2_14='rosservice call /robotrainer_hw/set_state "{angular_key: 1, linear_key: 4}"'
alias kin_rt2_51='rosservice call /robotrainer_hw/set_state "{angular_key: 5, linear_key: 1}"'
alias kin_rt2_54='rosservice call /robotrainer_hw/set_state "{angular_key: 5, linear_key: 4}"'

# Recording for Eval with observers
alias eval_record_base_bg="bash `rospack find robotrainer_config`/scripts/record_bag_in_background.bash .RoboTrainer/study_record_base.status `rospack find robotrainer_config`/scripts/record_base_values.bash ~/RT2_Data/RoSy_Eval/"

alias eval_record_cam_bg="bash `rospack find robotrainer_config`/scripts/record_bag_in_background.bash .RoboTrainer/study_record_cam.status `rospack find robotrainer_config`/scripts/record_camera_values.bash ~/RT2_Data/RoSy_Eval/Cams"

alias rt2_call_start_services="rosservice call /rt2_sca_sync_node/send_sync_signal_1s \"{}\" & rosservice call /robotrainer_deviation/reset \"{}\""

# za_experimental
alias ws="cd /home/robotrainer/workspace/ros_ws_melodic_robotrainer/"
alias rt2_init="rosservice call /base/driver/init"
alias rt2_recover="rosservice call /base/driver/recover"
alias rt2_git_change_user="source `rospack find za_experimental`/scripts/git_change_user.bash"
alias rt2_git_fetch_all=". `rospack find za_experimental`/scripts/git_fetch_all.bash"
alias rt2_battery="`rospack find za_experimental`/scripts/get_battery_charge.bash"

```