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
