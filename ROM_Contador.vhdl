-- Codigo ROM modificado para el primer contador
-- ***********************************************
-- **  PROYECTO PDUA                            **
-- **  Modulo: 	ROM                           **
-- **  Creacion:	Julio 07								**
-- **  Revisi�:	Marzo 08								**
-- **  Por:		   MGH-CMUA-UNIANDES 				**
-- ***********************************************
-- Descripcion:
-- ROM (Solo lectura)
--                      cs  
--                  _____|_
--           rd -->|       |
--          dir -->|       |--> data
--                 |_______|   
--        
-- ***********************************************

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ROM is
    Port ( cs,rd	: in std_logic;
           dir 	: in std_logic_vector(4 downto 0);
           data 	: out std_logic_vector(7 downto 0));
end ROM;

architecture Behavioral of ROM is

begin
process(cs,rd,dir)
begin
if cs = '1' and rd = '0' then
       case dir is
	    when "00000" => data <= "01010000";  -- JMP MAIN
	    when "00001" => data <= "00000010";  -- MAIN
		 
		 when "00010" => data <= "00011000";  -- MAIN: MOV ACC,CTE
	    when "00011" => data <= "00000001";  -- CTE (0x01)
		 when "00100" => data <= "00010000";  -- MOV A,ACC
		 
	    when "00101" => data <= "00011000";  -- MOV ACC,CTE
	    when "00110" => data <= "11110110";  -- CTE (0xF6)
	    when "00111" => data <= "01001000";  -- ASCEN: ADD ACC,A
	    when "01000" => data <= "01101000";  -- JC I 	 
		 when "01001" => data <= "00001100";  -- I
		 when "01010" => data <= "01010000";  -- JMP ASCEN
		 when "01011" => data <= "00000111";  -- ASCEN
		 
		 when "01100" => data <= "00011000";  -- I: MOV ACC,CTE
		 when "01101" => data <= "11111111";  -- CTE (0xFF)
	    when "01110" => data <= "00010000";  -- MOV A,ACC
		 
		 when "01111" => data <= "00011000";  -- MOV ACC,CTE
	    when "10000" => data <= "00001010";  -- CTE (0x0A)
	    when "10001" => data <= "01001000";  -- DESC: ADD ACC,A
	    when "10010" => data <= "01011000";  -- JZ MAIN
	    when "10011" => data <= "00000010";  -- MAIN
		 when "10100" => data <= "01010000";  -- JMP DESC
	    when "10101" => data <= "00010001";  -- DESC 
	    --when "10110" => data <= "00000000";  -- 
	    --when "10111" => data <= "00000000";  -- 
	    --when "11000" => data <= "00000000";  -- 
		 --when "11001" => data <= "00000000";  -- 	 
		 --when "11010" => data <= "00000000";  -- 
		 --when "11011" => data <= "00000000";  -- 
		 --when "11100" => data <= "00000000";  -- 
		 --when "11101" => data <= "00000000";  -- 
	    --when "11110" => data <= "00000000";  -- 
		 --when "11111" => data <= "00000000";  --	 
		 
		 when others => data <= (others => 'X'); 
       end case;
else data <= (others => 'Z');
end if;  
end process;
end;