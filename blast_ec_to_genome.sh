#seach ncbi for ec number > get ammino acid

#use this then blastp against refseq (another db)

#then we use this to get nuc for each ec number

#then cluster nuc seq @ 99% because many same seq for each ec number
location: /mnt/research/germs/jin/COBS_CAZY

#now me need to make a db for each ec number (turn the six files from above into a databse 

#then blast cobs raw reads into each ec number database

#.99.fa are pretty small, no need to submit job
module load blast+

#make blastdb for each ec
for x in *.99.fa; do makeblastdb -in $x -dbtype nucl -out $x; done

#looks like: 3 files for each ec #

#make screen
#echo 'shell -$SHELL' >> ~/.screenrc
screen -S blaston1
module load blast+

#Run blast on one metagenome against one EC db 
blastn -db /mnt/scratch/flaterj1/COBS_CAZY/EC_3.2.1.21.fa.99.fa -query Hofmockel20_CGTACG_L005_R2_001.fastq.fasta -evalue 1e-5 -out /mnt/scratch/flaterj1/COBS_CAZY/H20x21.blast -outfmt 6

#exit screen
ctrl-a d

#check if running by using top look for your username and the command
top

#when done we have a .blast file (from one sample and one ec number) 