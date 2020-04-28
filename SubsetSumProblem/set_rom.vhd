library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity set_rom is
port(addr: in std_logic_vector (3 downto 0);
data: out std_logic_vector (7 downto 0));
end set_rom;
architecture rtl of set_rom is
type rom_type is array (0 to 15) of
std_logic_vector (7 downto 0);
constant program : rom_type := (
"00000011", 
"00100010",
"00000100",
"00001100",
"00000101",
"00000010",
"11111110",
"11110101",
"10010000",
"10000000",
"11101000",
"10001111",
"10100000",
"10000000",
"01111000",
"00000000");
begin
data <= program(conv_integer(unsigned(addr)));
end rtl;