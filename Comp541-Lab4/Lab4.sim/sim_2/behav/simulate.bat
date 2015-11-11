@echo off
set xv_path=D:\\Vivado\\Vivado\\2014.4\\bin
call %xv_path%/xsim CounterMod7_test_behav -key {Behavioral:sim_2:Functional:CounterMod7_test} -tclbatch CounterMod7_test.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
