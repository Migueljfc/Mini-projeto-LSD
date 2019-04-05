library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
entity to7SegDecoder is
	port(dataIn : in std_logic_vector(6 downto 0);
		  dataOut1 : out std_logic_vector( 3 downto 0);
		  dataOut2 : out std_logic_vector( 3 downto 0));
end to7SegDecoder;
architecture Behavioral of to7SegDecoder is
	signal s_dataOut1 : unsigned (6 downto 0);
	signal s_dataOut2 : unsigned (6 downto 0);
	signal s_dataIn   : unsigned (6 downto 0);
	begin 
	s_dataIn <= unsigned(dataIn);
	s_dataOut1 <= s_dataIn / 10;
	s_dataOut2 <= s_dataIn rem 10;
	
	dataOut1 <= std_logic_vector(s_dataOut1)(3 downto 0);
	dataOut2 <= std_logic_vector (s_dataOut2)(3 downto 0);
end Behavioral;
	