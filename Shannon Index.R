# David Murphy
# Spring 2017: Edited 08/09/17
# Forest Succession in the Roemer Arobretum, Geneseo NY 14454

# Shannon Diversity Index - quantify the diversity of four different instances of the arboretum:
#     1. The "current" state of the arboretum, based on transect data from 1999
#     2. One timestep/generation later
#     3. One generation following a TCD outbreak
#     4. One generation following a Thousand Cankers Disease AND an Emeral Ash Borer outbreak
#
# Results, in order of highest diversity: 
# Current (1.71) -> After TCD & EAB outbreak (1.58) -> 1 gen later (1.00) -> After TCD outbreak (.80)

###########
# Current #
###########

(((37/74)*(log(37/74))) +
  ((3/74)*(log(3/74))) +
  ((3/74)*(log(3/74))) +
  ((11/74)*(log(11/74))) +
  ((1/74)*(log(1/74))) +
  ((6/74)*(log(6/74))) +
  ((2/74)*(log(2/74))) +
  ((7/74)*(log(7/74))) +
  ((1/74)*(log(1/74))) +
  ((1/74)*(log(1/74))) +
  ((1/74)*(log(1/74))) +
  ((1/74)*(log(1/74)))) * -1
#1.71


###############
# 1 gen later #
###############

(((59/115)*(log(59/115))) +
   ((2/115)*(log(2/115))) +
   ((5/115)*(log(5/115))) +
   ((47/115)*(log(47/115))) +
   ((1/115)*(log(1/115))) +
   ((1/115)*(log(1/115)))) * -1
#1.00

######################
# After TCD Outbreak #
# after 1 gen        #
######################

(((2/117)*(log(2/117))) +
   ((8/117)*(log(8/117))) +
   ((94/117)*(log(94/117))) +
   ((1/117)*(log(1/117))) +
   ((8/117)*(log(8/117))) +
   ((1/117)*(log(1/117))) +
   ((2/117)*(log(2/117))) +
   ((1/117)*(log(1/117)))) * -1
#.80

############################
# After TCD & EAB Outbreak #
# after 1 gen              #
############################

(((23/117)*(log(23/117))) +
   ((31/117)*(log(31/117))) +
   ((1/117)*(log(1/117))) +
   ((37/117)*(log(37/117))) +
   ((1/117)*(log(1/117))) +
   ((9/117)*(log(9/117))) +
   ((15/117)*(log(15/117)))) * -1
#1.58



