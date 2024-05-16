variable "project_id" {
	type				= string
	description = "ID of the Google Project"
	default		= "onyx-sign-417920"
}

variable "region" {
	type				= string
	description = "Default Region"
	default		= "us-central1"
}

variable "zone" {
	type				= string
	description = "Default Zone"
	default		= "us-central1-a"
}

variable "cluster_name" {
	type				= string
	description = "Name of server"
	default		= "cluster1"
}

variable "node_pool" {
		type				= string
		description = "Name of Node Pool"
		default		 = "main-node-pool"
}

variable "machine_type" {
	type				= string
	description = "Machine Type"
	default		= "e2-standard-4"
}

variable "credentials_json" {
	type				= string
	description = "Credentials JSON file"
	default		= "/Users/louischang/mykeys/onyx-sign-417920-1d5891737b43.json"
}