library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_tb is
end ALU_tb;

architecture test of ALU_tb is
    signal A, B     : STD_LOGIC_VECTOR (3 downto 0);
    signal Sel      : STD_LOGIC_VECTOR (2 downto 0);
    signal Result   : STD_LOGIC_VECTOR (3 downto 0);

    component ALU
        Port (
            A, B     : in  STD_LOGIC_VECTOR (3 downto 0);
            Sel      : in  STD_LOGIC_VECTOR (2 downto 0);
            Result   : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

begin
    uut: ALU port map (A => A, B => B, Sel => Sel, Result => Result);

    stim_proc: process
    begin
        A <= "0101"; B <= "0011";
        Sel <= "000"; wait for 10 ns;
        Sel <= "001"; wait for 10 ns;
        Sel <= "010"; wait for 10 ns;
        Sel <= "011"; wait for 10 ns;
        Sel <= "100"; wait for 10 ns;
        wait;
    end process;
end test;