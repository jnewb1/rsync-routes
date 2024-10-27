# rsync-routes

A tool to rsync routes from a comma three to your UnRAID server, or anything else running docker.


```bash
# Environment variable options
RSYNC_ROUTES="<ip_or_host_of_device1>,<ip_or_host_of_device2>"
DELAY="<delay in seconds for each run, 1 hour default>"
BWLIMIT="limit bandwidth for transfers, default unlimited"

# Volumes
/mnt/routes -> path to download routes to. Will be of the format: /mnt/routes/<dongle_id>/<route_name>/<file_name>
/root/.ssh -> mount ssh keys to use to login to the comma device. Need to have your Github username set in the comma device and the key be added to the Github authorized keys.
```