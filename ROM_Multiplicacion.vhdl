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
           dir 	: in std_logic_vector(6 downto 0);		-- Cambiado
           data 	: out std_logic_vector(7 downto 0));
end ROM;

architecture Behavioral of ROM is

begin
process(cs,rd,dir)
begin
if cs = '1' and rd = '0' then
       case dir is
	    when "0000000" => data <= "01010000";  -- JMP MAIN
	    when "0000001" => data <= "00000010";  -- MAIN 
		 
		 -- Inicializando
	    when "0000010" => data <= "00011000";  -- MOV ACC,CTE 
	    when "0000011" => data <= "11100000";  -- CTE (0xE0)
		 when "0000100" => data <= "00101000";  -- MOV DPTR, ACC
	    when "0000101" => data <= "00011000";  -- MOV ACC,CTE
	    when "0000110" => data <= "00000100";  -- CTE(0x04)
	    when "0000111" => data <= "00110000";  -- MOV [DPTR], ACC
		 
	    when "0001000" => data <= "00011000";  -- MOV ACC, CTE
		 when "0001001" => data <= "11100001";  -- CTE (0xE1)
		 when "0001010" => data <= "00101000";  -- MOV DPTR, ACC
		 when "0001011" => data <= "00011000";  -- MOV ACC,CTE 
		 when "0001100" => data <= "00000100";  -- CTE(0x04)
		 when "0001101" => data <= "00110000";  -- MOV [DPTR], ACC
		 
	    when "0001110" => data <= "00011000";  -- MOV ACC,CTE 
		 when "0001111" => data <= "11100010";  -- CTE (0xE2) 
	    when "0010000" => data <= "00101000";  -- MOV DPTR, ACC
	    when "0010001" => data <= "00011000";  -- MOV ACC,CTE 
	    when "0010010" => data <= "00000001";  -- CTE (0x01)
	    when "0010011" => data <= "00110000";  -- MOV [DPTR], ACC
		 
		 when "0010100" => data <= "00011000";  -- MOV ACC,CTE 
	    when "0010101" => data <= "11100011";  -- CTE (0xE3)
	    when "0010110" => data <= "00101000";  -- MOV DPTR, ACC
	    when "0010111" => data <= "00011000";  -- MOV ACC,CTE
	    when "0011000" => data <= "00000000";  -- CTE (0x00)
		 when "0011001" => data <= "00110000";  -- MOV [DPTR], ACC
		 
		 when "0011010" => data <= "00011000";  -- MOV ACC,CTE 
		 when "0011011" => data <= "11100100";  -- CTE (0xE4)
		 when "0011100" => data <= "00101000";  -- MOV DPTR, ACC
		 when "0011101" => data <= "00011000";  -- MOV ACC,CTE		
	    when "0011110" => data <= "11111000";  -- CTE (0xF8)		--248		
		 when "0011111" => data <= "00110000";  -- MOV [DPTR], ACC
		 
		 -- Multiplicación
		 when "0100000" => data <= "00011000";  -- MULT: MOV ACC, CTE
		 when "0100001" => data <= "11100001";  -- CTE (0xE1)
		 when "0100010" => data <= "00101000";  -- MOV DPTR, ACC
		 when "0100011" => data <= "00100000";  -- MOV ACC, [DPTR]
		 when "0100100" => data <= "00010000";  -- MOV A, ACC
		 
		 when "0100101" => data <= "00011000";  -- MOV ACC,CTE 
		 when "0100110" => data <= "11100010";  -- CTE (0xE2)
		 when "0100111" => data <= "00101000";  -- MOV DPTR, ACC
		 when "0101000" => data <= "00100000";  -- MOV ACC, [DPTR]
		 
		 when "0101001" => data <= "01000000";  -- AND ACC, A
		 when "0101010" => data <= "01011000";  -- JZ CERO
		 when "0101011" => data <= "00110111";  -- CERO
		 
		 -- Si es 1
		 when "0101100" => data <= "00011000";  -- MOV ACC,CTE
		 when "0101101" => data <= "11100000";  -- CTE (0xE0)
		 when "0101110" => data <= "00101000";  -- MOV DPTR, ACC
		 when "0101111" => data <= "00100000";  -- MOV ACC, [DPTR]
		 when "0110000" => data <= "00010000";  -- MOV A, ACC
		 
		 when "0110001" => data <= "00011000";  -- MOV ACC,CTE
		 when "0110010" => data <= "11100011";  -- CTE (0xE3)				
		 when "0110011" => data <= "00101000";  -- MOV DPTR, ACC
		 when "0110100" => data <= "00100000";  -- MOV ACC, [DPTR]
		 
		 when "0110101" => data <= "01001000";  -- ADD ACC, A
		 when "0110110" => data <= "00110000";  -- MOV [DPTR], ACC
		 
		 -- Si es 0; salta a esta sección
		 when "0110111" => data <= "00011000";  -- CERO: MOV ACC,CTE
		 when "0111000" => data <= "11100000";  -- CTE (0xE0)
		 when "0111001" => data <= "00101000";  -- MOV DPTR, ACC
		 when "0111010" => data <= "00100000";  -- MOV ACC, [DPTR]
		 when "0111011" => data <= "10001000";  -- SHIFL ACC
		 when "0111100" => data <= "00110000";  -- MOV [DPTR], ACC
		 
		 when "0111101" => data <= "00011000";  -- MOV ACC,CTE
		 when "0111110" => data <= "11100001";  -- CTE (0xE1)
		 when "0111111" => data <= "00101000";  -- MOV DPTR, ACC
		 when "1000000" => data <= "00100000";  -- MOV ACC, [DPTR]
	    when "1000001" => data <= "10000000";  -- SHIFR ACC
		 when "1000010" => data <= "00110000";  -- MOV [DPTR], ACC
		 
		 -- Contador: Cuenta 8 veces
	    when "1000011" => data <= "00011000";  -- MOV ACC,CTE
		 when "1000100" => data <= "00000001";  -- CTE (0x01)
	    when "1000101" => data <= "00010000";  -- MOV A, ACC		; 		A=0x01
	    
		 when "1000110" => data <= "00011000";  -- MOV ACC,CTE
	    when "1000111" => data <= "11100100";  -- CTE (0xE4)
	    when "1001000" => data <= "00101000";  -- MOV DPTR, ACC
		 when "1001001" => data <= "00100000";  -- MOV ACC, [DPTR]
		 
		 when "1001010" => data <= "01001000";  -- ADD ACC, A
		 when "1001011" => data <= "01101000";  -- JC FIN
		 when "1001100" => data <= "01010000";  -- FIN
		 when "1001101" => data <= "00110000";  -- MOV [DPTR], ACC
	    when "1001110" => data <= "01010000";  -- JMP MULT
		 when "1001111" => data <= "00100000";  -- MULT
	    when "1010000" => data <= "01010000";  -- FIN: JMP FIN
	    when "1010001" => data <= "01010000";  -- FIN
		 
--	    when "1010010" => data <= "00000000";  -- CTE (0x00)
--	    when "1010011" => data <= "00110000";  -- MOV [DPTR], ACC
--		 when "1010100" => data <= "00011000";  -- MOV ACC,CTE 
--	    when "1010101" => data <= "11100011";  -- CTE (0xE3)
--	    when "1010110" => data <= "00101000";  -- MOV DPTR, ACC
--	    when "1010111" => data <= "00011000";  -- MOV ACC,CTE
--	    when "1011000" => data <= "00000000";  -- CTE (0x00)
--		 when "1011001" => data <= "00110000";  -- MOV [DPTR], ACC
--		 when "1011010" => data <= "00011000";  -- MOV ACC,CTE 
--		 when "1011011" => data <= "11100000";  -- CTE (0xE0)
--		 when "1011100" => data <= "00101000";  -- MOV DPTR, ACC
--		 when "1011101" => data <= "00100000";  -- MOV ACC, [DPTR]
--	    when "1011110" => data <= "00010000";  -- MOV A, ACC
--		 when "1011111" => data <= "00011000";  -- MOV ACC,CTE 
--		 when "1100000" => data <= "11100001";  --	CTE (0xE1)
--		 when "1100001" => data <= "00101000";  -- MOV DPTR, ACC
--		 when "1100010" => data <= "00100000";  -- MOV ACC, [DPTR]
--		 when "1100011" => data <= "01001000";  -- ADD ACC, A
--		 when "1100100" => data <= "00010000";  -- MOV A, ACC
--		 when "1100101" => data <= "00011000";  -- MOV ACC,CTE 
--		 when "1100110" => data <= "11100010";  --	CTE (0xE2)
--		 when "1100111" => data <= "00101000";  -- MOV DPTR, ACC
--		 when "1101000" => data <= "00001000";  --	MOV ACC, A
--		 when "1101001" => data <= "00110000";  -- MOV [DPTR], ACC
--		 when "1101010" => data <= "00011000";  -- MOV ACC,CTE 
--		 when "1101011" => data <= "11100001";  --	CTE (0xE1)
--		 when "1101100" => data <= "00101000";  -- MOV DPTR, ACC
--		 when "1101101" => data <= "00100000";  -- MOV ACC, [DPTR]
--		 when "1101110" => data <= "00111000";  -- INV ACC
--		 when "1101111" => data <= "00010000";  -- MOV A, ACC
--		 when "1110000" => data <= "00011000";  -- MOV ACC,CTE 
--		 when "1110001" => data <= "00000001";  --	CTE (0x01)
--		 when "1110010" => data <= "01001000";  -- ADD ACC, A
--		 when "1110011" => data <= "00010000";  -- MOV A, ACC
--		 when "1110100" => data <= "00011000";  -- MOV ACC,CTE 
--		 when "1110101" => data <= "11100000";  --	CTE (0xE0)
--		 when "1110110" => data <= "00101000";  -- MOV DPTR, ACC
--		 when "1110111" => data <= "00100000";  -- MOV ACC, [DPTR]
--		 when "1111000" => data <= "01001000";  -- ADD ACC, A
--		 when "1111001" => data <= "00010000";  -- MOV A, ACC
--		 when "1111010" => data <= "00011000";  -- MOV ACC,CTE 
--		 when "1111011" => data <= "11100011";  -- CTE (0xE3)
--		 when "1111100" => data <= "00101000";  -- MOV DPTR, ACC
--		 when "1111101" => data <= "00001000";  --	MOV ACC, A
--		 when "1111110" => data <= "00110000";  -- MOV [DPTR], ACC
--		 when "1111111" => data <= "00000000";  --	
		 
		 when others => data <= (others => 'X'); 
       end case;
else data <= (others => 'Z');
end if;  
end process;
end;