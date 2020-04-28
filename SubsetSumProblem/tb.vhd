library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity tb is
end tb ;

architecture behav of tb is
  constant clockperiod: time:= 0.1 ns;
  signal clk: std_logic:='0';
  signal rst,start: std_logic;
  signal n, set_addr : std_logic_vector(3 downto 0);
  signal y : std_logic;
  signal set, sum : std_logic_vector (7 downto 0);
  component toplevel
      port (clk, rst, start : in std_logic;
    n : in std_logic_vector(3 downto 0);
    set, sum : in std_logic_vector(7 downto 0);
    set_addr : out std_logic_vector(3 downto 0);
    y : out std_logic);
  end component ;
  component set_rom is
port(addr: in std_logic_vector (3 downto 0);
data: out std_logic_vector (7 downto 0));
end component;
  begin
    clk <= not clk after clockperiod /2;
    rst <= '1' , '0' after 0.1 ns;
    start <= '0' , '1' after 0.1 ns, '0' after 0.5 ns;
    n <= "0110";
    sum <= "00001001";
    dut: toplevel port map(clk,rst,start,n,set, sum, set_addr,  y);
    dut2: set_rom port map(set_addr, set);
  end behav;