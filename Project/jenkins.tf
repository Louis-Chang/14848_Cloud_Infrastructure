resource "kubernetes_deployment" "jenkins" {
	metadata {
		name = "jenkins-deployment"
		labels = {
			app = "jenkins"
		}
	}

	spec {
		replicas = 2
		selector {
			match_labels = {
				app = "jenkins"
			}
		}

		template {
			metadata {
				labels = {
					app = "jenkins"
				}
			}

			spec {
				container {
					name	= "jenkins"
					image = "jihrennc/finalproject:jenkins3.3"
					env {
						name  = "JAVA_OPTS"
						value = "-Dhudson.security.csrf.GlobalCrumbIssuerConfiguration.DISABLE_CSRF_PROTECTION=true"
					}
					port {
						container_port = 8080
					}

					resources {
						requests = {
							memory = "1Gi"
							cpu		= "500m"
						}
					}
				}
			}
		}
	}
}


resource "kubernetes_service" "jenkins" {
	metadata {
		name = "jenkins"
	}

	spec {
		type = "LoadBalancer"
		load_balancer_ip = "34.30.149.154"

		port {
			name				= "jenkins-port"
			port				= 8080
			target_port = 8080
			protocol		= "TCP"
		}

		selector = {
			app = "jenkins"
		}
	}
}
