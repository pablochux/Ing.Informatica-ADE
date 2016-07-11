library ieee;
use ieee.std_logic_1164.all;

entity practica_1 is
  port(x, y: in std_logic_vector(1 downto 0);
       z: out std_logic);
end practica_1;

architecture concurrente_sdp of practica_1 is
signal s0, s1, s2: std_logic;
signal not_x1, not_x0: std_logic;
begin
inv_0: entity work.not1 port map (x(1), not_x1);
inv_1: entity work.not1 port map (x(0), not_x0);
puerta0: entity work.and2 port map(not_x1, y(1), s0);
puerta1: entity work.and3 port map(not_x1, not_x0, y(0), s1);
puerta2: entity work.and3 port map(not_x0, y(1), y(0), s2);
puerta3: entity work.or3 port map(s0, s1, s2, z);
end concurrente_pds;
