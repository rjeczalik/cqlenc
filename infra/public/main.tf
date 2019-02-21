module "scylla-cluster" {
	source  = "github.com/rjeczalik/terraform-aws-scylla"

	aws_instance_type = "i3.large"

	cluster_count = 3
	cluster_user_cidr = ["0.0.0.0/0"]
	cluster_broadcast = "public"
}
