#/bin/sh

make clean
make all

echo ""
echo "------"
echo "test 1 - seq"
time ./energy_storms_seq 35 test_files/test_01_a35_p8_w1 test_files/test_01_a35_p7_w2 test_files/test_01_a35_p5_w3 test_files/test_01_a35_p8_w4

echo ""
echo "------"
echo "test 1 - 2 threads"
time ./energy_storms_omp 2 35 test_files/test_01_a35_p8_w1 test_files/test_01_a35_p7_w2 test_files/test_01_a35_p5_w3 test_files/test_01_a35_p8_w4

echo ""
echo "------"
echo "test 2 - seq"
time ./energy_storms_seq 30000 test_files/test_02_a30k_p20k_w1 test_files/test_02_a30k_p20k_w2 test_files/test_02_a30k_p20k_w3

echo ""
echo "------"
echo "test 2 - 2 threads"
time ./energy_storms_omp 2 30000 test_files/test_02_a30k_p20k_w1 test_files/test_02_a30k_p20k_w2 test_files/test_02_a30k_p20k_w3

echo ""
echo "------"
echo "test 7 - seq"
time ./energy_storms_seq 1000000 test_files/test_07_a1M_p5k_w1 test_files/test_07_a1M_p5k_w2 test_files/test_07_a1M_p5k_w3 test_files/test_07_a1M_p5k_w4

echo ""
echo "------"
echo "test 7 - 2 threads"
time ./energy_storms_omp 2 1000000 test_files/test_07_a1M_p5k_w1 test_files/test_07_a1M_p5k_w2 test_files/test_07_a1M_p5k_w3 test_files/test_07_a1M_p5k_w4
