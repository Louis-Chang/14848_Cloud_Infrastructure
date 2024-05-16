resource "kubernetes_deployment" "jupyter_notebook" {
	metadata {
		name = "jupyter-notebook-deployment"
		labels = {
			app = "jupyter-notebook"
		}
	}

	spec {
		replicas = 2
		selector {
			match_labels = {
				app = "jupyter-notebook"
			}
		}

		template {
			metadata {
				labels = {
					app = "jupyter-notebook"
				}
			}

			spec {
				container {
					name	= "jupyter-notebook"
					image = "jihrennc/finalproject:jupyternotebook"

					port {
						container_port = 8888
					}
				}
			}
		}
	}
}

resource "kubernetes_service" "jupyter_notebook" {
	metadata {
		name = "jupyter-notebook"
	}

	spec {
		type = "LoadBalancer"
		load_balancer_ip = "34.133.226.219"

		port {
			name				= "notebook-port"
			port				= 8888
			protocol		= "TCP"
			target_port = 8888
		}

		selector = {
			app = "jupyter-notebook"
		}
	}
}
