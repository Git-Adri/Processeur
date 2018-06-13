----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:43:19 05/03/2018 
-- Design Name: 
-- Module Name:    UAL - Behavioral 
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UAL is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           op : in  STD_LOGIC_VECTOR (3 downto 0);
           S : out  STD_LOGIC_VECTOR (15 downto 0);
           flags : out  STD_LOGIC_VECTOR (3 downto 0));
end UAL;

architecture Behavioral of UAL is
	signal S_add : STD_LOGIC_VECTOR (16 downto 0);
	signal S_sub : STD_LOGIC_VECTOR (15 downto 0);
	signal S_mul : STD_LOGIC_VECTOR (31 downto 0);
	signal over_mul : STD_LOGIC ; 
	signal zero_mul : STD_LOGIC ; 
	signal zero_add : STD_LOGIC ; 
	signal carry_add : STD_LOGIC ; 
	signal over_add : STD_LOGIC ; 
	signal neg_sub : STD_LOGIC ; 
	signal zero_sub : STD_LOGIC ; 
	signal egal : STD_LOGIC ; 
	signal sup : STD_LOGIC ; 
	signal sup_egal : STD_LOGIC ; 
	signal inf : STD_LOGIC ; 
	signal inf_egal : STD_LOGIC ; 
	signal Z : STD_LOGIC ; 
	
	-- flag neg      --> (3) 8
	-- flag overflow --> (2) 4
	-- flag zero     --> (1) 2
	-- flag carry    --> (0) 1 (c'est la retenue !) 
	
	
	-- on fait un case pour l op // il faut faire un element "reg" qui prend seulement les flags dont on a besoin en fonction de l'operation qu'on effectue. 
	-- Prenons l'exemple d'une multiplication on prend le overflow et cetera
	
begin

	S_add <= (('0'&A)+('0'&B)) ;
	
	S_sub <= A-B 
		when (A >= B) else
				B-A ;
				
	S_mul <= A*B ;
	

	S<= S_add(15 downto 0)
		when op=x"1" else
		S_sub 
		when op=x"3" else
		S_mul (15 downto 0)
		when op=x"2" else
		x"0"
		when op=x"9" else
		x"0"
		when op=x"A" else
		x"0"
		when op=x"B" else
		x"0"
		when op=x"C" else
		x"0"
		when op=x"D" ;
		

	Z <= '0' ;
		
	over_mul <= '1' when S_mul(31 downto 16)>x"0" else
					'0' ;
					
	zero_mul <= '1' when (A=x"0" OR B=x"0") else
					'0' ;
					
	over_add <= S_add(16) ;
	
	zero_add <= '1' when (A=x"0" AND B=x"0") else
					'0'  ;

	carry_add <= over_add ; 

	zero_sub <= '1' when (A=B) else
					'0'  ;
	
	neg_sub <= '1' when (A < B) else
					'0'  ;
	
	egal <= '1' when (A=B) else
					'0'  ;
	
	inf <= '1' when (A<B) else
					'0'  ;
					
	inf_egal <= '1' when (egal='1' OR inf='1') else
					'0'  ;
					
	sup_egal <= '1' when (egal='1' OR sup='1') else
					'0'  ;
	
	sup <= '1' when (A>B) else
					'0'  ;
	

-- pour les operations egal inf et tout, on attribue des val au flags    
		-- egal --> flags= 1 (0001) 
		-- inf --> flags = 2 (0010)
		-- sup --> flags = 4 (0100)
		
		--inferieur ou egal on regardera flag(egal | inf ) flags=1 ou 2  NON NON NON a cause de joseph !! on fait plutot inf egal raise le flags a 1 et sup egal aussi
		--sup ou egal flags = 1 ou 4
		
		
		-- neg   over   zero   carry
			
	flags <= '0' & over_add & zero_add & carry_add
				when op=x"0" else
				'0' & over_mul & zero_mul & '0'
				when op=x"2" else
				neg_sub & '0' & zero_sub & '0'
				when op=x"3" else
				'0' & '0' & '0' & egal
				when op=x"9" else
				'0' & '0' & inf & '0'
				when op=x"A" else
				'0' & '0' & '0' & inf_egal
				when op=x"B" else
				'0' & sup & '0' & '0'
				when op=x"C" else
				'0' & '0' & '0' & sup_egal
				when op=x"D" ;

					

end Behavioral;

