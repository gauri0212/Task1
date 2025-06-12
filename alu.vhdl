library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    Port (
        A, B     : in  STD_LOGIC_VECTOR (3 downto 0);
        Sel      : in  STD_LOGIC_VECTOR (2 downto 0);
        Result   : out STD_LOGIC_VECTOR (3 downto 0)
    );
end ALU;

architecture Behavioral of ALU is
begin
    process (A, B, Sel)
    begin
        case Sel is
            when "000" => Result <= A + B;
            when "001" => Result <= A - B;
            when "010" => Result <= A and B;
            when "011" => Result <= A or B;
            when "100" => Result <= not A;
            when others => Result <= (others => '0');
        end case;
    end process;
end Behavioral;