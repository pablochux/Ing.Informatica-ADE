library ieee;
use ieee.std_logic_1164.all;

entity practica_1 is
  port(x, y: in std_logic_vector(1 downto 0);
       z: out std_logic);
end practica_1;

architecture estructural_nor of practica_1 is
signal s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20: std_logic;
begin
puerta0: entity work.nor2 port map(x(1), x(0), s0);
puerta1: entity work.nor2 port map(s0, s0, s1);
puerta2: entity work.nor2 port map(s1, s2, s3);
puerta3: entity work.nor2 port map(y(1), y(1), s2);
puerta4: entity work.nor2 port map(x(0), x(0), s4);
puerta5: entity work.nor2 port map(s0, s0, s5);
puerta6: entity work.nor2 port map(s4, s4, s6);
puerta7: entity work.nor2 port map(s5, s6, s7);
puerta8: entity work.nor2 port map(s7, s7, s8);
puerta9: entity work.nor2 port map(s8, s9, s10);
puerta10: entity work.nor2 port map(y(0), y(0), s9);
puerta11: entity work.nor2 port map(s3, s10, s11);
puerta12: entity work.nor2 port map(s11, s11, s12);
puerta13: entity work.nor2 port map(s12, s13, s14);
puerta14: entity work.nor2 port map(s4, s4, s15);
puerta15: entity work.nor2 port map(y(0), y(0), s16);
puerta16: entity work.nor2 port map(s15, s16, s17);
puerta17: entity work.nor2 port map(s17, s17, s18);
puerta18: entity work.nor2 port map(s18, s19, s13);
puerta19: entity work.nor2 port map(y(1), y(1), s19);
puerta20: entity work.nor2 port map(s14, s14, s20);
end estructural_nor;
