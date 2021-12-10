output "volume_id" {
  value = aws_ebs_volume.volume.id
}

output "arn" {
  value = [aws_ebs_volume.volume.*.arn]
}

#output "volume_id" {
#  value = concat(aws_ebs_volume.volume.*.id)
#}
