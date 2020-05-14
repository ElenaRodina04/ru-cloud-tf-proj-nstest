/*
* Test instances for diagnostic and network performance tests
*/

data "yandex_compute_image" "centos-8" {
  family = "centos-8"
  #image_id = "fd83i5r5g44fjkdpuuva"
}


/*
* NS-VM Zone A
*/
resource "yandex_compute_instance" "ns-vm-01" {
  name      = "ns-vm-01"
  hostname  = "ns-vm-01"
  labels    = var.labels
  folder_id = data.yandex_resourcemanager_folder.folder.id

  platform_id = "standard-v2"
  zone        = element(var.zones, 0)

  resources {
    cores         = var.instance.cores
    memory        = var.instance.memory
    core_fraction = var.instance.core_fraction
  }

  boot_disk {
    auto_delete = true

    initialize_params {
      image_id = data.yandex_compute_image.base_image.id
      type     = var.instance.boot_disk_type
      size     = var.instance.boot_disk_size
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.net-p2p-transit-ru-central1-a.id
    nat       = false
  }


  metadata = {
    user-data = file("./bootstrap/cloud-config-ns-vm.yaml")
  }
}

/*
* NS-VM Zone B
*/
resource "yandex_compute_instance" "ns-vm-02" {
  name      = "ns-vm-02"
  hostname  = "ns-vm-02"
  labels    = var.labels
  folder_id = data.yandex_resourcemanager_folder.folder.id

  platform_id = "standard-v2"
  zone        = element(var.zones, 0)

  resources {
    cores         = var.instance.cores
    memory        = var.instance.memory
    core_fraction = var.instance.core_fraction
  }

  boot_disk {
    auto_delete = true

    initialize_params {
      image_id = data.yandex_compute_image.base_image.id
      type     = var.instance.boot_disk_type
      size     = var.instance.boot_disk_size
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.net-p2p-transit-ru-central1-b.id
    nat       = false
  }


  metadata = {
    user-data = file("./bootstrap/cloud-config-ns-vm.yaml")
  }
}

/*
* NS-VM Zone C
*/
resource "yandex_compute_instance" "ns-vm-03" {
  name      = "ns-vm-03"
  hostname  = "ns-vm-03"
  labels    = var.labels
  folder_id = data.yandex_resourcemanager_folder.folder.id

  platform_id = "standard-v2"
  zone        = element(var.zones, 0)

  resources {
    cores         = var.instance.cores
    memory        = var.instance.memory
    core_fraction = var.instance.core_fraction
  }

  boot_disk {
    auto_delete = true

    initialize_params {
      image_id = data.yandex_compute_image.base_image.id
      type     = var.instance.boot_disk_type
      size     = var.instance.boot_disk_size
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.net-p2p-transit-ru-central1-c.id
    nat       = false
  }


  metadata = {
    user-data = file("./bootstrap/cloud-config-ns-vm.yaml")
  }
}