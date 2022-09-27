from test_tube import SlurmCluster
#from trainclip_v2 import train as train_clip
from HOparser import parser 
from PLDemo import train as train_mnist
if __name__ == '__main__':

    # argsparser = parser(strategy='random_search')
    # hyperparams = argsparser.parse_args()

    # Enable cluster training.
    cluster = SlurmCluster(
        # hyperparam_optimizer=hyperparams,
        log_path="/tmp/",#hyperparams.log_path,
        python_cmd='python3',
#        test_tube_exp_name="PL_test"
    )

    cluster.cpus_per_task=4
    cluster.per_experiment_nb_nodes = 4
    
    
    cluster.memory_mb_per_node = 20000

    # set a walltime of 24 hours,0, minues
    cluster.job_time = '24:00:00'

    # 1 minute before walltime is up, SlurmCluster will launch a continuation job and kill this job.
    # you must provide your own loading and saving function which the cluster object will call
    cluster.minutes_to_checkpoint_before_walltime = 1
    cluster.optimize_parallel_cluster_cpu(train_mnist, nb_trials=2, job_name='fourth_wandb_trial_batch') # Change this to optimize_parralel_cluster_cpu to debug.