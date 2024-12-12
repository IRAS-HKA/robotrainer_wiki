## old scipy version in gait_estimator
```bash
AttributeError: 'module' object has no attribute 'find_peaks'
```
previous version on robotrainer: scipy 0.19.1

#### Solution:
install scipy version 1.1.0 which has find_peaks function
```bash
pip install scipy==1.1.0
```