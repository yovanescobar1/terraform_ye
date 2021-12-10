resource null_resource "chefstrap" {
  connection {
      type           = var.type
      user           = var.user
      host           = var.host
      port           = var.port
      timeout        = var.timeout
      script_path    = var.script_path
      private_key    = var.private_key
      certificate    = var.certificate
      agent          = var.agent
      agent_identity = var.agent_identity
      host_key       = var.host_key
    }

  provisioner "local-exec" {
    command = "sleep 10m"
  }

  provisioner "chef" {
    attributes_json         = var.attributes_json
    channel                 = var.channel
    #client_options          = ["$var.client_options"]
    disable_reporting       = var.disable_reporting
    environment             = var.environment
    fetch_chef_certificates = var.fetch_chef_certificates
    log_to_file             = var.log_to_file
    node_name               = var.node_name
    ohai_hints              = [var.ohai_hints]
    os_type                 = var.os_type
    recreate_client         = var.recreate_client
    run_list                = [var.run_list]
    server_url              = var.server_url
    skip_install            = var.skip_install
    skip_register           = var.skip_register
    ssl_verify_mode         = var.ssl_verify_mode
    user_name               = var.user_name
    user_key                = file(var.user_key)
    vault_json              = var.vault_json
    version                 = var.chef_version
  }
}
