
###################################################################
########################### Variables #############################
###################################################################

set SSLIB "/home/IC/Ass/Final_System/std_cells/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/IC/Ass/Final_System/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/IC/Ass/Final_System/std_cells/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

###################################################################
############################ Guidance #############################
###################################################################

# Synopsys setup variable
set synopsys_auto_setup true
# Formality Setup File
set_svf "/home/IC/Ass/Final_System/syn/SYSTEM_TOP.svf"

###################################################################
###################### Reference Container ########################
###################################################################

# Read Reference Design Verilog Files
read_verilog -container r [glob /home/IC/Ass/Final_System/rtl/*.v]

# Read Reference technology libraries
read_db -container r [glob /home/IC/Ass/Final_System/std_cells/*.db]

# set the top Reference Design 
set_reference_design SYSTEM_TOP
set_top SYSTEM_TOP


###################################################################
#################### Implementation Container #####################
###################################################################

# Read Implementation Design Files
read_verilog -netlist -container i "/home/IC/Ass/Final_System/syn/SYSTEM_TOP.v"

# Read Implementation technology libraries
read_db -container i [glob /home/IC/Ass/Final_System/std_cells/*.db]

# set the top Implementation Design
set_implementation_design SYSTEM_TOP
set_top SYSTEM_TOP


###################### Matching Compare points ####################
match


######################### Run Verification ########################


set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}

########################### Reporting ############################# 
report_passing_points > "passing_points.rpt"
report_failing_points > "failing_points.rpt"
report_aborted_points > "aborted_points.rpt"
report_unverified_points > "unverified_points.rpt"
report_loops > "loops.rpt"

start_gui


