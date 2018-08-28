# function partbkp { # $1 : Partition ID (sdXY) ; $2 : Output file
#   sudo dd if="/dev/$1" conv=sync,noerror bs=64K "of=$2"
# }


function gahag-backup {
  # add --delete flag to delete extraneous files from the
  # receiving side (ones that aren’t on the sending side).
  rsync -av --delete --delete-excluded                                \
        --exclude='.git/'                                             \
        --exclude='gahag/media/cinematography'                        \
        --exclude='gahag/programming/projects/ic/DetuxUbuntu-1.0.ova' \
        /gahag "/run/media/gahag/gahag - portable/backup/" 2>&1       \
  | tee $(date '+%Y-%m-%d(%H:%M:%S)-rsync.log')
}
