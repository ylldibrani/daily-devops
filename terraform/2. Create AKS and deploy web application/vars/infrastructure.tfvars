aks_cluster_name = "aks-ylldibrani-westeu-001" 
kubernetes_version = "1.28.9" 
resource_group_name = "rg-aks-ylldibrani-westeu-001"
location = "westeurope" 

default_node_pool_name = "default"
default_node_pool_vm_size = "Standard_B2s"

default_node_pool_availability_zones = ["1"]
default_node_pool_enable_auto_scaling = true
default_node_pool_node_count = 3