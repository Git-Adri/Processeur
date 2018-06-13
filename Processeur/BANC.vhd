----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:48:58 05/18/2018 
-- Design Name: 
-- Module Name:    BANC - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BANC is
    Port ( A_in : in  STD_LOGIC_VECTOR (3 downto 0);
           B_in : in  STD_LOGIC_VECTOR (3 downto 0);
           QA : out  STD_LOGIC_VECTOR (15 downto 0);
           QB : out  STD_LOGIC_VECTOR (15 downto 0);
           W : in  STD_LOGIC_VECTOR (3 downto 0);
           W_pin : in  STD_LOGIC ;
           DATA : in  STD_LOGIC_VECTOR (15 downto 0);
           RST : in  STD_LOGIC;
			  CLK : in  STD_LOGIC);
end BANC;

architecture Behavioral of BANC is

type registerArray is array(integer range <>) of STD_LOGIC_VECTOR(15 downto 0) ;
signal registers : registerArray(0 to 15) ;

begin

	process	
	
		begin
		
			wait until CLK'event and CLK='1';
		
			if W_pin='1' then registers(to_integer(unsigned(W))) <= DATA; end if;
		
			
			if RST='0' then registers <= (others => (others => '0')); end if;
			
		
	end process ;

	QA <= DATA when (A_in=W) else registers(to_integer(unsigned(A_in))) ;
	QB <= DATA when (B_in=W) else registers(to_integer(unsigned(B_in))) ;

end Behavioral;

