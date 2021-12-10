output "key_name" {
  value = aws_key_pair.keypair.key_name
}

output "fingerprint" {
  value = aws_key_pair.keypair.fingerprint
}
