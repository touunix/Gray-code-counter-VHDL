-- Mateusz Gabryel 181329 EiT 3
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use STD.STANDARD.ALL;

ENTITY top IS
    PORT ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           led_o : out STD_LOGIC_VECTOR (2 downto 0)
           );
END top;

ARCHITECTURE Behavioral OF top IS

signal a: STD_LOGIC_VECTOR (2 downto 0); 
signal b: STD_LOGIC_VECTOR (2 downto 0);

BEGIN

PROCESS (clk_i, rst_i,a,b)

BEGIN

if(rst_i='1')then a<="000";
    elsif(rising_edge(clk_i)) then
        a<=a+1;
END if;

--przepisujemy MSB
--kazdy kolejny bit realizowany jest za pomoca
--funkcji XOR

b(2)<=a(2);
b(1)<=a(1) xor a(2);
b(0)<=a(1) xor a(0);

--przepisanie wynikow na diody led

led_o(2)<=b(2);
led_o(1)<=b(1);
led_o(0)<=b(0);

END PROCESS;
END Behavioral;