library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity processor is
    Port (
        clk    : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        result : out STD_LOGIC_VECTOR (7 downto 0)
    );
end processor;

architecture Behavioral of processor is
    signal pc, instr, regA, regB, alu_out : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    type memory is array(0 to 15) of STD_LOGIC_VECTOR(7 downto 0);
    signal instr_mem : memory := (
        0 => "00000001", 1 => "00000010", 2 => "00000100", 3 => "00001000",
        others => (others => '0')
    );
begin
    process(clk, reset)
    begin
        if reset = '1' then
            pc <= (others => '0');
            result <= (others => '0');
        elsif rising_edge(clk) then
            instr <= instr_mem(to_integer(unsigned(pc)));
            pc <= std_logic_vector(unsigned(pc) + 1);
            regA <= instr;
            regB <= "00000001";
            alu_out <= std_logic_vector(unsigned(regA) + unsigned(regB));
            result <= alu_out;
        end if;
    end process;
end Behavioral;