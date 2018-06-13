----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:58:28 05/28/2018 
-- Design Name: 
-- Module Name:    PROCESSOR - Behavioral 
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

entity PROCESSOR is
    Port ( instr : in  STD_LOGIC_VECTOR (31 downto 0);
           insa : out  STD_LOGIC_VECTOR (15 downto 0);
           CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           data_di : in  STD_LOGIC_VECTOR (15 downto 0);
           data_we : out  STD_LOGIC;
           data_a : out  STD_LOGIC_VECTOR (15 downto 0);
           data_do : out  STD_LOGIC_VECTOR (15 downto 0));
end PROCESSOR;


architecture Behavioral of PROCESSOR is

									--LE PIPE-----------------------------------------

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

	type stage is record 
		op : std_logic_vector (3 downto 0);
		a, b, c : std_logic_vector (15 downto 0);
	end record;

	signal LI : stage ;
	signal Di : stage ;
	signal EX : stage ;
	signal Mem : stage ; 
	signal RE : stage ; 



									--LE UAL-----------------------------------------

	 COMPONENT UAL
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         op : IN  std_logic_vector(3 downto 0);
         S : OUT  std_logic_vector(15 downto 0);
         flags : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
	                                                         
   --Inputs
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal op : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal S : std_logic_vector(15 downto 0);
   signal flags : std_logic_vector(3 downto 0);
	
									--LE BANC-----------------------------------------
    
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
	


 	--Outputs
   signal QA : std_logic_vector(15 downto 0);
   signal QB : std_logic_vector(15 downto 0);
	
													-- DECODEUR-----------------------------------
	
	    COMPONENT DECOD
    PORT(
         instr : IN  std_logic_vector(31 downto 0);
         A : OUT  std_logic_vector(15 downto 0);
         OP : OUT  std_logic_vector(3 downto 0);
         B : OUT  std_logic_vector(15 downto 0);
         C : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
	 
													-- RAM-----------------------------------
	 
	component bram16
  generic (
    init_file : String := "none";
    adr_width : Integer := 11);
  port (
	  -- System
	  sys_clk : in std_logic;
	  sys_rst : in std_logic;
	  -- Master
	  di : out std_logic_vector(15 downto 0);
	  we : in std_logic;
	  a : in std_logic_vector(15 downto 0);
	  do : in std_logic_vector(15 downto 0));
	end component;



	component bram32
	  
	  port (
	  -- System
	  sys_clk : in std_logic;
	  sys_rst : in std_logic;
	  -- Master
	  di : out std_logic_vector(31 downto 0);
	  we : in std_logic;
	  a : in std_logic_vector(15 downto 0);
	  do : in std_logic_vector(31 downto 0));
	end component;

	 
	 
	 
	 --NOS PETITS SIGNAUX
	 
	signal multiplux : STD_LOGIC_VECTOR (15 downto 0);
	signal DI_QB : STD_LOGIC_VECTOR (15 downto 0);
	signal EX_S : STD_LOGIC_VECTOR (15 downto 0);
	signal data_banco : STD_LOGIC_VECTOR (15 downto 0);
	signal data_dout : STD_LOGIC_VECTOR (15 downto 0);
	signal data_din : STD_LOGIC_VECTOR (15 downto 0);
	signal data_aa : STD_LOGIC_VECTOR (15 downto 0);
	signal data_wee : STD_LOGIC;	
	signal instruction : STD_LOGIC_VECTOR (31 downto 0);
	signal rom_we : STD_LOGIC;
	signal rom_a : STD_LOGIC_VECTOR (15 downto 0) := x"0000";
	signal rom_do : STD_LOGIC_VECTOR (31 downto 0);
	signal flagsortie : STD_LOGIC_VECTOR (15 downto 0);
	
    

begin

 
 
 									--LE PIPE-----------------------------------------
	
	LI_DI : PIPE PORT MAP (
          OP_out => DI.op,
          A_out => DI.a,
          B_out => DI.b,
          C_out => DI.c,
          OP_in => LI.op,
          A_in => LI.a,
          B_in => LI.b,
          C_in => LI.c,
          CK => CLK
        );
		  
--(cop, arith, store) et(afc ou cop ou arith ou load) et (    B=A normalement   qd arith :B ou C = A) 
--if (LI.op=x"5" OR LI.op=x"1" OR LI.op=x"2" OR LI.op=x"3" OR LI.op=x"4" OR LI.op=x"7") AND 
	-- (DI.op=x"6" OR DI.op=x"5" OR DI.op=x"1" OR DI.op=x"2" OR DI.op=x"3" OR DI.op=x"4") AND
	--  (LI.b = LI.a
		  
multiplux <= DI.b when DI.op=x"6" OR DI.op=x"7" else
				 QA;
DI_QB <= QB ;
		  
	DI_EX : PIPE PORT MAP (
          OP_in => DI.op,
          A_in => DI.a,
          B_in => multiplux,
          C_in => DI_QB,
          OP_out => EX.op,
          A_out => EX.a,
          B_out => EX.b,
          C_out => EX.c,
          CK => CLK
        );
		  
	EX_S <=  EX.b when (EX.op=x"6" OR EX.op=x"5" OR EX.op=x"7" OR EX.op=x"8") else
			  S;
	flagsortie <= x"000"&flags;
		  
	EX_Mem : PIPE PORT MAP (
          OP_out => Mem.op,
          A_out => Mem.a,
          B_out => Mem.b,
          C_out => Mem.c,
          OP_in => EX.op,
          A_in => EX.a,
          B_in => EX_S,
          C_in => flagsortie,
          CK => CLK
        );
		  
   Mem_RE : PIPE PORT MAP (
		 OP_out => RE.op,
		 A_out => RE.a,
		 B_out => RE.b,
		 C_out => RE.c,
		 OP_in => Mem.op,
		 A_in => Mem.a,
		 B_in => Mem.b,
		 C_in => Mem.c,
		 CK => CLK
	  );
	  
 
W_pin <= '1' when (RE.op = x"6" OR RE.op = x"5" OR RE.op = x"1" OR RE.op = x"2" OR RE.op = x"3" OR RE.op = x"4" OR RE.op = x"7" ) else
					'0' ;
W <= RE.a(3 downto 0);

--data_a <= RE.b;

A_in <= DI.b(3 downto 0);
B_in <= DI.c(3 downto 0);

data_banco <= data_din when re.op=x"7" OR re.op=x"8" else
					RE.b;

	  Banco_de_registro: BANC PORT MAP (
		 A_in => A_in,
		 B_in => B_in,
		 QA => QA,
		 QB => QB,
		 W => W,
		 W_pin => W_pin,
		 DATA => data_banco,
		 RST => RST,
		 CLK => CLK
	  );
	  
	  
	 
  ALU : UAL PORT MAP(
			A => EX.b,
			B => EX.c,
			op => EX.op,
			S => S,
			flags=>flags
	  );
	  
	  
	  EL_DECODER: DECOD PORT MAP (
          instr => instruction,
          A => LI.a,
          OP => LI.op,
          B => LI.b,
          C => LI.c
        );
		  
data_wee <= '1' when Mem.op=x"8" else
			'0';
data_aa <= Mem.b(14 downto 0) & '0' when Mem.op=x"7" else
			Mem.a(14 downto 0) & '0';
data_dout <= Mem.b;
		  --attention au reset
	  RAMES: bram16 PORT MAP (
		  sys_clk => CLK,
		  sys_rst => RST,
		  di => data_din,
		  we => data_wee,
		  a => data_aa,
		  do => data_dout
	  );
	  
rom_we <= '0';

	  
	  ROMES: bram32 PORT MAP (
		  sys_clk => CLK,
		  sys_rst => RST,
		  di => instruction,
		  we => rom_we,
		  a => rom_a,
		  do => rom_do
	  );

process 
begin

wait until CLK'event and CLK='1';
rom_a <= (rom_a + x"0001") ;


end process;

end Behavioral;

