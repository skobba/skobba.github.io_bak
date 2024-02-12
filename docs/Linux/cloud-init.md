# cloud-init (Alpine)
Ref.: [https://git.alpinelinux.org/aports/tree/community/cloud-init/README.Alpine](https://git.alpinelinux.org/aports/tree/community/cloud-init/README.Alpine)

Creating an Alpine Linux cloud image from scratch involves several steps, including installing Alpine Linux, customizing it according to your needs, and creating an image suitable for your cloud provider. General outline of the process:

## Process

### Install Alpine
Download the Alpine Linux ISO from the official website: https://alpinelinux.org/downloads. Install Alpine Linux on a virtual machine or physical system following the installation guide: https://wiki.alpinelinux.org/wiki/Installation

### Customize Alpine
Log in to the installed Alpine Linux system.
Install necessary packages and customize the system according to your requirements. This may include configuring the network, setting up users, installing additional software, and configuring services.
Ensure that cloud-init is installed and configured as desired if you plan to use it for cloud initialization tasks.

### Prepare for Image Creation
Clean up the system to remove temporary files and unnecessary data.
Optionally, configure automatic login if required for your use case.

### Create a Disk Image
Use a tool like dd or qemu-img to create a disk image of the installed system. For example, to create a disk image using dd:

```
sudo dd if=/dev/sda of=/path/to/image/alpine_image.img bs=4M
```

Replace /dev/sda with the device where Alpine Linux is installed, and /path/to/image/alpine_image.img with the desired path and filename for the disk image.

### Resize Disk Image
If necessary, you can resize the disk image to your desired size using tools like qemu-img:
```
qemu-img resize /path/to/image/alpine_image.img +10G
```

This command resizes the disk image to add an additional 10GB of space. Adjust the size according to your requirements.

### Convert Disk Image to Cloud Image Format
If you plan to use the disk image on a specific cloud provider, you may need to convert it to the appropriate format. Each cloud provider has its own image format and conversion tools.
For example, for OpenStack, you can use tools like qemu-img to convert the disk image to the qcow2 format:
```
qemu-img convert -f raw -O qcow2 /path/to/image/alpine_image.img /path/to/image/alpine_image.qcow2
```

### Upload Image to Cloud
Once the disk image is prepared and converted to the appropriate format, upload it to your cloud provider's image repository. The process for uploading images varies depending on the cloud provider.

### Testing
Before using the image in a production environment, it's essential to test it thoroughly to ensure that it works as expected. Create instances from the image and validate its functionality, including network connectivity, software installation, and any custom configurations.

### Documentation
Document the steps taken to create the cloud image, including any customizations made to the base Alpine Linux installation, as well as instructions for deploying and using the image in your environment.

By following these steps, you can create a custom Alpine Linux cloud image tailored to your requirements. Keep in mind that the specific details may vary depending on your use case, cloud provider, and desired configuration.

__Enable and start__
```
rc-update add cloud-init default
rc-service cloud-init start
```

__Config__
```
cat <<EOF >> /etc/cloud/cloud.cfg
# Set the datasource to be auto-discovered
datasource_list: [ None ]

# Specify users and groups to create
system_info:
  default_user:
    name: myuser
    lock_passwd: true
    gecos: My User
    groups: [wheel]
    sudo: ["ALL=(ALL) NOPASSWD:ALL"]

network:
  version: 2
  ethernets:
    eth0:
      addresses: [10.10.9.84/24]
      gateway4: 10.10.9.1
      nameservers:
        addresses: [1.1.1.1, 8.8.8.8]

# Set the hostname
hostname: myhostname

# Disable managing resolv.conf
manage_resolv_conf: false

# Disable setting hostname during boot
set_hostname: false
EOF
```

