/influxdb/influxd &
while ! nc -z localhost 8086 </dev/null
do sleep 0.1
done
/influxdb/influx setup -f -u $INFLUX_USER -p $INFLUX_PASSWD -o $INFLUX_ORG -b $INFLUX_BUCKET -t $INFLUX_TOKEN