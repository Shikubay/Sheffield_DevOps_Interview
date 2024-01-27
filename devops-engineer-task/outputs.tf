# getting attributes of either the created resources or data attributes

output "az" {
  value = local.azs
}

# To get outputs of security groups IDs in map
output "security_group_ids" {
  value = {
    for sg_name, sg in aws_security_group.sg :
    sg_name => sg.id
  }
}

# To get output of vpc ID
output "vpc_id" {
  value = aws_vpc.public-vpc.id
}

# To get outputs of dev instance IDs in map
output "dev_instance_ids" {
  value = {
    for instance in aws_instance.web_dev :
    instance.tags["Name"] => instance.id
  }
}

# To get outputs of prod instance IDs in map
output "prod_instance_ids" {
  value = {
    for instance in aws_instance.web_prod :
    instance.tags["Name"] => instance.id
  }
}
