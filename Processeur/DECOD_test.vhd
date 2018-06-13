--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:36:24 05/28/2018
-- Design Name:   
-- Module Name:   /home/tena/4IR/S2/Syst_Info/Processeur/b2497/DECOD_test.vhd
-- Project Name:  b2497
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DECOD
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY DECOD_test IS
END DECOD_test;
 
ARCHITECTURE behavior OF DECOD_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DECOD
    PORT(
         instr : IN  std_logic_vector(31 downto 0);
         A : OUT  std_logic_vector(15 downto 0);
         OP : OUT  std_logic_vector(3 downto 0);
         B : OUT  std_logic_vector(15 downto 0);
         C : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal instr : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal A : std_logic_vector(15 downto 0);
   signal OP : std_logic_vector(3 downto 0);
   signal B : std_logic_vector(15 downto 0);
   signal C : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DECOD PORT MAP (
          instr => instr,
          A => A,
          OP => OP,
          B => B,
          C => C
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		instr <= x"0701ABAB" ;
		
		wait for 100 ns ;
		
		instr <= x"01010904" ;

      -- insert stimulus here 

      wait;
   end process;

END;
