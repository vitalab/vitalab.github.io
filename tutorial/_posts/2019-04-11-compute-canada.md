---
layout: review
title:  "Deep Learning with Compute Canada"
tags:   deep-learning machine-learning
author: Carl Lemaire
---

# Sign up

1. Ask your supervisor his Calcul Canada group name (e.g. `def-pmjodoin`) and CCRI (e.g. `pje-224-01`)
2. [Sign up on Calcul Canada](https://www.computecanada.ca/research-portal/account-management/apply-for-an-account/)
3. Login through SSH on one of the clusters (you may be denied access while your account is being set up)

```
ssh USER@beluga.computecanada.ca
ssh USER@graham.computecanada.ca
ssh USER@cedar.computecanada.ca
```

You will arrive on a _login node_. This is not where you run code, but you have internet access. Compute nodes don't have internet access.

[You can also use Calcul Québec resources.](https://wiki.calculquebec.ca/w/Accueil)

# Setup your environment

1. Get your code. Use `scp` or git.
2. Create a virtualenv and install your requirements.
3. Read the docs about your deep learning framework of choice ([PyTorch](https://docs.computecanada.ca/wiki/PyTorch), [TensorFlow](https://docs.computecanada.ca/wiki/TensorFlow))
4. Run your code to make sure you have all dependencies (stop when training begins; note that you won't have GPUs).

# Transfer your dataset

The simplest option to send your data is to "pipe tar into ssh". You should put your data into the shared storage of the project, in `~/projects/def-pmjodoin`.

```bash
tar czf - my/dataset/ | ssh USER@HOST.computecanada.ca 'cd ~/projects/def-pmjodoin/data && tar xvzf -'
```

This will transfer the directory as one big file, that will be split back upon arrival. `scp` is known to be slow when transferring lots of small files. Another option is GLOBUS, which is tailored for big data transfers ([read more](https://wiki.calculquebec.ca/w/Globus/fr)).

**If your dataset contains tons of small files** (e.g. image classification), **you should `tar` them into one big file**. There are not only total file size limits, but also a limit to the number of files you can store. Also, if you need to move your dataset from one storage to another, it will be way faster, as the filesystems are optimized for large file transfers.

```bash
tar -cf mydataset.tar my/dataset/  # aggregate without compressing; add z to compress
tar -xf mydataset.tar .  # untar later
```

# Use the right storage at the right time

[Read the Compute Canada documentation about this.](https://docs.computecanada.ca/wiki/Storage_and_file_management)

# Try with an interactive task

Before writing a script for submitting a task, you should try your stuff in an [**interactive job**](https://docs.computecanada.ca/wiki/Running_jobs#Interactive_jobs). **THIS IS ONLY FOR TESTING AND DEBUGGING.** As soon as it works, transition to a job script (next section).

Example:
```bash
salloc --time=1:0:0 --cpus-per-task=8 --mem 32000M --gres=gpu:1
```

You may have to wait to get the resources. Eventually you'll arrive in a shell. You'll be on a compute node; no internet access, but GPUs! You need to setup this shell; then you can try your code.

```bash
module load python/3.6
source venv/bin/activate
./move_dataset_to_node.sh  # optional
cd mycode
python train.py
```

Take note the correct sequence of commands.

# Submit a task using a script

[How to submit job scripts.](https://docs.computecanada.ca/wiki/Running_jobs#Use_sbatch_to_submit_jobs)

Example:
```bash
#!/bin/bash

# Request resources --------------
# Graham GPU node: 32 cores, 128G ram, 2 GPUs (12G each)
#SBATCH --account def-pmjodoin
#SBATCH --gres=gpu:1               # Number of GPUs (per node)
#SBATCH --cpus-per-task=8          # Number of cores (not cpus)
#SBATCH --mem=32000M               # memory (per node)
#SBATCH --time=0-24:00             # time (DD-HH:MM)

# Setup and run task -------------
module load python/3.6
source venv/bin/activate
./move_dataset_to_node.sh  # optional
cd mycode
python train.py
```

Save this script as `pouding.sh` (or any other name). Submit the task using:

```bash
sbatch pouding.sh
```

You will wait in line for longer if you request more time, more resources, or if your script is not named "pouding". Your priority will also decrease if you don't use all the resources you ask. The Standard output and Standard error will be written to files, in the directory where you submitted the task (but you can configure it).

# More info

<https://docs.computecanada.ca/wiki/Getting_started>
