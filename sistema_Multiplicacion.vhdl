-- *******************************************************
-- **                      PDUA                         **
-- **              PROCESADOR DIDACTICO                 **
-- **    Arquitectura y Diseno de Sistemas Digitales    **
-- **            UNIVERSIDAD DE LOS ANDES               **
-- **       CMUA: Centro de Microelectronica            **
-- *******************************************************
-- ** Version  0.0 Junio 2007                           **
-- ** Revision 0.1 Noviembre 2007                       **
-- ** Revision 0.2 Marzo 2008                           **
-- *******************************************************
-- Descripcion:                 
--               ______________________________________
--              |                ______   _____        |
--              |               | ROM  | | RAM |       |
--              |               |______| |_____|       |
--              |    _________                         |
--       CLK -->|-->|         |                        |
--     Rst_n -->|-->|  PDUA   |----------------> D_out | 
--       INT -->|-->|         |<---------------- D_in  |    
--              |   |         |----------------> Dir   |    
--              |   |         |----------------> Ctrl  |  
--              |   |_________|                        |
--              |                                      |
--              |______________________________________|  

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sistema is
    Port ( clk 	: in 	std_logic; -- FPGA's clock
           rst_n 	: in 	std_logic;
           int 	: in 	std_logic;
			  bus_data_out : out	std_logic_vector(7 downto 0));
			  -- Señales analizador
			  --clk_Ana	:	OUT	STD_LOGIC;
			  --rst_n_Ana	:	OUT	STD_LOGIC;
			  --int_Ana	:	OUT	STD_LOGIC;
			  --DIR			:	OUT	STD_LOGIC_Vector(4 DOWNTO 0);
			  --ACC			:	OUT	STD_LOGIC_Vector(7 DOWNTO 0));
end sistema;

architecture Behavioral of sistema is

component pdua is
    Port ( clk 	: in 	std_logic;
           rst_n 	: in 	std_logic;
           int 	: in 	std_logic;
           iom 	: out 	std_logic;
           rw 		: out 	std_logic;
           bus_dir 	: out 	std_logic_vector(7 downto 0);
           bus_data_in : in 	std_logic_vector(7 downto 0);
			  bus_data_out : out	std_logic_vector(7 downto 0));
end component;

component ROM is
    Port ( cs,rd	: in std_logic;
           dir 	: in std_logic_vector(6 downto 0);		-- Cambiado
           data 	: out std_logic_vector(7 downto 0));
end component;

component RAM is
    Port ( cs,rw 	: in 	std_logic;
           dir 	: in 	std_logic_vector(2 downto 0);
           data_in 	: in 	std_logic_vector(7 downto 0);
			  data_out 	: out std_logic_vector(7 downto 0));
end component;

signal rwi,cs_ROM,cs_RAM,iom	: std_logic;
signal datai,datao,diri		: std_logic_vector(7 downto 0);

begin
-- Cableado al analizador
--	clk_Ana <= clk;
--	rst_n_Ana <= rst_n;
--	int_Ana <= int;
--	DIR <= diri(4 DOWNTO 0);
--	ACC <= diri(7 DOWNTO 0);
	
U1: pdua port map (clk,rst_n,int,iom,rwi,diri,datai,datao);
U2: ROM  port map (cs_ROM,rwi,diri(6 downto 0),datai);            -- Cambiado
U3: RAM 	port map (cs_RAM,rwi,diri(2 downto 0),datao,datai);

bus_data_out <= datao;
-- Decodificador
cs_ROM <= not diri(7);
cs_RAM <= diri(7); 

end Behavioral;
