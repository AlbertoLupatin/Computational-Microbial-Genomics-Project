# Create Aliases for the .gff files generated by Prokka
conda deactivate && conda activate roary

mkdir roary_input
cd roary_input
ln -s /Users/albertolupatin/Desktop/Genomics/Project/Prokka/M*/*.gff ./

# Run Prokka
roary -e --mafft -p 8 -f ../roary_output *.gff

chmod +x create_pan_genome_plots.R
Rscript create_pan_genome_plots.R
