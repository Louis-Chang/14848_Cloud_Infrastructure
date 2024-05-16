resource "kubernetes_deployment" "driver_frontend" {
	metadata {
		name = "driver-deployment"
		labels = {
			app = "driver"
		}
	}

	spec {
		replicas = 2
		selector {
			match_labels = {
				app = "driver"
			}
		}

		template {
			metadata {
				labels = {
					app = "driver"
				}
			}

			spec {
				container {
					name	= "driver-frontend"
					image = "louischang/project1.5:latest"

					port {
						container_port = 80
					}
				}
			}
		}
	}
}

resource "kubernetes_service" "driver" {
	metadata {
		name = "driver"
	}

	spec {
		type = "LoadBalancer"
		load_balancer_ip = "34.135.152.53"

		port {
			port				= 80
			target_port = 80
			protocol		= "TCP"
		}

		selector = {
			app = "driver"
		}
	}
}
