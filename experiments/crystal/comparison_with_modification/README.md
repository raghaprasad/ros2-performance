# Preliminary Results 

## Overview
I modified the iRobot Perf test to utilize some of the newer options available to use in ROS2 (IntraProcessCommSettings etc). 

I ran 2 benchmarks one for comparing memory usage and another to check pub_sub (reliability , latency etc). 

## Summary 
- Memory Experiment (static -- no message passing)
    - No significant improvement in rss / vsz
    - No significant improvement in CPU 
- Pub/Sub experiment (1 publisher sending messages to 1 subscriber): 
    - **Order of magnitude** improvement in Latency 
    - **99%** reliability_tot 
    - **Significant** improvement in physical memory
    - **Slight** improvement to virtual memory
    - **Significant** improvement to CPU 

## Commands
**Memory Experiment:**
```
source env.sh
export MAX_PUBLISHERS=1
export MAX_SUBSCRIBERS=1
export MSG_TYPES="10b 100b 250b 1kb 10kb 250kb 1mb 4mb 8mb"
export DURATION=10
export NUM_EXPERIMENTS=5
bash scripts/only_subs.sh
```
**PubSub Experiment**
```
source env.sh
export MAX_PUBLISHERS=1
export MAX_SUBSCRIBERS=1
export MSG_TYPES="10b 100b 250b 1kb 10kb 100kb 250kb 1mb 4mb 8mb"
export PUBLISH_FREQUENCY=1
export DURATION=10
export NUM_EXPERIMENTS=5
bash scripts/pub_sub_ros2.sh
```

## Results 
### Memory Experiment

|Result Type| Modified | Original |
|-----------|-----------|-----------|
| CPU |![plot](only_subs/modified_cpu.png)|![plot](only_subs/original_cpu.png)|
| rss |![plot](only_subs/modified_rss.png)|![plot](only_subs/original_rss.png)|
| vsz |![plot](only_subs/modified_vsz.png)|![plot](only_subs/original_vsz.png)|

### PubSub Experiment
|Result Type| Modified | Original |
|-----------|-----------|-----------|
| latency |![plot](pub_sub/modified_latency.png)|![plot](pub_sub/original_latency.png)|
| reliability_tot |![plot](pub_sub/modified_reliable_tot.png)|![plot](pub_sub/original_reliable_tot.png)|
| rss | ![plot](pub_sub/modified_rss.png)|![plot](pub_sub/original_rss.png)|
| vsz | ![plot](pub_sub/modified_vsz.png)|![plot](pub_sub/original_vsz.png)| 
| cpu | ![plot](pub_sub/modified_cpu.png)|![plot](pub_sub/original_cpu.png)| 