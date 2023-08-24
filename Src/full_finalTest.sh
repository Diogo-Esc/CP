#!/bin/sh

clear

make clean

make all

#echo "Running TESTS"

PROG="./energy_storms_omp"  ## Nome do programa que vai ser chamado

# Main cicle

for TF in 02 06 07 08 10 11 #01 03 04 05 09

do

	#echo ""

	echo "Test:          " $TF

	FILES=$(ls  test_files/test_${TF}* | xargs -n1 | sort -t"_" -k6)

	#echo "Files to test: " $FILES

	F3=$(echo ${FILES} | cut -d"/" -f2 | cut -d"_" -f3)

	#echo "Flag:          " $F3

	case $F3 in 
		"a35") PAR=35;;

		"a30k") PAR=30000;;

		"a20") PAR=20;;

		"a1M") PAR=1000000;;

		"a100M") PAR=100000000;;

		#"a200M") PAR=200000000;;

		"a16-17") PAR=17;;

	esac

	#echo "Running:       " $PROG $PAR $FILES

	for i in $(seq 1 2) 
		do
			echo "i: " $i "th: 1"
			./energy_storms_seq $PAR $FILES
		done

	THREADS="2 4 8 16 32"
	#NRUNS="5"
	for TH in $THREADS
	do
		for i in $(seq 1 2) 
		do
			echo "i: " $i "th: " $TH
			$PROG $TH $PAR $FILES
		done
	done #| tee output_file.csv
	
	#$PROG 2 $PAR $FILES

done | tee testOut