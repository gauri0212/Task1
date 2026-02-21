library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FIR_Filter is
    Port (
        clk   : in  STD_LOGIC;
        reset : in  STD_LOGIC;
        x     : in  STD_LOGIC_VECTOR (7 downto 0);
        y     : out STD_LOGIC_VECTOR (15 downto 0)
    );
end FIR_Filter;

architecture Behavioral of FIR_Filter is
    signal delay : array(0 to 2) of STD_LOGIC_VECTOR(7 downto 0) := (others => (others => '0'));
    signal result : unsigned(15 downto 0);
    constant h : array(0 to 2) of integer := (1, 2, 3);
begin
    process(clk, reset)
    begin
        if reset = '1' then
            delay(0) <= (others => '0');
            delay(1) <= (others => '0');
            delay(2) <= (others => '0');
            result   <= (others => '0');
        elsif rising_edge(clk) then
            delay(2) <= delay(1);
            delay(1) <= delay(0);
            delay(0) <= x;

            result <= to_unsigned(h(0),16) * unsigned(delay(0)) +
                      to_unsigned(h(1),16) * unsigned(delay(1)) +
                      to_unsigned(h(2),16) * unsigned(delay(2));
        end if;
    end process;
    y <= std_logic_vector(result);
end Behavioral;