library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FIR_tb is
end FIR_tb;

architecture test of FIR_tb is
    signal clk, reset : STD_LOGIC := '0';
    signal x          : STD_LOGIC_VECTOR(7 downto 0);
    signal y          : STD_LOGIC_VECTOR(15 downto 0);

    component FIR_Filter
        Port (
            clk   : in  STD_LOGIC;
            reset : in  STD_LOGIC;
            x     : in  STD_LOGIC_VECTOR (7 downto 0);
            y     : out STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;

begin
    uut: FIR_Filter port map (clk => clk, reset => reset, x => x, y => y);
    clk <= not clk after 5 ns;

    process
    begin
        reset <= '1'; wait for 10 ns;
        reset <= '0';
        x <= "00000001"; wait for 10 ns;
        x <= "00000010"; wait for 10 ns;
        x <= "00000100"; wait for 10 ns;
        x <= "00000000"; wait for 10 ns;
        wait;
    end process;
end test;