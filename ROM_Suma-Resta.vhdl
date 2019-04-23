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
           dir 	: in std_logic_vector(5 downto 0);		-- Cambiado
           data 	: out std_logic_vector(7 downto 0));
end ROM;

architecture Behavioral of ROM is

begin
process(cs,rd,dir)
begin
if cs = '1' and rd = '0' then
       case dir is
	    when "000000" => data <= "01010000";  -- JMP MAIN
	    when "000001" => data <= "00000010";  -- MAIN 
		 
		 -- Inicializando
	    when "000010" => data <= "00011000";  -- MOV ACC,CTE 
	    when "000011" => data <= "11100000";  -- CTE (0xE0)
		 when "000100" => data <= "00101000";  -- MOV DPTR, ACC
	    when "000101" => data <= "00011000";  -- MOV ACC,CTE
	    when "000110" => data <= "00000101";  -- CTE(0x05)
	    when "000111" => data <= "00110000";  -- MOV [DPTR], ACC
		 
	    when "001000" => data <= "00011000";  -- MOV ACC, CTE
		 when "001001" => data <= "11100001";  -- CTE (0xE1)
		 when "001010" => data <= "00101000";  -- MOV DPTR, ACC
		 when "001011" => data <= "00011000";  -- MOV ACC,CTE
		 when "001100" => data <= "00000011";  -- CTE(0x03)
		 when "001101" => data <= "00110000";  -- MOV [DPTR], ACC
		 
	    when "001110" => data <= "00011000";  -- MOV ACC,CTE 
		 when "001111" => data <= "11100010";  -- CTE (0xE2)
	    when "010000" => data <= "00101000";  -- MOV DPTR, ACC
	    when "010001" => data <= "00011000";  -- MOV ACC,CTE
	    when "010010" => data <= "00000000";  -- CTE (0x00)
	    when "010011" => data <= "00110000";  -- MOV [DPTR], ACC
		 
		 when "010100" => data <= "00011000";  -- MOV ACC,CTE 
	    when "010101" => data <= "11100011";  -- CTE (0xE3)
	    when "010110" => data <= "00101000";  -- MOV DPTR, ACC
	    when "010111" => data <= "00011000";  -- MOV ACC,CTE
	    when "011000" => data <= "00000000";  -- CTE (0x00)
		 when "011001" => data <= "00110000";  -- MOV [DPTR], ACC
		 
		 when "011010" => data <= "00011000";  -- MOV ACC,CTE 
		 when "011011" => data <= "11100000";  -- CTE (0xE0)
		 when "011100" => data <= "00101000";  -- MOV DPTR, ACC
		 when "011101" => data <= "00100000";  -- MOV ACC, [DPTR]
	    when "011110" => data <= "00010000";  -- MOV A, ACC
		 
		 -- Suma
		 when "011111" => data <= "00011000";  -- MOV ACC,CTE 
		 when "100000" => data <= "11100001";  --	CTE (0xE1)
		 when "100001" => data <= "00101000";  -- MOV DPTR, ACC
		 when "100010" => data <= "00100000";  -- MOV ACC, [DPTR]
		 
		 when "100011" => data <= "01001000";  -- ADD ACC, A
		 when "100100" => data <= "00010000";  -- MOV A, ACC
		 when "100101" => data <= "00011000";  -- MOV ACC,CTE 
		 when "100110" => data <= "11100010";  --	CTE (0xE2)
		 when "100111" => data <= "00101000";  -- MOV DPTR, ACC
		 when "101000" => data <= "00001000";  --	MOV ACC, A
		 when "101001" => data <= "00110000";  -- MOV [DPTR], ACC
		 
		 -- Resta
		 when "101010" => data <= "00011000";  -- MOV ACC,CTE 
		 when "101011" => data <= "11100001";  --	CTE (0xE1)
		 when "101100" => data <= "00101000";  -- MOV DPTR, ACC
		 when "101101" => data <= "00100000";  -- MOV ACC, [DPTR]
		 when "101110" => data <= "00111000";  -- INV ACC
		 when "101111" => data <= "00010000";  -- MOV A, ACC
		 when "110000" => data <= "00011000";  -- MOV ACC,CTE 
		 when "110001" => data <= "00000001";  --	CTE (0x01)
		 when "110010" => data <= "01001000";  -- ADD ACC, A
		 when "110011" => data <= "00010000";  -- MOV A, ACC
		 
		 when "110100" => data <= "00011000";  -- MOV ACC,CTE 
		 when "110101" => data <= "11100000";  --	CTE (0xE0)
		 when "110110" => data <= "00101000";  -- MOV DPTR, ACC
		 when "110111" => data <= "00100000";  -- MOV ACC, [DPTR]
		 
		 when "111000" => data <= "01001000";  -- ADD ACC, A
		 when "111001" => data <= "00010000";  -- MOV A, ACC
		 when "111010" => data <= "00011000";  -- MOV ACC,CTE 
		 when "111011" => data <= "11100011";  -- CTE (0xE3)
		 when "111100" => data <= "00101000";  -- MOV DPTR, ACC
		 when "111101" => data <= "00001000";  --	MOV ACC, A
		 when "111110" => data <= "00110000";  -- MOV [DPTR], ACC
		 --when "111111" => data <= "00000000";  --	
		 when others => data <= (others => 'X'); 
       end case;
else data <= (others => 'Z');
end if;  
end process;
end;