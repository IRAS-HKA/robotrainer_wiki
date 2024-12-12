- Controller can be changed in the launch file `za_experimental/launch/rt2.launch`
- If output is `[FTS_BASE_CTRLR] SIMULATION MODE, NO OUTPUT TO ROBOT, BUT SENDING VELOCITIES TO DEBUG TOPIC!` the controller .yaml file has to include the parameter: 
	```yaml
	no_hw_output: False
	```
- only fts_adaptive_force_controller is the most up to date version. **All other are outdated**. It integrateds other functionalities like passive behavior.

1. [Default] **fts_adaptive_force_controller**
	- Feels more reponsive. Adapts strength of wheel movement not linear but depending on my input force. Higher force, very fast wheel movement
	- Just fingertip: yes
	- hold steady: escalates
	- strong input: adaptive
	```xml
	<arg name="robotrainer_controller" default="fts_adaptive_force_controller"/>
	<arg name="robotrainer_controller_yaml" default="rt2_adaptive_force_controller.yaml"/>
	```

2. **integral_compare_controller**
	- Feels like linear transmission of input force to wheel movement. 
	- Just fingertip: Yes
	- hold steady: escalates
	- strong input: linear
	```xml
	<arg name="robotrainer_controller" default="integral_compare_controller"/>
	<arg name="robotrainer_controller_yaml" default="robotrainer_integral_compare.yaml"/>
	```
	
3. **fts_controller**
	- Feels same like integral_compare_controller. 
	- Just fingertip: Yes
	- hold steady: escalates
	- strong input: linear
	```xml
	<arg name="robotrainer_controller" default="fts_controller"/>
	<arg name="robotrainer_controller_yaml" default="rt2_base_controller.yaml"/>
	```

4. **robotrainer_passive_controller**
	- Feels similar to fts_adaptive_force_controller
	- Just fingertip: Yes
	- hold steady: escalates
	- strong input: adaptive
	```xml
	<arg name="robotrainer_controller" default="fts_adaptive_force_controller"/>
	<arg name="robotrainer_controller_yaml" default="robotrainer_passive_controller.yaml"/>
	```

5. [Testing] **rt2_adaptive_force_controller_za_experimental**
	- Change parameters from base: fts_adaptive_force_controller
		```yaml
		use_passive_behavior_ctrlr: True
		```
	- Just fingertip: Yes
	- hold steady: stable with cooldown in specific dimensions
	- strong input: adaptive
	```xml
	<arg name="robotrainer_controller" default="fts_adaptive_force_controller"/>
	<arg name="robotrainer_controller_yaml" default="rt2_adaptive_force_controller_za_experimental.yaml"/>
	```