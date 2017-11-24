FROM ubuntu:16.04

USER root

# Create openstack user
RUN useradd -s /bin/bash -d /opt/stack -m stack

RUN echo 'stack ALL=(ALL) NOPASSWD: ALL' | tee /etc/sudoers.d/stack

# Switch to stack user
USER stack

RUN git clone https://git.openstack.org/openstack-dev/devstack

RUN echo '[[local|localrc]]\n\
    FIXED_RANGE=10.0.0.0/24\n\
    ADMIN_PASSWORD=secret\n\
    DATABASE_PASSWORD=$ADMIN_PASSWORD\n\
    RABBIT_PASSWORD=$ADMIN_PASSWORD\n\
    SERVICE_PASSWORD=$ADMIN_PASSWORD\n\
    SERVICE_TOKEN=whatatoken\n\
    ' >> /devstack/local.conf

RUN ./devstack/stack.sh
