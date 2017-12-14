#set title "Execution Time vs Session Trace Size"
set xlabel "size of session trace" font "Times-Roman,20 left"
#set ylabel "Staleness (milliseconds)" font "Times-Roman,24”
set key font "Times-Roman,20” 
set ylabel "Execution Time in milliseconds" font "Times-Roman,20”
#set y2label “size of session trace" font "Times-Roman,20"

#set auto x 
#set auto y 
#set range [0:20]
set yrange [0:1800]
#set xtics offset 1
#set ytics offset -1
#set label 1 "SLA-1: latency 20 staleness 5" at 1,345
#set label 1 "SLA-2: latency 50 staleness 2.5" at 1,343
#set label 1 "SLA-3: latency 100 staleness 1" at 1,343
#set term latex
#set style data histograms
#set style histogram rowstacked
set boxwidth 0.5 relative
#set style fill solid 1.0 border -1
#set terminal postscript eps color  font 'Times-Roman,20’
#set output 'conspecTPCCvarhist.eps'
#set y2range [0:15]
#set y2tics nomirror
#set tics nomirror
#unset tics
#plot 'trainingdataout.csv' every 5 using 1:4 title 'Latency with ALL READ/ALL WRITE' with linespoints pointtype 7  pointsize 2;
#plot "varLog.txt" using 1:2 with points notitle; 
#plot newhistogram "1" lt 1, "varLog.txt" every 30 using 8 t "Average Execution Time with ConSpec Definition (ms)",  '' every 30  using 7:xticlabels(1) t "Variance with ConSpec Definition", newhistogram "2" lt 1, '' every 30 using 10:xticlabels(1) t "Average Execution Time with Burkhardt's Definition (ms)",  '' every 30  using 9:xticlabels(1) t "Variance with Burkhardt's Definition"; #, "" every 30 using 0:($1-0.1):(sprintf("%3.2f",$9)) with labels notitle; 
#plot "varLog.txt" every 30 using 2 t "Execution Time of Run 1 (ms)", '' every 30  using 3:xticlabels(1) t "Execution Time of Run 2 (ms)", '' every 30  using 4:xticlabels(1) t "Execution Time of Run 3 (ms)", '' every 30  using 5:xticlabels(1) t "Execution Time of Run 4 (ms)",  '' every 30  using 6:xticlabels(1) t "Execution Time of Run 5 (ms)",  '' every 30  using 7:xticlabels(1) t "Variance", "" every 30 using 0:($1-0.1):(sprintf("%3.2f",$7)) with labels notitle; 


# set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 600, 400 
set terminal postscript eps color  font 'Times-Roman,20’
set output 'conspecTPCCvarhist.eps'
set border 3 front lt black linewidth 1.000 dashtype solid
set boxwidth 0.8 absolute
set style fill   solid 1.00 noborder
set style histogram rowstacked title textcolor lt -1 offset character 2, 0.25
set style data histograms
set xtics border in scale 0,0 nomirror rotate by -45  autojustify
set xtics  norangelimit  font ",20"
set xtics   ()
set xlabel  offset character 0, -2, 0 font "" textcolor lt -1 norotate
set ytics border in scale 0,0 mirror norotate  autojustify
set ytics  norangelimit autofreq  font ",20"
set ztics border in scale 0,0 nomirror norotate  autojustify
plot newhistogram "With ConSpec Definition" lt 1, "varLog.txt" every 30 using 8 t "Average Execution Time (ms)",  '' every 30  using 7:xticlabels(1) t "Standard Deviation with ConSpec Definition", newhistogram "With Burkhardt's Definition" lt 1, '' every 30 using 10:xticlabels(1) t "Average Execution Time (ms)" linecolor rgb "#cc0000",  '' every 30  using 9:xticlabels(1) t "Standard Deviation with Burkhardt's Definition" linecolor rgb "#ff0000"; 