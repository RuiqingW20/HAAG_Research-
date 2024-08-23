#!/bin/bash
#SBATCH -GPUExample_RW # Job name
#SBATCH -rwang753 # Charge account
#SBATCH -N1 --gres=gpu:1 # Number of nodes and GPUs required
#SBATCH --gres-flags=enforce-binding # Map CPUs to GPUs
#SBATCH --mem-per-gpu=12G # Memory per gpu
#SBATCH -t15 # Duration of the job (Ex: 15 mins)
#SBATCH -phive-gpu # Partition name (where job is submitted)
#SBATCH -oReport-%j.out # Combined output and error messages file
#SBATCH --mail-type=BEGIN,END,FAIL # Mail preferences
#SBATCH --mail-user=rwang753@gatech.edu # e-mail address for notifications
cd $HOME/slurm_gpu_example # Change to working directory created in
$HOME
module load tensorflow-gpu/2.9.0 # Load module dependencies
srun python $TENSORFLOWGPUROOT/gpu_test.py gpu 1000 # Run test example
