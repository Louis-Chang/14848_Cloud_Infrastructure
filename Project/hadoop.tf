resource "null_resource" "deploy_hadoop_services" {
    depends_on = [
        google_container_node_pool.main_node_pool
    ]
    
    provisioner "local-exec" {
        command = <<EOT
			kubectl apply -f ./europe/hadoop/docker-hadoop-default-networkpolicy.yaml &&
			kubectl apply -f ./europe/hadoop/hadoop-datanode1-persistentvolumeclaim.yaml &&
			kubectl apply -f ./europe/hadoop/hadoop-datanode2-persistentvolumeclaim.yaml &&
			kubectl apply -f ./europe/hadoop/hadoop-env-configmap.yaml &&
			kubectl apply -f ./europe/hadoop/hadoop-historyserver-persistentvolumeclaim.yaml &&
			kubectl apply -f ./europe/hadoop/hadoop-namenode-persistentvolumeclaim.yaml &&
			kubectl apply -f ./europe/hadoop/datanode1-deployment.yaml &&
			kubectl apply -f ./europe/hadoop/datanode2-deployment.yaml &&
			kubectl apply -f ./europe/hadoop/historyserver-deployment.yaml &&
			kubectl apply -f ./europe/hadoop/namenode-deployment.yaml &&
			kubectl apply -f ./europe/hadoop/nodemanager-deployment.yaml &&
			kubectl apply -f ./europe/hadoop/resourcemanager-deployment.yaml &&  
			kubectl apply -f ./europe/hadoop/datanode1-service.yaml &&
			kubectl apply -f ./europe/hadoop/datanode2-service.yaml &&
			kubectl apply -f ./europe/hadoop/historyserver-service.yaml &&
			kubectl apply -f ./europe/hadoop/namenode-service.yaml &&
			kubectl apply -f ./europe/hadoop/nodemanager-service.yaml &&
			kubectl apply -f ./europe/hadoop/resourcemanager-service.yaml
        EOT
    }
}