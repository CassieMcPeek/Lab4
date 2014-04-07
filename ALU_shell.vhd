-------------------------------------------------------------------------------
--
-- Title       : ALU
-- Design      : ALU
-- Author      : usafa
-- Company     : usafa
--
-------------------------------------------------------------------------------
--
-- File        : ALU.vhd
-- Generated   : Fri Mar 30 11:16:54 2007
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {ALU} architecture {ALU}}

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
	 port(
		 OpSel : in STD_LOGIC_VECTOR(2 downto 0);
		 Data : in STD_LOGIC_VECTOR(3 downto 0);
		 Accumulator : in STD_LOGIC_VECTOR(3 downto 0);
		 Result : out STD_LOGIC_VECTOR(3 downto 0)
	     );
end ALU;

--}} End of automatically maintained section

architecture ALU of ALU is	   


begin
	
-- fill in details to create result as a function of Data and Accumulator, based on OpSel.
 -- e.g : Build a multiplexer choosing between the eight ALU operations.  Either use a case statement (and thus a process)
 --       or a conditional signal assignment statement ( x <= Y when <condition> else . . .)
 -- ALU Operations are defined as:
 -- OpSel : Function
--  0     : AND
--  1     : NEG (2s complement)
--  2     : NOT (invert)
--  3     : ROR
--  4     : OR
--  5     : IN
--  6     : ADD
--  7     : LD
aluswitch: process (Accumulator, Data, OpSel)
        begin
		-- enter your if/then/else or case statements here
		
		case opsel is
		
		-- AND acc and data
		
			when "000" =>
				Result (0) <= accumulator (0) and data (0);
				Result (1) <= accumulator (1) and data (1);
				Result (2) <= accumulator (2) and data (2);
				Result (3) <= accumulator (3) and data (3);
				
		-- NEG = 2's compliment
		-- only acc
		
			when "001" => 
				Result <= not accumulator + "0001";
				
		-- NOT -1s compliment
		--only acc
			
			when "010" =>
				Result <= not accumulator;
				
		--ROR
		-- only acc
		
			when "011" =>
				Result (0) <= accumulator (1);
				Result (1) <= accumulator (2);
				Result (2) <= accumulator (3);
				Result (3) <= accumulator (0);
				
		-- OR 
		-- acc and data
		
			when "100" => 
				Result (0) <= accumulator (0) or data (0);
				Result (1) <= accumulator (1) or data (1);
				Result (2) <= accumulator (2) or data (2);
				Result (3) <= accumulator (3) or data (3);
				
		-- IN
		-- data only
		
			when "101" =>
				Result <= data;
				
		-- ADD 
		-- acc and data
		
			when "110" =>
				Result <= data + accumulator;
				
		-- LDA
		-- data only
		
			when "111" =>
				Result <= data;
				
			when others =>
				Result <= data;
				
			end case opsel;
		end process;

-- OR, enter your conditional signal statement here

end ALU;

