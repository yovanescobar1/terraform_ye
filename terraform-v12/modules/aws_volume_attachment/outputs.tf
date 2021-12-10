output "device_name" {
  value = aws_volume_attachment.ebs_att.device_name
}

output "instance_id" {
  value = aws_volume_attachment.ebs_att.instance_id
}

output "volume_id" {
  value = aws_volume_attachment.ebs_att.volume_id
}
