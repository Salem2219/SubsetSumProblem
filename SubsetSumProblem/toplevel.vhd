library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity toplevel is
    port (clk, rst, start : in std_logic;
    n : in std_logic_vector(3 downto 0);
    set, sum : in std_logic_vector(7 downto 0);
    set_addr : out std_logic_vector(3 downto 0);
    y : out std_logic);
end toplevel;

architecture rtl of toplevel is
component dp is
    port (clk, rst, wr1, wr2, i_ld, j_ld, sel : in std_logic;
    n : in std_logic_vector(3 downto 0);
    set, sum : in std_logic_vector(7 downto 0);
    x1, x2, x3 : out std_logic;
    set_addr : out std_logic_vector(3 downto 0);
    y : out std_logic);
end component;
component ctrl is
    port(clk,rst, start, x1, x2, x3: in std_logic;
        wr1, wr2, i_ld, j_ld, sel: out std_logic);
end component;
signal wr1, wr2, sel, i_ld, j_ld, x1, x2, x3 : std_logic;
begin
    datapath : dp port map (clk, rst, wr1, wr2, i_ld, j_ld, sel, n, set, sum, x1, x2, x3, set_addr, y);
    control : ctrl port map (clk, rst, start, x1, x2, x3, wr1, wr2, i_ld, j_ld, sel);
end rtl;