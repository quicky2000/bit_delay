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

entity bit_delay is
  generic (
    size : natural := 1);               -- size of delay
  port (
    clk    : in  std_logic;             -- clock
    rst : in std_logic; --rst
    input     : in  std_logic;             -- input
    output : out std_logic);            -- output
end bit_delay;

architecture behavourial of bit_delay is
--  signal delayed_output : std_logic_vector(size downto 0) := (others => '0');  -- delayed output
  type buffer_t is array (0 to size) of std_logic;
  signal delayed_output : buffer_t := (others => '0');  -- delayed output
begin  -- behavourial
  
  delayed_output(0) <= input;
  size_non_zero : if size > 0 generate
    delay_loop: for i in 0 to size -1 generate
      inst: entity work.single_delay
        port map (
          clk    => clk,
          rst    => rst,
          input  => delayed_output(i),
          output => delayed_output(i+1));
    end generate delay_loop;
    output <= delayed_output(size);
  end generate size_non_zero;
  
  size_zero: if size = 0 generate  
    output <= input;
  end generate size_zero;
  
end behavourial;
