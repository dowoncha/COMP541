@echo off
set xv_path=D:\\Vivado\\Vivado\\2014.4\\bin
call %xv_path%/xelab  -wto acc414cbb1f54868b860be478ef4bbcb -m64 --debug typical --relax -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot CounterMod7_test_behav xil_defaultlib.CounterMod7_test xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
