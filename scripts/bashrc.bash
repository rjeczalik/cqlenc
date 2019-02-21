#!/bin/bash

tf-private-key() {
	cat terraform.tfstate | jq -r '.modules[].outputs | select(. | has("private_key")) | .private_key.value'
}

tf-all-ip() {
	cat terraform.tfstate | jq -r '.modules[].resources | select(. | has("aws_eip.monitor")) | .[].primary.attributes.public_ip' | grep -v null
}

tf-outputs() {
	cat terraform.tfstate | jq -r '.modules[].outputs | select(. | has("private_key")) | .'
}

tf-bench() {
	mkdir -p bench
	gotmpl bench.tf.tmpl terraform.tfstate > bench/main.tf
}
