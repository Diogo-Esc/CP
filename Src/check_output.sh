#/bin/sh

#use only on proj dir

echo "-> starting"
echo "............"
echo ""

rm ./s.txt 
rm ./p.txt

make clean

make debug_seq

make debug_omp

echo ""
echo "............"
echo "-> make complete"
echo "-> start execution"
#echo "-> insert <num_threads> <size>"
#read t size

./energy_storms_seq 35 test_files/layer35_maximums_0 test_files/layer35_maximums_0 test_files/layer35_maximums_0 test_files/layer35_maximums_0 test_files/layer35_maximums_0 > s.txt

#./energy_storms_seq 35 test_files/test_01_a35* > s.txt

./energy_storms_omp 2 35 test_files/layer35_maximums_0 test_files/layer35_maximums_0 test_files/layer35_maximums_0 test_files/layer35_maximums_0 test_files/layer35_maximums_0 > p.txt

#./energy_storms_omp 2 35 test_files/test_01_a35* > p.txt

echo "............"
echo "-> execution complete"
echo "-> starting diff"
echo "............"
echo ""

diff s.txt p.txt


