----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2022 03:49:29 PM
-- Design Name: 
-- Module Name: adder4bit_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder4bit_tb is
--  Port ( );
end adder4bit_tb;

architecture Behavioral of adder4bit_tb is

component adder4bit
  Port (a, b : IN std_logic_vector(3 downto 0);
        sum : OUT std_logic_vector(3 downto 0);
        cout : OUT std_logic
        );
end component;

signal a, b : std_logic_vector(3 downto 0);
signal sum : std_logic_vector(3 downto 0);
signal cout : std_logic;

begin

DUT : adder4bit port map (
    a => a,
    b => b,
    sum => sum,
    cout => cout
);

process begin
    a <= "1110";
    b <= "0010";
    wait for 10 ns;
    assert sum = "0000" and cout = '1' report "14+2 failed.";
    
    a <= "0001";
    b <= "0010";
    wait for 10 ns;
    assert sum = "0011" and cout = '0' report "1 + 2 failed.";
    
    
    a <= "1101";
    b <= "1100";
    wait for 10 ns;
    assert sum = "1001" and cout = '1' report "13 + 12 failed.";
    
    a <= "1000";
    b <= "0111";
    wait for 10 ns;
    assert sum = "1111" and cout = '0' report "8+7 failed.";
    
end process;

end Behavioral;
