conda deactivate && conda activate prokka
 for i in $(ls *.fna); do
      prokka --outdir ${i//.fna} --prefix ${i//.fna} $i --compliant;
done
