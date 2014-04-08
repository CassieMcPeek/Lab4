Lab4
====

Prism


# Design
To begin the modifications for the ALU, I began stepping through each part individually to ensure that I had all parts working.

  For the AND it is a 4 bit input. I will need to and each bit to the matching one (in relation to significance). Need to use a case statement.
  I ran into a couple problems with the case statement, it will only work with multiple outputs if I place a semicolon after each one.
  To check: '000' = (0001)(0010) = '0000' that is correct
  
  The NEG is the 2's compliment and it uses the acc as the only input
  To check: '001' = 2's compliment = 0100 -> 1011 + 0001 = 1100 that is correct
  
  The NOT is the 1's compliment using only acc, in this you will flip each bit and the result will not be the accumulator.
  To check: acc => '0111' -> '1000' which is correct.
  
  The ROR will use only the acc and will rotate right.
  To check: move each bit of the acc to the right: acc => '1011' -> '1101' which is correct
  
  The OR uses both the acc and data and utilizes 4 'or' statements for each bit
  to check: (0111)+(1110) = '1111' that is correct
  
  The IN uses data only and simply sets the result to data
  To check: data = result -> '1000' = '1000' that is correct
  
  The ADD uses both acc and data and adds data to acc.
  To check: '1001' + '0011' = 9+3 = 12 = '1100' which is correct
  
  The LDA does the same thing as IN and sets the result to data
  To Check: '1011' = '1011' which is correct. 
  
The simulated results for the ALU vhdl is below, which follows my thought process above.

![alt text] (https://raw.github.com/CassieMcPeek/Lab4/master/ALU_Sim2.JPG "Waveform")


# Functionality


# Reverse Engineering
