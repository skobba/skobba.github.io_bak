# Network
Ref.: [https://www.youtube.com/watch?v=zx5LFqyMPMU](https://www.youtube.com/watch?v=zx5LFqyMPMU)

## VLAN
* __Network Isolation:__ VLANs enable the segmentation of a physical network into multiple logical networks. This segmentation is useful for isolating traffic, controlling broadcast domains, and enhancing security.
* __Tagging:__ VLANs are identified by a VLAN ID, which is a numerical value (1-4095) assigned to each VLAN. When a virtual machine or container sends network traffic, the VLAN ID is included as a tag in the Ethernet frame. Proxmox uses VLAN tagging to distinguish between different VLANs on the same physical network.

## Bond
For link aggregation or failover.

## Bridge
