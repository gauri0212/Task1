library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RAM_tb is
end RAM_tb;

architecture test of RAM_tb is
    signal clk     : STD_LOGIC := '0';
    signal we      : STD_LOGIC;
    signal addr    : STD_LOGIC_VECTOR (3 downto 0);
    signal din     : STD_LOGIC_VECTOR (7 downto 0);
    signal dout    : STD_LOGIC_VECTOR (7 downto 0);

    component RAM
        Port (
            clk     : in  STD_LOGIC;
            we      : in  STD_LOGIC;
            addr    : in  STD_LOGIC_VECTOR (3 downto 0);
            din     : in  STD_LOGIC_VECTOR (7 downto 0);
            dout    : out STD_LOGIC_VECTOR (7 downto 0)
        );
    end component;

begin
    uut: RAM port map (clk => clk, we => we, addr => addr, din => din, dout => dout);
    clk <= not clk after 5 ns;

    stim_proc: process
    begin
        we <= '1'; addr <= "0001"; din <= "10101010"; wait for 10 ns;
        we <= '1'; addr <= "0010"; din <= "11001100"; wait for 10 ns;
        we <= '0'; addr <= "0001"; wait for 10 ns;
        we <= '0'; addr <= "0010"; wait for 10 ns;
        wait;
    end process;
end test;