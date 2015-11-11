@echo off
set xv_path=D:\\Vivado\\Vivado\\2014.4\\bin
call %xv_path%/xelab  -wto 08f6b459325e46139d43a468e76ddd77 -m64 --debug typical --relax -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot ALU_test_behav xil_defaultlib.ALU_test xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
