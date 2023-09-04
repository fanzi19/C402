set terminal pngcairo enhanced font "arial,12" size 800,600
set output "histogram.png"

set style data histograms
set style fill solid border lc rgb "blue"
set xlabel "Memory Address (Decimal)"
set ylabel "Frequency"
set title "Memory Address Distribution Histogram"

plot 'processed_data.txt' using 1:xtic(2) with histogram title "Data Distribution"
