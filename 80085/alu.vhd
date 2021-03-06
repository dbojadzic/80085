library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
        port (
				 x1, x2 : in std_logic_vector(15 downto 0);
				 f0, f1 : in std_logic;
				 y0 : out std_logic_vector(15 downto 0);
				 z, n : out std_logic
        );
end ALU;

architecture Behavioral of ALU is

begin 
process(x1, x2, f0, f1)
	variable y : std_logic_vector (15 downto 0);
begin
	if (f1 = '0' and f0 = '0') then
		y := (x1 + x2);
	elsif (f1 = '0' and f0 = '1') then
		y := (x1 and x2);
	elsif (f1 = '1' and f0 = '0') then
		y := x1;
	else
		y := not x1;
	end if;
	
	if (y = x"0000") then
		z <= '1';
	else
		z <= '0';
	end if;

	n <= y(15);
	y0 <= y;
	
end process;
end Behavioral;

