#!/bin/bash
#!/bin/bash
#SBATCH -JSlurmCPlusExample             # Job name
#SBATCH -account=rwang753    #tracking account  
#SBATCH -N1 --ntasks-per-node=4          # Number of nodes and cores per node required
#SBATCH --mem-per-cpu=1G                 # Memory per core
#SBATCH -t1:00:00                                # Duration of the job (Ex: 15 mins)
#SBATCH -phive                     # queue name(where job is submitted) 
#SBATCH -oReport-%j.out                  # Combined output and error messages file
#SBATCH --mail-type=BEGIN,END,FAIL       # Mail preferences
#SBATCH --mail-user=rwang753@gatech.edu # E-mail address for notifications
cd $SLURM_SUBMIT_DIR                     # Change to working directory

echo "TASKS_PER_NODE=" $SLURM_TASKS_PER_NODE
echo "NNODES=" $SLURM_NNODES
echo "NTASKS" $SLURM_NTASKS
echo "JOB_CPUS_PER_NODE" $SLURM_JOB_CPUS_PER_NODE
echo $SLURM_NODELIST

module load gcc   #remain to be changed 
module load mvapich2

mpicxx main.cpp -o mpi_main
mpirun ./mpi_main

