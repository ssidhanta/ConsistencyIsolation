#set xlabel "size of session trace" font "Times-Roman,24 left"
set xlabel "size of session trace" font "Times-Roman,28 left"
#unset xtics
set key font "Times-Roman,24” 
set ylabel "Execution Time in milliseconds" font "Times-Roman,28”
set format y "%12.1f";
set xtics ("10K" 1, "20K" 2, "30K" 3, "40K" 4, "50K" 5, "60K" 6, "70K" 7, "80K" 8, "90K" 9, "100K" 10)
set yrange [0:15000]
#set xrange [0:950]
set terminal postscript eps color  font 'Times-Roman,24’
set output 'conspecTPCCvarhist.eps'
set style line 1 lc rgb 'red' lt 1 lw 1
set style line 2 lc rgb 'blue' lt 1 lw 1
set style line 3 lc rgb 'black' lt 1 lw 1
set style line 4 lc rgb 'green' lt 1 lw 1
set style fill solid 1.0 border rgb 'grey30'
#set label '*' at 3,0.8 center
#set label '*' at 4,0.8 center
set border 3
#set xtics nomirror scale 0
plot "varLog.txt" every 30 using (10 * $1):7 with yerr ls 1 t "With ConSpec", '' every 30 using (10 * $1):9 with yerr ls 3 t "With Burkhardt";
#plot "varLog.txt" every 30 using 1:7:xtic(1)  w errorbars ls 1 t "StDev With ConSpec", '' every 30  using 1:8:xtic(1) t "Avg Exec Time With ConSpec" with linespoints pointsize 2, '' every 25 using 1:9 w errorbars ls 3 t "StDev With Burkhardt", '' every 25  using 0:10:xtic(1) t "Avg Exec Time With Burkhardt" with linespoints pointsize 2; 
#plot "varLog.txt"  every 30  using 0:8:xtic(1) w boxes ls 2 t "Avg Exec Time With ConSpec", '' every 30 using 1:9 w errorbars ls 3 t "StDev With Burkhardt", '' every 30  using 0:10:xtic(1) w boxes ls 4 t "Avg Exec Time With Burkhardt"; 
