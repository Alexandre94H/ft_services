mkdir dashboards
containers=( ftps mysql wordpress phpmyadmin nginx influxdb grafana )
for container_name in "${containers[@]}"
do
	echo generating dashboard $container_name.json
	sed "s/<container_name>/$container_name/g" sample.json > /dashboards/$container_name.json
done