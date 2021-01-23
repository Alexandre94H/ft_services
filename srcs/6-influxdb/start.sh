/influxdb/influxd &
while ! nc -z localhost 8086 </dev/null
do sleep 0.1
done
/influxdb/influx setup -f -u $INFLUX_USER -p $INFLUX_PASSWD -o $INFLUX_ORG -b $INFLUX_BUCKET -t $INFLUX_TOKEN
#telegraf config | /influxdb/influx telegrafs create
/influxdb/influx telegrafs create -n "Example Telegraf config" -d "This is a
 description for an example Telegraf configuration." -f /etc/telegraf.conf
id=$(/influxdb/influx telegrafs --hide-headers | cut -d$'\t' -f1)
telegraf --config http://localhost:8086/api/v2/telegrafs/$id &

