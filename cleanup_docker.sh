#!/bin/bash

# Stop all running containers
docker stop $(docker ps -aq)

# Delete all containers along with their volumes
docker rm -vf $(docker ps -aq)

# Delete all images
docker rmi -f $(docker images -aq)

# 
sudo docker system prune --all --force --volumes

echo "All Docker containers, volumes, and images have been deleted."

# docker restart $(docker ps -q)

# # Remove containers based on status:

# docker rm -v $(docker ps --filter status=exited -q)
## Note:

# The "-v" option that will delete any volumes associated with the containers.
# To clean out all containers on my development machine:

# docker rm -v -f $(docker ps -qa)
# Note:

# The "-f" option will force the removal of a running container
