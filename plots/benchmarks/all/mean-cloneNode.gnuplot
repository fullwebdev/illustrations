working_directory = system("dirname ".ARG0)."/"
data_file = working_directory."data.csv"
output_file = working_directory."mean-cloneNode.png"
set output output_file

set term png size 1024,550 font 'Liberation Sans,16'

set style fill solid
set boxwidth 0.7
set yrange [1:1.03]
set ylabel "Note moyenne"
unset key
set datafile separator ","

set linetype 1 lc rgb "gray50"
set linetype 2 lc rgb "gray50"
set linetype 3 lc rgb "gray50"
set linetype cycle 2

set xtics rotate by 45 right

plot '<(egrep "^(VanillaJS|VanillaJS \(DX\)|VanillaJS \(createElement \+ cloneNode\))," '.data_file.')' \
  using 0:13:($0+1):xtic(1) with boxes lc variable
