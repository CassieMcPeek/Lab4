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
  


The data path vhdl made modifications to MARHi/Lo, the address selector, the accumulator, the tri-state buffer and the instruction register. 

  For the MARHi/Lo , if all controls = '1' then MARHi <= Data, and the same goes for MARLo. If any is equal to zero, then both equal "0000". 
  
  For the address selector, it uses a multiplexor and the new signal 'concat' (7 downto 0) is changed to MARHi if it is concat (7 to 4) and MARLo if it is concat (3 to 0). 
  
  The next step was to instantiate the ALU
    Opsel => opsel which is a signal
    Data => data which is the data bus
    Accumulator => accumulator
    Result => ALU_REsult
        The opsel and data are both inputs, while the accumulator and reset are both signals because they rely on         the result of the register.
        
  The tri state buffer goes to data when enabled and high "z" otherwise, it is made a new signal. 
  
  For the instruction register, all inputs must be '1' for IR <= data, otherwise IR <= '0000'.
  
  At first, I forgot to add the waveform for the testbench, so data was coming up as undefined throughout. Once I added the waveform, it worked. 


# Functionality

The simulated results for the ALU vhdl is below, which follows my thought process above.

![alt text] (https://raw.github.com/CassieMcPeek/Lab4/master/ALU_Sim2.JPG "Waveform")

The simulated results for the Datapath is below.

![alt text] (https://raw.github.com/CassieMcPeek/Lab4/master/Datapath_Sim.JPG "Waveform")




# Reverse Engineering

I printed out the screenshots of the signals for 700 ns and wrote directly on them. The screenshots will be below as soon as I upload them. 
