#################### Define Design Constraints #########################
puts "###############################################"
puts "############ Design Constraints ###############"
puts "###############################################"


####################################################################################
           #########################################################
                  #### Section 1 : Clock Definition ####
           #########################################################
#################################################################################### 
# 1. Master Clock Definitions 
# 2. Generated Clock Definitions
# 3. Clock Latencies
# 4. Clock Uncertainties
# 5. Clock Transitions
####################################################################################

############################ REF Clock and ALU Clock ###############################

set CLK_NAME1 REF_CLK
set CLK_PER1 20
set CLK_SETUP_SKEW1 0.2
set CLK_HOLD_SKEW1 0.1
set CLK_LAT1 0
set CLK_RISE1 0.05
set CLK_FALL1 0.05

############################ UART Clock , TX and RX Clock ###########################

set CLK_NAME2 UART_CLK
set CLK_PER2 271.2967987
set CLK_SETUP_SKEW2 0.2
set CLK_HOLD_SKEW2 0.1
set CLK_LAT2 0
set CLK_RISE2 0.05
set CLK_FALL2 0.05
set TX_CLK_PER [expr {$CLK_PER2 * 32}]

################################### Master Clocks #####################################

create_clock -name $CLK_NAME1 -period $CLK_PER1 -waveform "0 [expr {$CLK_PER1/2}]" [get_ports REF_CLK]
set_clock_uncertainty -setup $CLK_SETUP_SKEW1 [get_clocks $CLK_NAME1]
set_clock_uncertainty -hold $CLK_HOLD_SKEW1  [get_clocks $CLK_NAME1]
set_clock_transition -rise $CLK_RISE1  [get_clocks $CLK_NAME1]
set_clock_transition -fall $CLK_FALL1  [get_clocks $CLK_NAME1]
set_clock_latency $CLK_LAT1 [get_clocks $CLK_NAME1]

create_clock -name $CLK_NAME2 -period $CLK_PER2 -waveform "0 [expr {$CLK_PER2/2}]" [get_ports UART_CLK]
set_clock_uncertainty -setup $CLK_SETUP_SKEW2 [get_clocks $CLK_NAME2]
set_clock_uncertainty -hold $CLK_HOLD_SKEW2  [get_clocks $CLK_NAME2]
set_clock_transition -rise $CLK_RISE2  [get_clocks $CLK_NAME2]
set_clock_transition -fall $CLK_FALL2  [get_clocks $CLK_NAME2]
set_clock_latency $CLK_LAT2 [get_clocks $CLK_NAME2]


################################### Generated Clocks ###################################

create_generated_clock -master_clock $CLK_NAME1 -source [get_ports REF_CLK] \
                       -name "ALU_CLK" [get_port B2/clk] \
                       -divide_by 1
set_clock_uncertainty -setup $CLK_SETUP_SKEW1 [get_clocks ALU_CLK]
set_clock_uncertainty -hold $CLK_HOLD_SKEW1  [get_clocks ALU_CLK]
set_clock_transition -rise $CLK_RISE1  [get_clocks ALU_CLK]
set_clock_transition -fall $CLK_FALL1  [get_clocks ALU_CLK]
set_clock_latency $CLK_LAT1 [get_clocks ALU_CLK]


create_generated_clock -master_clock $CLK_NAME2 -source [get_ports UART_CLK] \
                       -name "TX_CLK" [get_port B4/TX_CLK] \
                       -divide_by 32
set_clock_uncertainty -setup $CLK_SETUP_SKEW2 [get_clocks TX_CLK]
set_clock_uncertainty -hold $CLK_HOLD_SKEW2  [get_clocks TX_CLK]
set_clock_transition -rise $CLK_RISE2  [get_clocks TX_CLK]
set_clock_transition -fall $CLK_FALL2  [get_clocks TX_CLK]
set_clock_latency $CLK_LAT2 [get_clocks TX_CLK]


create_generated_clock -master_clock $CLK_NAME2 -source [get_ports UART_CLK] \
                       -name "RX_CLK" [get_port B4/RX_CLK] \
                       -divide_by 1
set_clock_uncertainty -setup $CLK_SETUP_SKEW2 [get_clocks RX_CLK]
set_clock_uncertainty -hold $CLK_HOLD_SKEW2  [get_clocks RX_CLK]
set_clock_transition -rise $CLK_RISE2  [get_clocks RX_CLK]
set_clock_transition -fall $CLK_FALL2  [get_clocks RX_CLK]
set_clock_latency $CLK_LAT2 [get_clocks RX_CLK]
					   
set_dont_touch_network [get_clocks {REF_CLK UART_CLK ALU_CLK TX_CLK RX_CLK}]

####################################################################################
           #########################################################
                  #### Section 2 : Clocks Relationships ####
           #########################################################
####################################################################################

##############################Asynchronous Clocks###################################

set_clock_groups -asynchronous -group [get_clocks "RX_CLK"]     \
                               -group [get_clocks "$CLK_NAME1"] 

set_clock_groups -asynchronous -group [get_clocks "$CLK_NAME1"]     \
                               -group [get_clocks "$CLK_NAME2"] 

####################################################################################
           #########################################################
             #### Section 3 : set input/output delay on ports ####
           #########################################################
####################################################################################

set in1_delay  [expr {0.2 * $CLK_PER1}]          ;# will be used with REF CLK and ALU CLK
set out1_delay [expr {0.2 * $CLK_PER1}]

set in2_delay  [expr {0.2 * $CLK_PER2}]          ;# will be used with UART CLK and RX CLK
set out2_delay [expr {0.2 * $CLK_PER2}]

set in3_delay  [expr {0.2 * $TX_CLK_PER}]        ;# will be used with TX CLK
set out3_delay [expr {0.2 * $TX_CLK_PER}]

# Constrain Input Paths
set_input_delay $in2_delay -clock RX_CLK [get_port RX_IN]

# Constrain Output Paths
set_output_delay $out3_delay -clock TX_CLK [get_port TX_OUT]
set_output_delay $out2_delay -clock RX_CLK [get_port Stop_Error]
set_output_delay $out2_delay -clock RX_CLK [get_port Parity_Error]

####################################################################################
           #########################################################
                  #### Section 4 : Driving cells ####
           #########################################################
####################################################################################

set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [all_inputs]

####################################################################################
           #########################################################
                  #### Section 5 : Output load ####
           #########################################################
####################################################################################

set_load 0.1 [get_port TX_OUT]
set_load 0.1 [get_port Stop_Error]
set_load 0.1 [get_port Parity_Error]

####################################################################################
           #########################################################
                 #### Section 6 : Operating Condition ####
           #########################################################
####################################################################################

# Define the Worst Library for Max(#setup) analysis
# Define the Best Library for Min(hold) analysis

set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"


