resource "shoreline_notebook" "gpu_environment_debugging" {
  name       = "gpu_environment_debugging"
  data       = file("${path.module}/data/gpu_environment_debugging.json")
  depends_on = []
}

