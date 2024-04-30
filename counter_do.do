vlib work
vlog counter.sv tb_counter.sv  +cover
vsim -voptargs=+acc work.top_counter -cover
add wave *
coverage save top_counter.ucdb -onexit
vcover report top_counter.ucdb -details -all -annotate -output report.txt
run -all
quit -sim
vcover report top_counter.ucdb -details -all -annotate -output report.txt