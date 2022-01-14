----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2022 03:05:02 PM
-- Design Name: 
-- Module Name: adder1bit - Behavioral
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

-- Adds two bits and a carry together to give a sum and carry out
entity adder1bit is
  Port (a, b, cin : IN std_logic;
        sum, cout : OUT std_logic
        );
end adder1bit;

architecture Behavioral of adder1bit is
-- Define signals to make sum and cout equations simpler
signal P, G : std_logic;

begin

P <= a xor b;
G <= a and b;

sum <= P xor cin;
cout <= G or (P and cin);

end Behavioral;
