# cloud-config
```
#cloud-config
# Add groups to the system
# The following example adds the 'admingroup' group with members 'root' and 'sys'
# and the empty group cloud-users.
groups:
  - admingroup: [root,sys]
  - cloud-users

# Add users to the system. Users are added after groups are added.
# Note: Most of these configuration options will not be honored if the user
#       already exists. Following options are the exceptions and they are
#       applicable on already-existing users:
#       - 'plain_text_passwd', 'hashed_passwd', 'lock_passwd', 'sudo',
#         'ssh_authorized_keys', 'ssh_redirect_user'.
users:
  - default
  - name: rep
    gecos: Rep
    primary_group: foobar
    groups: users
    selinux_user: staff_u
    lock_passwd: false
    passwd: $6$rounds=4096$ltOJ60RT3E0XR5i2$Y1C1BZvoWP1XBCUxkqCOuiMDBFZK0/NIEZdfMXz6doBgvJ073KawQNCuR06q/SAMM5dxA3gMvoisN9FfOhaFS1

network:
  version: 2
  ethernets:
    eth0:
      dhcp4: false
      addresses: [192.168.1.100/24]
      gateway4: 192.168.1.1
      nameservers:
        addresses: [8.8.8.8, 8.8.4.4]
# Valid Values:
#   name: The user's login name
#   expiredate: Date on which the user's account will be disabled.
#   gecos: The user name's real name, i.e. "Bob B. Smith"
#   homedir: Optional. Set to the local path you want to use. Defaults to
#           /home/<username>
#   primary_group: define the primary group. Defaults to a new group created
#           named after the user.
#   groups:  Optional. Additional groups to add the user to. Defaults to none
#   selinux_user:  Optional. The SELinux user for the user's login, such as
#           "staff_u". When this is omitted the system will select the default
#           SELinux user.
#   lock_passwd: Defaults to true. Lock the password to disable password login
#   inactive: Number of days after password expires until account is disabled
#   passwd: The hash -- not the password itself -- of the password you want
#           to use for this user. You can generate a hash via:
#               mkpasswd --method=SHA-512 --rounds=4096
#           (the above command would create from stdin an SHA-512 password hash
#           with 4096 salt rounds)
#
#           Please note: while the use of a hashed password is better than
#               plain text, the use of this feature is not ideal. Also,
#               using a high number of salting rounds will help, but it should
#               not be relied upon.
#
#               To highlight this risk, running John the Ripper against the
#               example hash above, with a readily available wordlist, revealed
#               the true password in 12 seconds on a i7-2620QM.
#
#               In other words, this feature is a potential security risk and is
#               provided for your convenience only. If you do not fully trust the
#               medium over which your cloud-config will be transmitted, then you
#               should not use this feature.
#
#   no_create_home: When set to true, do not create home directory.
#   no_user_group: When set to true, do not create a group named after the user.
#   no_log_init: When set to true, do not initialize lastlog and faillog database.
#   ssh_import_id: Optional. Import SSH ids
#   ssh_authorized_keys: Optional. [list] Add keys to user's authorized keys file
#                        An error will be raised if no_create_home or system is
#                        also set.
#   ssh_redirect_user: Optional. [bool] Set true to block ssh logins for cloud
#       ssh public keys and emit a message redirecting logins to
#       use <default_username> instead. This option only disables cloud
#       provided public-keys. An error will be raised if ssh_authorized_keys
#       or ssh_import_id is provided for the same user.
#
#   sudo: Defaults to none. Accepts a sudo rule string, a list of sudo rule
#         strings or False to explicitly deny sudo usage. Examples:
#
#         Allow a user unrestricted sudo access.
#             sudo:  ALL=(ALL) NOPASSWD:ALL
#
#         Adding multiple sudo rule strings.
#             sudo:
#               - ALL=(ALL) NOPASSWD:/bin/mysql
#               - ALL=(ALL) ALL
#
#         Prevent sudo access for a user.
#             sudo: False
#
#         Note: Please double check your syntax and make sure it is valid.
#               cloud-init does not parse/check the syntax of the sudo
#               directive.
#   system: Create the user as a system user. This means no home directory.
#   snapuser: Create a Snappy (Ubuntu-Core) user via the snap create-user
#             command available on Ubuntu systems.  If the user has an account
#             on the Ubuntu SSO, specifying the email will allow snap to
#             request a username and any public ssh keys and will import
#             these into the system with username specified by SSO account.
#             If 'username' is not set in SSO, then username will be the
#             shortname before the email domain.
#

# Default user creation:
#
# Unless you define users, you will get a 'ubuntu' user on Ubuntu systems with the
# legacy permission (no password sudo, locked user, etc). If however, you want
# to have the 'ubuntu' user in addition to other users, you need to instruct
# cloud-init that you also want the default user. To do this use the following
# syntax:
#   users:
#     - default
#     - bob
#     - ....
#  foobar: ...
#
# users[0] (the first user in users) overrides the user directive.
#
# The 'default' user above references the distro's config:
# system_info:
#   default_user:
#     name: Ubuntu
#     plain_text_passwd: 'ubuntu'
#     home: /home/ubuntu
#     shell: /bin/bash
#     lock_passwd: True
#     gecos: Ubuntu
#     groups: [adm, cdrom, dip, lxd, sudo]
```