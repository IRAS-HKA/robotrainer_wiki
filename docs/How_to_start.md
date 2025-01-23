# How to start RoboTrainer

### One time configuration
1. Create ssh key pair with public and private key
   1. Generate ssh keypair [github instructions](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) 
      ```bash
      cd ~/.ssh
      ssh-keygen -t ed25519 -C "comment"
      eval "$(ssh-agent -s)"
      ssh-add ~/.ssh/<name>
      ```
2. Copy <ssh_key>.pub into `~/.ssh/authorized_keys` on RoboTrainer
3. Modify own `~/.ssh/config` file
   ```bash
    Host robotrainer_iras
        HostName 192.168.60.222
        User robotrainer
        ForwardX11 yes
        Compression yes
        IdentityFile ~/.ssh/<ssh_key_private>
    ```
4. Connect with `ssh robotrainer_iras`

### Connect to RoboTrainer
1. a) With Batteries
   - todo
2. b) With power supply
   1. Plug in power supply to socket
   2. Connect XT60 plugs with RoboTrainer
3. Turn right key to ON and hold for 2s
4. Connect to WiFi IRAS-RobotLab
   - PW: AllRobotsAreWelcome!
5. Open VSCode remote window and select robotrainer_iras
6. Open folder `/home/robotrainer/workspace/ros_ws_melodic_robotrainer/src`

### Launch Software

1. In Autostart:
   - ROS-Master + State_publisher + Laserscanner + Diagnostics + FTS.launch + Teleop

2. Basic drivers:
   - LED + phidgets + battery
   ```bash
   srt
   ``` 
3. (Optional) RQT with predefined layout:
   ```bash
   roslaunch za_experimental rqt_overview.launch
   ``` 
4. (Optional) RVIZ with predefined layout:
   ```bash
   roslaunch za_experimental rviz.launch
   roslaunch za_experimental rviz.launch standalone:=true
   ``` 
5. Adaptive Controller:
   - Controller + AMCL + Map_server + Driver
   - entspricht shortcut `rt2_adaptive`
   ```bash
   roslaunch za_experimental rt2.launch
   ``` 

6. Initialize drivers:
   ```bash
   rt2_init
   ```

### Drive with RoboTrainer
1. Unlock remote emergency stop
2. Confirm safety by turning right key to "ON"
3. Recover drivers from emergency:
   ```bash
   rt2_recover
   ```


## How to stop
1. shutdown onBoard pc
```bash
sudo shutdown
# pw robotrainer
```
2. Wait for pc light to turn off
3. Turn right key to OFF
4. Unplug power supply