--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:59:54 06/01/2018
-- Design Name:   
-- Module Name:   /home/tena/4IR/S2/Syst_Info/Processeur/b2497/PROCESSOR_test.vhd
-- Project Name:  b2497
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PROCESSOR
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
 
ENTITY PROCESSOR_test IS
END PROCESSOR_test;
 
ARCHITECTURE behavior OF PROCESSOR_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PROCESSOR
    PORT(
         instr : IN  std_logic_vector(31 downto 0);
         insa : OUT  std_logic_vector(15 downto 0);
         CLK : IN  std_logic;
         RST : IN  std_logic;
         data_di : IN  std_logic_vector(15 downto 0);
         data_we : OUT  std_logic;
         data_a : OUT  std_logic_vector(15 downto 0);
         data_do : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal instr : std_logic_vector(31 downto 0) := (others => '0');
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal data_di : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal insa : std_logic_vector(15 downto 0);
   signal data_we : std_logic;
   signal data_a : std_logic_vector(15 downto 0);
   signal data_do : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN


 
	-- Instantiate the Unit Under Test (UUT)
   uut: PROCESSOR PORT MAP (
          instr => instr,
          insa => insa,
          CLK => CLK,
          RST => RST,
          data_di => data_di,
          data_we => data_we,
          data_a => data_a,
          data_do => data_do
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	

		RST <= '1' ;
	--	instr <= x"06010004";
		wait for CLK_period ;
		
	--	instr <= x"06030003";
		wait for CLK_period ;
	--	instr <= x"06040004";
		wait for CLK_period ;
	--	instr <= x"06050005";
		wait for CLK_period ;
		
	--	instr <= x"05020100";
		wait for CLK_period ;
		
		wait for CLK_period*4 ;
		
	--	instr <= x"02060102";
		wait for CLK_period*4 ;
		
	--	instr <= x"08000704";
		wait for CLK_period*16 ;
		
	--	instr <= x"07070007";
		
		--instr <= x"00000000";
      wait for CLK_period*10;

		
		
		

      -- insert stimulus here 

      wait;
   end process;

END;
