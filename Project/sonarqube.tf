resource "kubernetes_deployment" "sonarqube" {
	metadata {
		name = "sonarqube"
		labels = {
			app = "sonarqube"
		}
	}

	spec {
		replicas = 1
		selector {
			match_labels = {
				app = "sonarqube"
			}
		}

		template {
			metadata {
				labels = {
					app = "sonarqube"
				}
			}

			spec {
				container {
					name	= "sonarqube"
					image = "louischang/sonarqube1.0:latest"

					port {
						container_port = 9000
					}
				}
			}
		}
	}
}

resource "kubernetes_service" "sonarqube" {
	metadata {
		name = "sonarqube"
		labels = {
			app = "sonarqube"
		}
	}

	spec {
		type = "LoadBalancer"
		load_balancer_ip = "35.202.249.189"

		port {
			port				= 9000
			target_port = 9000
			protocol		= "TCP"
		}

		selector = {
			app = "sonarqube"
		}
	}
}
