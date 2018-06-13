--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:26:55 05/18/2018
-- Design Name:   
-- Module Name:   /home/tena/4IR/S2/Syst_Info/Processeur/b2497/BANC_test.vhd
-- Project Name:  b2497
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BANC
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
 
ENTITY BANC_test IS
END BANC_test;
 
ARCHITECTURE behavior OF BANC_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BANC
    PORT(
         A_in : IN  std_logic_vector(3 downto 0);
         B_in : IN  std_logic_vector(3 downto 0);
         QA : OUT  std_logic_vector(15 downto 0);
         QB : OUT  std_logic_vector(15 downto 0);
         W : IN  std_logic_vector(3 downto 0);
         W_pin : IN  std_logic;
         DATA : IN  std_logic_vector(15 downto 0);
         RST : IN  std_logic;
         CLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A_in : std_logic_vector(3 downto 0) := (others => '0');
   signal B_in : std_logic_vector(3 downto 0) := (others => '0');
   signal W : std_logic_vector(3 downto 0) := (others => '0');
   signal W_pin : std_logic := '0';
   signal DATA : std_logic_vector(15 downto 0) := (others => '0');
   signal RST : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal QA : std_logic_vector(15 downto 0);
   signal QB : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BANC PORT MAP (
          A_in => A_in,
          B_in => B_in,
          QA => QA,
          QB => QB,
          W => W,
          W_pin => W_pin,
          DATA => DATA,
          RST => RST,
          CLK => CLK
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
		
		
		wait for 100 ns ;
		RST<='1';
		
		
		wait for 100 ns ;
		W_pin<='1';
		DATA <= x"FEFE";
		W<=x"1";
		
		wait for 100 ns;
		DATA<= x"B1B1";
		w<=x"2";
		
		wait for 100 ns;
		W_pin<='0';
		A_in<=x"1";
		
		wait for 100 ns;
		B_in<=x"2";
		
		

		
		wait for 10 ns;	

		
      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
