library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity dp is
    port (clk, rst, wr1, wr2, i_ld, j_ld, sel : in std_logic;
    n : in std_logic_vector(3 downto 0);
    set, sum : in std_logic_vector(7 downto 0);
    x1, x2, x3 : out std_logic;
    set_addr : out std_logic_vector(3 downto 0);
    y : out std_logic);
end dp;

architecture rtl of dp is
component compgr4 is
    port (
    a, b : in std_logic_vector(3 downto 0);
    y : out std_logic);
end component;
component compgr8 is
    port (
    a, b : in std_logic_vector(7 downto 0);
    y : out std_logic);
end component;
component complt is
    port (
    a, b : in std_logic_vector(7 downto 0);
    y : out std_logic);
end component;
component plus1_4 is
    port (a : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
component plus1_8 is
    port (a : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(7 downto 0));
end component;
component minus1 is
    port (a : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
component mux4 is
    port (s : in std_logic;
    a, b : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
component mux8 is
    port (s : in std_logic;
    a, b : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(7 downto 0));
end component;
component reg4 is
port (clk, rst, en: in std_logic;
reg_in: in std_logic_vector(3 downto 0);
reg_out: out std_logic_vector(3 downto 0));
end component;
component reg8 is
port (clk, rst, en: in std_logic;
reg_in: in std_logic_vector(7 downto 0);
reg_out: out std_logic_vector(7 downto 0));
end component;
component ram is
port(clk, wr1, wr2 : in std_logic;
i, n : in std_logic_vector(3 downto 0);
j, set, sum : in std_logic_vector(7 downto 0);
y : out std_logic);
end component;
signal i, i_in, iplus1 :  std_logic_vector(3 downto 0);
signal  j, j_in, jplus1 : std_logic_vector(7 downto 0);
begin
    i_op : plus1_4 port map (i, iplus1);
    i_mux : mux4 port map (sel, "0001", iplus1, i_in);
    i_reg : reg4 port map (clk, rst, i_ld, i_in, i);
    addr_op1 : minus1 port map (i, set_addr);
    j_op2 : plus1_8 port map (j, jplus1);
    j_mux : mux8 port map (sel, "00000001", jplus1, j_in);
    j_reg : reg8 port map (clk, rst, j_ld, j_in, j);
    in_comp : compgr4 port map (i, n, x1);
    j_comp : compgr8 port map (j, sum, x2);
    jset_comp : complt port map (j, set, x3);
    set_ram : ram port map (clk, wr1, wr2, i, n, j, set, sum, y);
end rtl;

