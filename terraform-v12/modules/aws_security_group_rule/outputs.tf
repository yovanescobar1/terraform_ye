output "id" {
  value = aws_security_group_rule.rule.*.id
}

output "type" {
  value = aws_security_group_rule.rule.*.type
}

output "from_port" {
  value = aws_security_group_rule.rule.*.from_port
}

output "to_port" {
  value = aws_security_group_rule.rule.*.to_port
}

output "protocol" {
  value = aws_security_group_rule.rule.*.protocol
}

output "description" {
  value = aws_security_group_rule.rule.*.description
}
