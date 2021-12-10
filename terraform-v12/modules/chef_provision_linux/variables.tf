variable "type" {
  description = "The connection type that should be used. Valid types are ssh and winrm Defaults to ssh."
  default = "ssh"
}

variable "user" {
  description = "The user that we should use for the connection. Defaults to root when using type ssh and defaults to Administrator when using type winrm."
  default = ""
}

variable "host" {
  description = "The address of the resource to connect to. This is usually specified by the provider."
}

variable "port" {
  description = "The port to connect to. Defaults to 22 when using type ssh and defaults to 5985 when using type winrm."
  default = 22
}

variable "timeout" {
  description = "The timeout to wait for the connection to become available. This defaults to 5 minutes. Should be provided as a string like 30s or 5m."
  default = "10m"
}

variable "script_path" {
  description = "The path used to copy scripts meant for remote execution."
  default = ""
}

variable "private_key" {
  description = "The contents of an SSH key to use for the connection. These can be loaded from a file on disk using the file function. This takes preference over the password if provided."
}

variable "certificate" {
  description = "The contents of a signed CA Certificate. The certificate argument must be used in conjunction with a private_key. These can be loaded from a file on disk using the the file function."
  default = ""
}

variable "agent" {
  description = "Set to false to disable using ssh-agent to authenticate. On Windows the only supported SSH authentication agent is Pageant."
  default = false
}

variable "agent_identity" {
  description = "The preferred identity from the ssh agent for authentication."
  default = ""
}

variable "host_key" {
  description = "The public key from the remote host or the signing CA, used to verify the connection."
  default = ""
}

variable "attributes_json" {
  description = "(Optional) A raw JSON string with initial node attributes for the new node. These can also be loaded from a file on disk using the file function."
  default = ""
}

variable "channel" {
  description = "(Optional) The Chef Client release channel to install from. If not set, the stable channel will be used."
  default = "stable"
}

#variable "client_options" {
#  description = "(Optional) A list of optional Chef Client configuration options. See the Chef Client documentation for all available options."
#  default = [""]
#}

variable "disable_reporting" {
  description = "(Optional) If true the Chef Client will not try to send reporting data (used by Chef Reporting) to the Chef Server (defaults to false)."
  default = false
}

variable "environment" {
  description = "(Optional) The Chef environment the new node will be joining (defaults to _default)."
  default = "_default"
}

variable "fetch_chef_certificates" {
  description = "(Optional) If true the SSL certificates configured on your Chef Server will be fetched and trusted. See the knife ssl_fetch documentation for more details."
  default = true
}

variable "log_to_file" {
  description = "(Optional) If true, the output of the initial Chef Client run will be logged to a local file instead of the console. The file will be created in a subdirectory called logfiles created in your current directory. The filename will be the node_name of the new node."
  default = false
}

variable "node_name" {
  description = "(Required) The name of the node to register with the Chef Server."
}

variable "ohai_hints" {
  description = "(Optional) A list with Ohai hints to upload to the node."
  default = ""
}

variable "os_type" {
  description = "(Optional) The OS type of the node. Valid options are: linux and windows. If not supplied, the connection type will be used to determine the OS type (ssh will assume linux and winrm will assume windows)."
  default = "linux"
}

variable "recreate_client" {
  description = "(Optional) If true, first delete any existing Chef Node and Client before registering the new Chef Client."
  default = true
}

variable "run_list" {
  description = "(Optional) A list with recipes that will be invoked during the initial Chef Client run. The run-list will also be saved to the Chef Server after a successful initial run. Required if use_policyfile is false; ignored when use_policyfile is true (see named_run_list to specify a run-list defined in a Policyfile)."
  default = []
}

variable "server_url" {
  description = "(Required) The URL to the Chef server. This includes the path to the organization. See the example."
  default = "https://chef.dnmsp.com/organizations/chef12"
}

variable "skip_install" {
  description = "skip_install (boolean) - (Optional) Skip the installation of Chef Client on the remote machine. This assumes Chef Client is already installed when you run the chef provisioner."
  default = false
}

variable "skip_register" {
  description = "(Optional) Skip the registration of Chef Client on the remote machine. This assumes Chef Client is already registered and the private key (client.pem) is available in the default Chef configuration directory when you run the chef provisioner."
  default = false
}

variable "ssl_verify_mode" {
  description = "(Optional) Used to set the verify mode for Chef Client HTTPS requests. The options are :verify_none, or :verify_peer which is default."
  default = ":verify_peer"
}

variable "user_name" {
  description = "(Required) The name of an existing Chef user to register the new Chef Client and optionally configure Chef Vaults."
  default = "jenkins_pipeline"
}

variable "user_key" {
  description = "(Required) The contents of the user key that will be used to authenticate with the Chef Server. This can also be loaded from a file on disk using the file function."
  default = "/var/lib/jenkins/.chef/jenkins_pipeline.pem"
}

variable "vault_json" {
  description = "(Optional) A raw JSON string with Chef Vaults and Items to which the new node should have access. These can also be loaded from a file on disk using the file function."
  default = ""
}

variable "chef_version" {
  description = "(Optional) The Chef Client version to install on the remote machine. If not set, the latest available version will be installed."
  default = "12.19.36"
}
