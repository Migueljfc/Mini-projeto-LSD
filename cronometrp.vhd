library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
entity cronometrp is 
port( clk : in std_logic;
		reset: in std_logic;
		start: in std_logic;
		led: out std_logic;
		milseg: out std_logic_vector(6 downto 0);
		seg : out std_logic_vector(6 downto 0));
end entity;
architecture Behavioral of cronometrp is 
	signal cont : integer := 0;
	signal var_seg : unsigned (6 downto 0) := "0111011";
	signal var_milseg : unsigned (6 downto 0) := "1100011";
	signal s_led : std_logic := '0';
	
	begin 
	process(clk, reset)
	begin
	
	if(rising_edge(clk)) then
		if (reset = '1') then 
			var_seg <= "0111011";
			var_milseg <= "1100011";
			cont <= 0;
			s_led <= '0';
			
		elsif start = '1' then
			cont <= cont + 1;
			if cont = 500000 then
				cont <= 0;
				var_milseg <= var_milseg - "0000001";
				if var_milseg(6 downto 0) = "0000000" then
					var_seg <= var_min -"0000001";
					var_milseg <= "1100011";
				end if;
				if var_milseg(6 downto 0) = "0000000" then
					if var_milseg(6 downto 0) = "0000000" then
						s_led <= '1';
						var_seg <= "0111011";
						var_milseg <= "1100011";
				end if;				
			end if;
		end if;
		end if;
	end if;
			

end process;
seg <= std_logic_vector(var_seg);
milseg <= std_logic_vector(var_milseg);
led <= std_logic(s_led);
end Behavioral;

					
	
		