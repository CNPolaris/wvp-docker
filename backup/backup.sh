#!/bin/bash

# 1.Install
# distro=$(awk -F= '/^ID(_LIKE)?=/{gsub("\"","");print $2}' /etc/os-release | head -n1)
# case $distro in
#     ubuntu|debian|linuxmint)
#         apt update
#         apt-get install restic
#         ;;
#     fedora|centos|rhel|rocky|almalinux)
#         yum install yum-plugin-copr
#         yum copr enable copart/restic
#         yum install restic
#         ;;
#     debian)
#         apt update
#         apt-get install restic
#         ;;
#     esac

# 2.Init backup repository
# restic -r sftp://user@ip:port//workspace/backup init

# 3.Sftp backup From server A copy to server B
# restic --repo sftp://user@ip:port//workspace/backup --password-file ./resticpassword backup /workspace/volumes/video

# 4.Check
# restic -r sftp://user@ip:port//workspace/backup --password-file ./resticpassword snapshots

# 5.Restore
# restic -r sftp://user@ip:port//workspace/backup --password-file ./resticpassword restore 875a2a32 --target ./

# 6.Crontab
# 0 2 * * * /workspace/backup/backup.sh