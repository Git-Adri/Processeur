--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:47:25 05/18/2018
-- Design Name:   
-- Module Name:   /home/tena/4IR/S2/Syst_Info/Processeur/b2497/PIPE_test.vhd
-- Project Name:  b2497
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PIPE
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
 
ENTITY PIPE_test IS
END PIPE_test;
 
ARCHITECTURE behavior OF PIPE_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PIPE
    PORT(
         OP_out : OUT  std_logic_vector(3 downto 0);
         A_out : OUT  std_logic_vector(15 downto 0);
         B_out : OUT  std_logic_vector(15 downto 0);
         C_out : OUT  std_logic_vector(15 downto 0);
         OP_in : IN  std_logic_vector(3 downto 0);
         A_in : IN  std_logic_vector(15 downto 0);
         B_in : IN  std_logic_vector(15 downto 0);
         C_in : IN  std_logic_vector(15 downto 0);
         CK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal OP_in : std_logic_vector(3 downto 0) := (others => '0');
   signal A_in : std_logic_vector(15 downto 0) := (others => '0');
   signal B_in : std_logic_vector(15 downto 0) := (others => '0');
   signal C_in : std_logic_vector(15 downto 0) := (others => '0');
   signal CLK : std_logic := '0';

 	--Outputs
   signal OP_out : std_logic_vector(3 downto 0);
   signal A_out : std_logic_vector(15 downto 0);
   signal B_out : std_logic_vector(15 downto 0);
   signal C_out : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace CLK below with 
   -- appropriate port name 
 
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PIPE PORT MAP (
          OP_out => OP_out,
          A_out => A_out,
          B_out => B_out,
          C_out => C_out,
          OP_in => OP_in,
          A_in => A_in,
          B_in => B_in,
          C_in => C_in,
          CK => CLK
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		OP_in <= x"1";
		A_in <= x"EA3F";
		B_in <= x"EEEE";
		C_in <= x"CCCA";
		

      wait for CLK_period*10;
		
		

      -- insert stimulus here 

      wait;
   end process;

END;
