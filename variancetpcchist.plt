#set title "Execution Time vs Session Trace Size"
#set xlabel "size of session trace" font "Times-Roman,24 left"
#set ylabel "Staleness (milliseconds)" font "Times-Roman,24”
set key font "Times-Roman,24” 
#set ylabel "Latency in milliseconds" font "Times-Roman,24”
#set y2label “size of session trace" font "Times-Roman,20"

#set auto x 
#set auto y 
#set range [0:20]
set yrange [0:6000]
#set xtics offset 1
#set ytics offset -1
#set label 1 "SLA-1: latency 20 staleness 5" at 1,345
#set label 1 "SLA-2: latency 50 staleness 2.5" at 1,343
#set label 1 "SLA-3: latency 100 staleness 1" at 1,343
#set term latex
set style data histograms
set style histogram rowstacked
set boxwidth 1 relative
set style fill solid 1.0 border -1
set terminal postscript eps color  font 'Times-Roman,24’
set output 'conspecTPCCvarhist.eps'
#set y2range [0:15]
#set y2tics nomirror
#set tics nomirror
#unset xtics
#plot 'trainingdataout.csv' every 5 using 1:4 title 'Latency with ALL READ/ALL WRITE' with linespoints pointtype 7  pointsize 2;
#plot "varLog.txt" using 1:2 with points notitle; 
plot "varLog.txt" every 30 using 2 t "Execution Time of Run 1 (ms)", '' every 30  using 3:xticlabels(1) t "Execution Time of Run 2 (ms)", '' every 30  using 4:xticlabels(1) t "Execution Time of Run 3 (ms)", '' every 30  using 5:xticlabels(1) t "Execution Time of Run 4 (ms)",  '' every 30  using 6:xticlabels(1) t "Execution Time of Run 5 (ms)",  '' every 30  using 7:xticlabels(1) t "Variance"; 