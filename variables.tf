// General 
variable "profile" {
  type    = string
  default = "valentina"
}

variable "project" {
  type    = string
  default = "valentina"
}

variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "aws_id" {
  type    = string
  default = "218422624508"
}

variable "domain" {
  type    = string
  default = "www.latiendadevalentina.com"
}

variable "domain_without_subdomain" {
  type    = string
  default = "latiendadevalentina.com"
}

variable "certificate_arn" {
  type = string // leave empty for web alb without ssl 

  default = "arn:aws:acm:eu-west-1:218422624508:certificate/bd6707b7-e94e-4c7e-a7e0-a8c6dbd33387"
}

variable "web_ebs_size" {
  type    = string
  default = "50"
}

# // SNS Topic for Cloudwatch Alarms 
# variable "alarms_sns_topic_arn" {
#   type    = string
#   default = "arn:aws:sns:eu-west-1:060643665409:sysadmin"
# }

// ALB 
variable "max_size_alb_web" {
  type    = string
  default = "6"
}

variable "min_size_alb_web" {
  type    = string
  default = "1"
}

variable "autoscaling_threshold" {
  type    = string
  default = "60"
}

# variable "alb_s3_logs" {
#   type    = string
#   default = "false"
# }

# variable "alb_s3_logs_bucket" {
#   type    = string
#   default = ""
# }

// ssh keys 
variable "ssh-key" {
  type    = string
  default = "valentina-cloud" // <- Your ssh key 
}

# // EC2 instance types 
variable "web_instance_type" {
  type    = string
  default = "t3.medium"
}

variable "project-pro-name" {
  type    = string
  default = "valentina"
}

# variable "opvn_instance_id" {
#   type = string //id of DEV/OVPN instance 

#   default = "i-0f8bfbf38b3bebe5c"
# }

# variable "preabundantum_instance_id" {
#   type = string //id of DEV/staging instance 

#   default = "i-0fe36a4fdd655775d"
# }

// RDS Aurora 
variable "rds_aurora_name" {
  type    = string
  default = "valentina"
}

variable "rds_username" {
  type    = string
  default = "root"
}

variable "rds_passwd" {
  type    = string
  default = "xJ7ewRtBUEF9a6xM" // <- Generate a pass 
}


variable "eip_opvpn" {
  type    = string
  default = "eipalloc-01b92f39b13060f84" // elastic ip openvpn ami
}

variable "ami_opvpn" {
  type    = string
  default = "ami-0e8bc8aa04a87b22c" //  openvpn ami
}

variable "ami_pre-valentina" {
  type    = string
  default = "ami-07d1e3e27696d78d8" //  openvpn ami
}

variable "dev_private_ip" {
  type    = "string"
  default = "172.20.1.221"
}


########## VPN ############
variable "custom_tunnel1_inside_cidr" {
  type    = string
  default = "169.254.33.88/30"
}

variable "custom_tunnel2_inside_cidr" {
  type    = string
  default = "169.254.33.100/30"
}

variable "custom_tunnel1_preshared_key" {
  type    = string
  default = "9731167899ypxxyfgh7561mn"
}

variable "custom_tunnel2_preshared_key" {
  type    = string
  default = "9731167899ypxxyfgh7561mn"
}


variable "ami_nodo-valentina" {
  type    = string
  default = "ami-02c2cea3d654d44e3" 
}

variable "certificate-NodeVal_arn" {
  type = string // leave empty for web alb without ssl 

  default = "arn:aws:acm:eu-west-1:218422624508:certificate/59dd29f3-cca9-45d5-9c8f-74c11a477ec4"
}
