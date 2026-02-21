library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity processor_tb is
end processor_tb;

architecture test of processor_tb is
    signal clk    : STD_LOGIC := '0';
    signal reset  : STD_LOGIC := '0';
    signal result : STD_LOGIC_VECTOR (7 downto 0);

    component processor
        Port (
            clk    : in  STD_LOGIC;
            reset  : in  STD_LOGIC;
            result : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;

begin
    uut: processor port map (clk => clk, reset => reset, result => result);
    clk <= not clk after 5 ns;

    process
    begin
        reset <= '1'; wait for 10 ns;
        reset <= '0'; wait for 100 ns;
        wait;
    end process;
end test;