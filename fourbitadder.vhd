LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fourbitadder IS
	PORT(bigCin	: IN STD_LOGIC;
	     x		: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	     y		: IN STD_LOGIC_VECTOR(3 DOWNTO 0);	
	     s		: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);    
	     bigCout	: OUT STD_LOGIC
	     );  
END fourbitadder;

ARCHITECTURE fourbitadder_arch OF fourbitadder IS
       SIGNAL c : STD_LOGIC_VECTOR(2 DOWNTO 0);
	COMPONENT fulladder IS
		PORT(Cin,x,y:IN STD_LOGIC;
		s,Cout : OUT STD_LOGIC);
	END COMPONENT;
		 
BEGIN 

	stage0: fulladder PORT MAP(bigCin,x(0),y(0),s(0),c(0));
	stage1: fulladder PORT MAP(c(0),x(1),y(1),s(1),c(1));
	stage2: fulladder PORT MAP(c(1),x(2),y(2),s(2),c(2));
	stage3: fulladder PORT MAP(c(2),x(3),y(3),s(3),bigCout);
END fourbitadder_arch;