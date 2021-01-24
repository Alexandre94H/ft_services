/influxdb/influxd &
while ! nc -z localhost 8086 </dev/null
do sleep 0.1
done
/influxdb/influx setup -f -u $INFLUX_USER -p $INFLUX_PASSWD -o $INFLUX_ORG -b $INFLUX_BUCKET -t $INFLUX_TOKEN
bucket_id=$(/influxdb/influx bucket list | grep $INFLUX_BUCKET | cut -d$'\t' -f1)
telegraf_id=$(telegraf config | /influxdb/influx telegrafs create --hide-headers | cut -d$'\t' -f1)
export INFLUX_TOKEN=$(/influxdb/influx auth create --read-bucket $bucket_id --read-telegrafs --write-telegrafs --hide-headers | cut -d$'\t' -f3)
echo $INFLUX_TOKEN
telegraf --config http://localhost:8086/api/v2/telegrafs/$telegraf_id