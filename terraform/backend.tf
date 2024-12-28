terraform {
  cloud { 
    organization = "hexlet999" 
    workspaces { 
      name = "hexlet-workspace" 
    } 
  } 
  required_version = ">= 1.1.0"
}
