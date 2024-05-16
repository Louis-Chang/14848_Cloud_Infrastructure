resource "kubernetes_deployment" "spark" {
	metadata {
		name = "spark-deployment"
		labels = {
			app = "spark"
		}
	}

	spec {
		replicas = 2
		selector {
			match_labels = {
				app = "spark"
			}
		}

		template {
			metadata {
				labels = {
					app = "spark"
				}
			}

			spec {
				container {
					name	= "spark"
					image = "bitnami/spark"

					port {
						container_port = 8080
					}
					port {
						container_port = 7077
					}
				}
			}
		}
	}
}

resource "kubernetes_service" "spark" {
	metadata {
		name = "spark"
	}

	spec {
		type = "LoadBalancer"
		load_balancer_ip = "34.170.65.170"

		port {
			name		= "web-ui"
			port        = 8080
			target_port = 8080
			protocol	= "TCP"
		}
		port {
			name		= "master"
			port        = 7077
			target_port = 7077
			protocol	= "TCP"
		}

		selector = {
			app = "spark"
		}
	}
}
