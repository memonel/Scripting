#!/usr/bin/env python

word_choice = raw_input('Enter the word of your choice to be translated to Pig latin:\n')
#Python3 - word_choice = input('Enter the word of your choice to be translated to Pig latin:\n')
while len(word_choice.split()) > 1:
	word_choice = raw_input('Enter only one word please:\n')
	print ("only one word")
else:
	first = word_choice[0]
	rest = word_choice[1:]
	result = rest + '-' + first + 'y'
	print (result)
	print ("The last two letters are: " + word_choice[-2:])
	print (word_choice[-2:])

#word = 'Python'
# first = word_choice[0]
# rest = word_choice[1:]
# result = rest + '-' + first + 'y'
# print (result)
# print ("The last two letters are: " + word_choice[-2:])
#print (word_choice[-2:])
# else:
# 	print ("enter one word only")

#else print ("Print one word only please")