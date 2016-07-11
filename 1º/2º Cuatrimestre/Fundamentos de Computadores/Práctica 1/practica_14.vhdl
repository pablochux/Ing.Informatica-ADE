library ieee;
use ieeeieee.std_logic_1164.all;

entity deco3a8 is port(
  port(x, y: in std_logic_vector(1 downto 0);
       z: out std_logic);
end deco3a8;

architecture puertas of deco3a8 is
	signal not_y0, not_y1, not_x0, not_x1: std_logic;
	signal s0, s1, s2, s3, s4, s5, s6: std_logic;
begin
	not1: entity work.not1 port map(y(0), not_y0);
	not2: entity work.not1 port map(y(1), not_y1);
	not3: entity work.not1 port map(x(0), not_x0);
	not4: entity work.not1 port map(x(1), not_x1);
	and1: entity work.and4 port map(not_x1, not_x0, not_y1, y1, s0);
	and2: entity work.and4 port map(not_x1, not_x0, y(1), not_y0, s1);
	and3: entity work.and4 port map('1', not_x0, y(1), y(0), s2);
	and4: entity work.and4 port map(not_x1, x(0), not_y0, y(1), s3);
	and5: entity work.and4 port map(not_x1, x(0), y(1), y(0), s4);
	and6: entity work.and4 port map(x(1), not_x0, y(1), y(0), s5);
	or1: entity work.or5 port map(s0, s1, s2, s3, s4, s6);
	or1: entity work.or2 port map(s6, s5, z);
end puertas;

