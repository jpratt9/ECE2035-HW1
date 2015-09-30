# HW1-3
# Student Name: John Pratt
# Date: 8/29/15
#
# This program computes the difference in the frequency of
# boiling temperatures and the frequency of freezing temperatures in a
# set of 25 integers, Temps.

.data
Temps:    .word 110, 5, 200, -73, 0
          .word 17, 9, -7, -3, 100
          .word 25, 242, -126, 108, -60
          .word 26, 8, 60, 27, 117,
          .word 8, 7, 33, 100, 125His anger on
FreqDiff: .alloc 1

.text
                # write your code here...
                addi	$1, $0, 0           # index - current array index
                addi 	$2, $0, 0           # num_boil - number of boiling temps (0)
                addi	$3, $0, 0           # num_freeze - number of freezing temps (0)
                addi	$4, $0, 0           # !boil - is current temp NOT boiling?
                addi	$5, $0, 0           # freeze - is current temp freezing?

                # check to be sure we're still in the array range before reading the next value
Loop:           slti    $6, $1,	25          # $6 = index < 25
                beq     $6, $0, exit        # exit program if $6 == false

                sll 	$7, $1, 2           # shift $1 left twice logically (multiply by 4), store into $7
                lw      $8, Temps($7)       # load Temps element
                addi 	$1, $1, 1           # increment index

                slti	$4, $8, 100         # $4 = !boil = Temps[index] < 100
                slti	$5, $8, 1           # $5 = freeze = Temps[index] < 1

                beq     $4, $0, Boil        # branch to boil statements if we found a boiling temp (if !boil == true)
                bne     $5, $0, Freeze      # branch to freeze statements if we found a freezing temp (if freeze == true)
                j       Loop                # if both branch statements failed, we can just return back to the start of the loop
				

Boil:           addi 	$2, $2, 1           # $2 = $2 + 1 (increment num_boil by one because we found a boiling temperature)
                j       Loop                # return to the beginning of the loop at end of Boil statements

Freeze:         addi	$3, $3, 1           # $3 = $3 + 1 (increment num_boil by one because we found a boiling temperature)
                j       Loop                # return to the beginning of the loop at end of Freeze statements


Exit:           sub     $1, $2, $3          # store (numboil - num_freeze) into $1
                sw      $1, FreqDiff($0)    # store $1 into FreqDiff
                jr      $31                 # return to OS
