source env.sh
export MAX_PUBLISHERS=1
export MAX_SUBSCRIBERS=1
export MSG_TYPES="10b 100b 250b 1kb 10kb 100kb 250kb 1mb 4mb 8mb"
export PUBLISH_FREQUENCY=1
export DURATION=10
export NUM_EXPERIMENTS=5
bash scripts/pub_sub_ros2.sh
# python3 scripts/plot_scripts/cpu_ram_plot.py results/only_subs_ros2/cpu_ram* --x subs --y rss --y2 vsz