output "id" {
  value = "${aws_route_table.rt.id}"
}

output "owner_id" {
  value = "${aws_route_table.rt.owner_id}"
}

#output "association_id" {
#  value = "${aws_main_route_table_association.main_assoc.id}"
#}

#output "original_route_table_id" {
#  value = "${aws_main_route_table_association.main_assoc.original_route_table_id}"
#}
