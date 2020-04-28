# Subset Sum Problem

Given a set of non-negative integers, and a value sum, determine if there is a subset of the given set with sum equal to given sum (up to 254).
Example:

Input:  set[](rom 16 x 8) = {3, 34, 4, 12, 5, 2}, sum = 9
Output:  True  //There is a subset (4, 5) with sum 9.
# FSMD
Basic Finite State Machine with Datapath (FSMD) example to determine if there is a subset of the given set with sum equal to given sum.

## Install

These examples use [ModelSim&reg; and Quartus&reg; Prime from Intel FPGA](http://fpgasoftware.intel.com/?edition=lite), [GIT](https://git-scm.com/download/win), [Visual Studio Code](https://code.visualstudio.com/download), make sure they are installed locally on your computer before proceeding.

## Usage

1. Grab a copy of this repository to your computer's local folder (i.e. C:\projects):

    ```sh
    $ cd projects
    $ git clone https://github.com/Salem22/SubsetSumProblem.git
    ```
2. Use Visual Studio Code (VSC) to edit and view the design files:

    ```sh
    $ cd SubsetSumProblem
    $ code .
    ```
    Click on the toplevel.vhd file in the left pane to view its contents.
    
3. From the VSC View menu, choose Terminal, in the VCS Terminal, create a "work" library:

    ```sh
    $ vlib work
    ```
    
4. Compile all the design units:

    ```sh
    $ vcom *.vhd
    ```
    
5. Simulate your design. For example, if n = 6, sum = 9 then y = 1. Set array elements are speciefied in set_rom.vhd:

    ```sh
    $ vsim work.tb
    ```
