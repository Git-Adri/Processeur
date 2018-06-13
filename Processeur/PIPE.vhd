----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:36:23 05/18/2018 
-- Design Name: 
-- Module Name:    PIPE - Behavioral 
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

entity PIPE is
    Port ( OP_out : out  STD_LOGIC_VECTOR (3 downto 0);
           A_out : out  STD_LOGIC_VECTOR (15 downto 0);
           B_out : out  STD_LOGIC_VECTOR (15 downto 0);
           C_out : out  STD_LOGIC_VECTOR (15 downto 0);
           OP_in : in  STD_LOGIC_VECTOR (3 downto 0);
           A_in : in  STD_LOGIC_VECTOR (15 downto 0);
           B_in : in  STD_LOGIC_VECTOR (15 downto 0);
           C_in : in  STD_LOGIC_VECTOR (15 downto 0);
			  CK : in  STD_LOGIC);
end PIPE;

architecture Behavioral of PIPE is

begin

	process	
	
		begin
		
		wait until CK'event and CK='1' ;
		OP_out <= OP_in ;
		A_out <= A_in ;
		B_out <= B_in ;
		C_out <= C_in ;
		
	end process;
		


end Behavioral;

