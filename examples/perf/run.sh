#perf test for nvme userspace driver
sudo ./perf -q 32 -s 4096 -w read -M 100 -t 10
