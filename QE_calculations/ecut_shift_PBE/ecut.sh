#!/bin/bash

psp_dir=../../PSP_DIR
wrk_dir='.'

for ec in 30 40 50 60 80 100
do


fact=8
ecrho=$((ec*fact))

cat > BT_ec_${ec}.pwi << EOF

&CONTROL
        calculation = 'scf',
	      title = 'cubic BaTiO3 at 7.40 lattice parameter. xc=PBE'
        restart_mode = 'from_scratch',
        iprint = 10,
        prefix = 'bto',
        pseudo_dir = '${psp_dir}'
        outdir = '${wrk_dir}'
        tstress = .TRUE.,
        tprnfor = .TRUE.,
/

&SYSTEM
       ibrav = 1,
       celldm(1) =  7.40 ,
       nat = 5,
       ntyp = 3,
       ecutwfc = ${ec},
       ecutrho = ${ecrho},
       nbnd = 24,
/

&ELECTRONS
        mixing_mode = 'plain',
        mixing_beta = 0.6,
        conv_thr = 1.0D-12,
/

ATOMIC_SPECIES
O   15.99  O.pbe-rrkjus.UPF
Ti  47.88 Ti.pbe-sp-van_ak.UPF
Ba 137.33 Ba.pbe-nsp-van.UPF

ATOMIC_POSITIONS {crystal}
 Ba  0    0    0
 Ti 1/2  1/2  1/2
 O   0   1/2  1/2
 O  1/2   0   1/2
 O  1/2  1/2   0

K_POINTS {automatic}
 6 6 6   1 1 1

EOF

done

