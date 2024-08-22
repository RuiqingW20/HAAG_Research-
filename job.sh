#!/bin/bash
#SBATCH -JSlurmCplusExample   #jobname 
#SBATCH -account=rwang753    #tracking account  
#SBATCH -n4                  # number of cores required 
#SBATCH --mem-per-cpu=1G     # memory per core 
#SBATCH -t15                 # duration of the job 
#SBATCH -phive               # queue name(where job is submitted) 
#SBATCH -oReport-%j.out      # combined output and error message 
#SBATCH -mail-type=BEGIN,END,FAIL   #mail preference 
#SBATCH -mail-user=rwang753@gatech.edu  #email address for notification
cd $SLURM_SUBMIT_DIR #change to working dir 

echo "TASKS_PER_NODE=" $SLURM_TASKS_PER_NODE
echo "NNODES=" $SLURM_NNODES
echo "NTASKS" $SLURM_NTASKS
echo "JOB_CPUS_PER_NODE" $SLURM_JOB_CPUS_PER_NODE
echo $SLURM_NODELIST
./a.out

