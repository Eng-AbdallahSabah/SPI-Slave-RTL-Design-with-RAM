vlib work

vlog Wrapper.v Spi_Slave.v RAM.v tb_Wrapper.v tb_Spi_Slave.v
vsim -voptargs=+acc work.tb_SPI
add wave *
run -all
# quit -sim