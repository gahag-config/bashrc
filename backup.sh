# function partbkp { # $1 : Partition ID (sdXY) ; $2 : Output file
#   sudo dd if="/dev/$1" conv=sync,noerror bs=64K "of=$2"
# }


function gahag-replica {
  # add --delete flag to delete extraneous files from the
  # receiving side (ones that aren’t on the sending side).
  rsync -av --delete --delete-excluded                                \
        --exclude='.git/'                                             \
        --exclude='.svn/'                                             \
        --exclude='.stack-work/'                                      \
        --exclude='.ccls-cache/'                                      \
        --exclude='target/'                                           \
        --exclude='bin/'                                              \
        --exclude='obj/'                                              \
        --exclude='gahag/media/cinematography'                        \
        --exclude='gahag/torrents'                                    \
        /gahag "/run/media/gahag/59296a1c-5568-49e2-bb7e-180383ae9432/" 2>&1       \
  | tee $(date '+%Y-%m-%dT%H.%M.%S-rsync.log')
}

function gahag-backup {
  tar -cvpzf "/run/media/gahag/Backup/backup.$(date '+%Y-%m-%d').tar.gz" \
      --exclude='*/.git'                                                 \
      --exclude='*/.svn'                                                 \
      --exclude='*/.stack-work'                                          \
      --exclude='*/.ccls-cache'                                          \
      --exclude='*/target'                                               \
      --exclude='*/bin'                                                  \
      --exclude='*/obj'                                                  \
      --exclude='media/cinematography'                                   \
      --exclude='/torrents'                                              \
      /gahag 2>&1                                                        \
    | tee $(date '+%Y-%m-%dT%H.%M.%S-rsync.log')
}

function gahag-backup-restore {
  tar -xvpzf "/run/media/gahag/Backup/backup.$@.tar.gz" \
      -C /gahag-restore \
      --numeric-owner
}
