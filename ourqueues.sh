#!/bin/bash
echo Sergio
squeue -u shernand -o "%.10A %.12j %.8a %.10u %.4D %.5C %.11m %.6t %.12r %.20S %.20N" -S S
echo Nicola
squeue -u nsbarchi -o "%.10A %.12j %.8a %.10u %.4D %.5C %.11m %.6t %.12r %.20S %.20N" -S S
