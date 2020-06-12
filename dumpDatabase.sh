#! /bin/sh

DUMP_FILE_NAME="backupOn$(date +%Y-%m-%d-%H-%M).dump"
echo "Creating dump: $DUMP_FILE_NAME"
mkdir pg_backup
cd pg_backup || exit 1

pg_dump -C -w --format=c --blobs >"$DUMP_FILE_NAME"

if [ $? -ne 0 ]; then
  rm "$DUMP_FILE_NAME"
  echo "Back up not created, check db connection settings"
  exit 1
fi

aws s3 cp "${DUMP_FILE_NAME}" "s3://${S3_BUCKET}/${DUMP_FILE_NAME}"

echo 'Successfully Backed Up'
exit 0
