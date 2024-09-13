conda deactivate && conda activate ppa
phylophlan_metagenomic -i /Users/albertolupatin/Desktop/Genomics/Project/SGB1566/Samples -e ".fna" -d CMG2324 --database_folder ppa_db --nproc 8 --verbose -n 1 | tee ppa_project.log
