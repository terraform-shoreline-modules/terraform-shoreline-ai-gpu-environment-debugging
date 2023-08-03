
### About Shoreline
The Shoreline platform provides real-time monitoring, alerting, and incident automation for cloud operations. Use Shoreline to detect, debug, and automate repairs across your entire fleet in seconds with just a few lines of code.

Shoreline Agents are efficient and non-intrusive processes running in the background of all your monitored hosts. Agents act as the secure link between Shoreline and your environment's Resources, providing real-time monitoring and metric collection across your fleet. Agents can execute actions on your behalf -- everything from simple Linux commands to full remediation playbooks -- running simultaneously across all the targeted Resources.

Since Agents are distributed throughout your fleet and monitor your Resources in real time, when an issue occurs Shoreline automatically alerts your team before your operators notice something is wrong. Plus, when you're ready for it, Shoreline can automatically resolve these issues using Alarms, Actions, Bots, and other Shoreline tools that you configure. These objects work in tandem to monitor your fleet and dispatch the appropriate response if something goes wrong -- you can even receive notifications via the fully-customizable Slack integration.

Shoreline Notebooks let you convert your static runbooks into interactive, annotated, sharable web-based documents. Through a combination of Markdown-based notes and Shoreline's expressive Op language, you have one-click access to real-time, per-second debug data and powerful, fleetwide repair commands.

### What are Shoreline Op Packs?
Shoreline Op Packs are open-source collections of Terraform configurations and supporting scripts that use the Shoreline Terraform Provider and the Shoreline Platform to create turnkey incident automations for common operational issues. Each Op Pack comes with smart defaults and works out of the box with minimal setup, while also providing you and your team with the flexibility to customize, automate, codify, and commit your own Op Pack configurations.

# GPU Environment Debugging
---

GPU environment debugging is important for managing and troubleshooting machine learning environments. This runbook provides a series of systematic checks to ensure that common tools such as PyTorch and TensorFlow are setup and functioning properly in a GPU environment and with CUDA, NVIDIA's parallel computing platform and application programming interface.

### Parameters
```shell
# Environment Variables

export NVIDIA_DRIVER_VERSION="PLACEHOLDER"
```

## Debug

### Check for available GPU hardware
```shell
lspci | grep -i VGA
```

### Get details of GPU cards installed on machine
```shell
nvidia-smi -q
```

### Check if CUDA is installed and check its installation version
```shell
nvcc --version
```

### Check PyTorch version
```shell
python3 -c "import torch; print(torch.__version__)"
```

### Check if PyTorch can access the GPU
```shell
python3 -c "import torch; print(torch.cuda.is_available())"
```

### Check CUDA version being used by PyTorch, ensuring it is supported by the driver version
```shell
python3 -c "import torch; print(torch.version.cuda)"
```

### Check TensorFlow version
```shell
python3 -c "import tensorflow as tf; print(tf.__version__)"
```

### Check if TensorFlow can access the GPU
```shell
python3 -c "import tensorflow as tf; print(tf.test.is_gpu_available())"
```

### Check CUDA version being used by TensorFlow, ensuring it is supported by the driver version
```shell
python3 -c "import tensorflow as tf; print(tf.sysconfig.get_build_info()['cuda_version'])"
```

### Update version of Nvidia driver if necessary
```shell
sudo apt-get install nvidia-driver-${NVIDIA_DRIVER_VERSION}
```