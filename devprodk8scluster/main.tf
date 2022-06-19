module "dev_cluster" {
    source       = "./main"
    env_name     = "dev"
    cluster_name = "vuechessk8scluster"
}

module "prod_cluster" {
    source       = "./main"
    env_name     = "prod"
    cluster_name = "vuechessterrk8scluster"
}