output "security_group_id" {
  value = aws_security_group.secgrp.id
}

output "security_group_arn" {
  value = aws_security_group.secgrp.arn
}

output "vpc_id" {
  value = aws_security_group.secgrp.vpc_id
}

output "owner_id" {
  value = aws_security_group.secgrp.owner_id
}

output "name" {
  value = aws_security_group.secgrp.name
}

output "description" {
  value = aws_security_group.secgrp.description
}

output "ingress" {
  value = aws_security_group.secgrp.ingress
}

output "egress" {
  value = aws_security_group.secgrp.egress
}
