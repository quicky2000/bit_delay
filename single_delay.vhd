--
--    This file is part of bit_delay
--    Copyright (C) 2011  Julien Thevenon ( julien_thevenon at yahoo.fr )
--
--    This program is free software: you can redistribute it and/or modify
--    it under the terms of the GNU General Public License as published by
--    the Free Software Foundation, either version 3 of the License, or
--    (at your option) any later version.
--
--    This program is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU General Public License for more details.
--
--    You should have received a copy of the GNU General Public License
--    along with this program.  If not, see <http://www.gnu.org/licenses/>
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity single_delay is
  port (
    clk    : in  std_logic;             -- clock
    rst : in std_logic; --rst
    input     : in  std_logic;             -- input
    output : out std_logic);            -- output
end single_delay;

architecture behavourial of single_delay is
begin  -- behavourial
  -- purpose: create delay
  -- type   : sequential
  -- inputs : clk, rst
  -- outputs: sig1
  gen_output: process (clk,rst)
  begin  -- process gen_output
    if rising_edge(clk) then  -- rising clock edge
      if rst = '1' then               -- asynchronous reset (active low)
        output <= '0';
      else
        output <= input;
      end if;
    end if;
  end process gen_output;
end behavourial;
