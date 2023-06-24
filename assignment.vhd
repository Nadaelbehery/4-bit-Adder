LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY assignment IS
	PORT( bigCin	: IN STD_LOGIC;
			x : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			y : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			led1 : OUT STD_LOGIC_VECTOR(0 TO 6);
			led2 : OUT STD_LOGIC_VECTOR(0 TO 6)
		   );
END assignment;

ARCHITECTURE assignment_arch OF assignment IS

	SIGNAL s : STD_LOGIC_VECTOR(4 DOWNTO 0);
	
	COMPONENT fourbitadder IS
		PORT(bigCin	: IN STD_LOGIC;
			  x		: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			  y		: IN STD_LOGIC_VECTOR(3 DOWNTO 0);	
			  s		: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);    
			  bigCout	: OUT STD_LOGIC
			  ); 
	END COMPONENT;
	
	BEGIN
	
	stage0: fourbitadder PORT MAP(bigCin,x,y,s(3 DOWNTO 0),s(4));
	
		PROCESS(s)
		BEGIN
			--00s
			IF s = "00000" THEN
				led1 <= "0000001"; led2 <= "1111111";
			ELSIF s = "00001" THEN
				led1 <= NOT "0110000"; led2 <= "1111111";
			ELSIF s = "00010" THEN
				led1 <= NOT "1101101"; led2 <= "1111111";
			ELSIF s = "00011" THEN
				led1 <= NOT "1111001"; led2 <= "1111111";
			ELSIF s = "00100" THEN
				led1 <= NOT "0110011"; led2 <= "1111111";
			ELSIF s = "00101" THEN
				led1 <= NOT "1011011"; led2 <= "1111111";
			ELSIF s = "00110" THEN
				led1 <= NOT "1011111"; led2 <= "1111111";
			ELSIF s = "00111" THEN
				led1 <= NOT "1110000"; led2 <= "1111111";
			ELSIF s = "01000" THEN
				led1 <= NOT "1111111"; led2 <= "1111111";
			ELSIF s = "01001" THEN
				led1 <= NOT "1111011"; led2 <= "1111111";
			--10s
			ELSIF s = "01010" THEN
				led1 <= "0000001"; led2 <= NOT "0110000";
			ELSIF s = "01011" THEN
				led1 <= NOT "0110000"; led2 <= NOT "0110000";
			ELSIF s = "01100" THEN
				led1 <= NOT "1101101"; led2 <= NOT "0110000";
			ELSIF s = "01101" THEN
				led1 <= NOT "1111001"; led2 <= NOT "0110000";
			ELSIF s = "01110" THEN
				led1 <= NOT "0110011"; led2 <= NOT "0110000";	
			ELSIF s = "01101" THEN
				led1 <= NOT "0110011"; led2 <= NOT "0110000";
			ELSIF s = "01111" THEN
				led1 <= NOT "1011011"; led2 <= NOT "0110000";
			ELSIF s = "10000" THEN
				led1 <= NOT "1011111"; led2 <= NOT "0110000";	
			ELSIF s = "10001" THEN
				led1 <= NOT "1110000"; led2 <= NOT "0110000";
			ELSIF s = "10010" THEN
				led1 <= NOT "1111111"; led2 <= NOT "0110000";
			ELSIF s = "10011" THEN
				led1 <= NOT "1111011"; led2 <= NOT "0110000";
			--20s
			ELSIF s = "10100" THEN
				led1 <= "0000001"; led2 <= NOT "1101101";	
			ELSIF s = "10101" THEN
				led1 <= NOT "0110000"; led2 <= NOT "1101101";
			ELSIF s = "10110" THEN
				led1 <= NOT "1101101"; led2 <= NOT "1101101";
			ELSIF s = "10111" THEN
				led1 <= NOT "1111001"; led2 <= NOT "1101101";
			ELSIF s = "11000" THEN
				led1 <= NOT "0110011"; led2 <= NOT "1101101";
			ELSIF s = "11001" THEN
				led1 <= NOT "1011011"; led2 <= NOT "1101101";
			ELSIF s = "11010" THEN
				led1 <= NOT "1011111"; led2 <= NOT "1101101";
			ELSIF s = "11011" THEN
				led1 <= NOT "1110000"; led2 <= NOT "1101101";
			ELSIF s = "11100" THEN
				led1 <= NOT "1111111"; led2 <= NOT "1101101";
			ELSIF s = "11101" THEN
				led1 <= NOT "1111011"; led2 <= NOT "1101101";
			--30s
			ELSIF s = "11110" THEN
				led1 <= "0000001"; led2 <= NOT "1111001";
			ELSIF s = "11111" THEN
				led1 <= NOT "0110000"; led2 <= NOT "1111001";
			--Other
			ELSE led1 <= "0000001"; led2 <= "1111111";
			END IF;
		END PROCESS;
	
END assignment_arch;