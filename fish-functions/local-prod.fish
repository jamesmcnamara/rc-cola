function local-prod
	docker-compose -f ~/vms/chosen/docker-compose.prod.yml -f ~/vms/chosen/docker-compose.staging.yml -p chosenprod $argv;
end
