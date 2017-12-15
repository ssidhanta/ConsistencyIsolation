set xlabel "size of session trace" font "Times-Roman,24 left"
set key font "Times-Roman,24” 
set ylabel "Execution Time in milliseconds" font "Times-Roman,24”
set format y "%12.1f";
set yrange [0:1300]
#set xrange [0:950]
set terminal postscript eps color  font 'Times-Roman,24’
set output 'conspecYCSBvarhist.eps'
set style line 1 lc rgb 'grey30' ps 0 lt 1 lw 2
set style line 2 lc rgb 'grey70' lt 1 lw 2
set style fill solid 1.0 border rgb 'grey30'
set label '*' at 3,0.8 center
set label '*' at 4,0.8 center
set border 3
set xtics nomirror scale 0
plot "varLogYCSB.txt" every 20 using 1:7 w errorbars ls 1 t "Standard Deviation", '' every 20  using 0:8:xtic(1) t "Average Execution Time (ms)" with linespoints pointsize 2; 
#plot "varLogYCSB.txt" every 20 using 1:7 w errorbars ls 1 t "Standard Deviation", '' every 20  using 0:8:xtic(1) w boxes ls 2 t "Average Execution Time (ms)";