----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:11:48 05/28/2018 
-- Design Name: 
-- Module Name:    DECOD - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DECOD is
    Port ( instr : in  STD_LOGIC_VECTOR (31 downto 0);
           A : out  STD_LOGIC_VECTOR (15 downto 0);
           OP : out  STD_LOGIC_VECTOR (3  downto 0);
           B : out  STD_LOGIC_VECTOR (15 downto 0);
           C : out  STD_LOGIC_VECTOR (15 downto 0));
end DECOD;

architecture Behavioral of DECOD is

begin

	OP <= instr(27 downto 24) ;
	
	A <= instr(23 downto 8) 
		when ((instr(31 downto 24) = x"08") OR (instr(31 downto 24) = x"0E"))
		else x"00" & instr(23 downto 16) ;
	
	B <= instr(15 downto 0) 
		when ((instr(31 downto 24) = x"07") OR (instr(31 downto 24) = x"06")) else
		x"00" & instr(7 downto 0) 
		when (instr(31 downto 24) = x"08") else
		x"0000" 
		when (instr(31 downto 24) = x"0E") else 
		x"00" & instr(15 downto 8) ;
	
	C <= x"0000" 
		when ((instr(31 downto 24) = x"07") OR (instr(31 downto 24) = x"06") OR (instr(31 downto 24) = x"08") OR (instr(31 downto 24) = x"0E")) 
		else x"00" & instr(7 downto 0) ;



end Behavioral;

