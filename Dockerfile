FROM ubuntu:16.04

USER root

# Create openstack user
RUN useradd -s /bin/bash -d /opt/stack -m stack

# Switch to stack user
USER stack
