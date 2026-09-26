library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PseduRandom_Generator is
    generic(
        Seed : std_logic_vector(31 downto 0) := (others=>'0')
    );
    port( 
        Clock  : in  STD_LOGIC;
        Random : out std_logic_vector (15 downto 0) := (others=>'0')
    );
end PseduRandom_Generator;

architecture Behavioral of PseduRandom_Generator is
    
    signal LFSR : std_logic_vector(31 downto 0) := seed;
    
begin

    process(Clock) begin
        if rising_edge(Clock) then
        
            LFSR(31 downto 0) <= LFSR(30 downto 0) & (not(LFSR(31) xor LFSR(22) xor LFSR(2) xor LFSR(1))) ;
            
            Random  <= std_logic_vector(signed("0" & LFSR(31 downto 17)) + signed(LFSR(31 downto 16)) - 2**(14));
            
        end if;
    end process;

end Behavioral;