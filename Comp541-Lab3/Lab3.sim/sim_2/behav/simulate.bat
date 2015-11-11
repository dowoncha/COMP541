@echo off
set xv_path=D:\\Vivado\\Vivado\\2014.4\\bin
call %xv_path%/xsim ALUcomp_test_behav -key {Behavioral:sim_2:Functional:ALUcomp_test} -tclbatch ALUcomp_test.tcl -view E:/Libraries/Documents/GitHub/Comp541Lab3/Lab3/ALUcomp_test_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
