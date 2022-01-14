----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2022 03:22:39 PM
-- Design Name: 
-- Module Name: adder4bit - Behavioral
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

entity adder4bit is
  Port (a, b : IN std_logic_vector(3 downto 0);
        sum : OUT std_logic_vector(3 downto 0);
        cout : OUT std_logic
        );
end adder4bit;

architecture Behavioral of adder4bit is

component adder1bit 
  Port (a, b, cin : IN std_logic;
        sum, cout : OUT std_logic
        );
end component;

signal cout_1bit : std_logic_vector(3 downto 0);

begin
-- Ripple carry adder
ADDER0 : adder1bit port map (
    a => a(0),
    b => b(0),
    cin => '0',
    sum => sum(0),
    cout => cout_1bit(0)
);
ADDER1 : adder1bit port map (
    a => a(1),
    b => b(1),
    cin => cout_1bit(0),
    sum => sum(1),
    cout => cout_1bit(1)
);
ADDER2 : adder1bit port map (
    a => a(2),
    b => b(2),
    cin => cout_1bit(1),
    sum => sum(2),
    cout => cout_1bit(2)
);
ADDER3 : adder1bit port map (
    a => a(3),
    b => b(3),
    cin => cout_1bit(2),
    sum => sum(3),
    cout => cout_1bit(3)
);

cout <= cout_1bit(3);

end Behavioral;
