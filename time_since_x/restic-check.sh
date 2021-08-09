#!/bin/bash
# restic-check.sh
# The purpose of this script is to alert us if backups have failed
# At present backups are taken Monday - Friday at 04:00 (wav-files) and 05:00 (mp3-zip)
# The script accepts either 'mp3-zip' or 'wav-files' as it's command line argument

FIRST_ARGUMENT=$1

check_restic_snapshots_func() {

    DATE_SINCE_BACKUP=$(restic snapshots --tag $FIRST_ARGUMENT --no-lock | tail -n 3 | head -n 1 | awk '{print $2,$3}')
    DATE_SINCE_BACKUP_SECONDS=$(date -d"$DATE_SINCE_BACKUP" +%s)

    printf '%d\n' $(( $(( $(date +%s) - $DATE_SINCE_BACKUP_SECONDS )) /3600))
}

check_restic_snapshots_func




# ## DEBUG BELOW 
echo ""
echo "** DEBUG INFORMATION BELOW **"

TEST_DATE=$(cat restic-result.txt)
TEST_DATE_SINCE=$(date -d"$TEST_DATE" +%s)

time=$(( $(date +%s) - $TEST_DATE_SINCE ))


echo "TEST_DATE = $TEST_DATE"
echo "TEST_DATE_SINCE = $TEST_DATE_SINCE"
echo "time = $time"

printf '%d\n' $(($time/3600))
printf '%d\n' $(( $(( $(date +%s) - $TEST_DATE_SINCE )) /3600))

# FIRST_ARGUMENT=$1

# check_restic_snapshots_func() {

#     #DATE_SINCE_BACKUP=$(restic snapshots --tag mp3-zip --no-lock | tail -n 3 | head -n 1 | awk '{print $2,$3}')
#     DATE_SINCE_BACKUP=$(restic snapshots --tag $FIRST_ARGUMENT --no-lock | tail -n 3 | head -n 1 | awk '{print $2,$3}')
#     printf "DATE_SINCE_BACKUP = $DATE_SINCE_BACKUP\n"
#     DATE_SINCE_BACKUP_SECONDS=$(date -d"$DATE_SINCE_BACKUP" +%s)
#     printf "DATE_SINCE_BACKUP_SECONDS = $DATE_SINCE_BACKUP_SECONDS\n"

#     printf '%d\n' $(( $(( $(date +%s) - $DATE_SINCE_BACKUP_SECONDS )) /3600))
# }

# check_restic_snapshots_func



