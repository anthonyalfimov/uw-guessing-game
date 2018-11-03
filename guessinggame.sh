#!/usr/bin/env bash
# File: guessinggame.sh

files=$(ls -1 | wc -l | tr -d ' ')	# correct answer (tr deletes leading whitespace)
is_num=^[0-9]+$				# regex to test whether input is a positive number

function prompt_input {
  echo $1
  read guess
}

prompt_input "Guess how many files are there in the current directory?"

while [[ $guess -ne $files ]]		# while guess is wrong
do
  if [[ ! $guess =~ $is_num ]]		# if not a positive number
  then
    prompt_input "Invalid input! Try again"
  elif [[ $guess -gt $files ]]		# if greater than correct answer
  then
    prompt_input "Too high! Guess again:"
  else					# if less than correct answer
    prompt_input "Too low! Guess again:"
  fi
done

# The loop can be exited in case of an error, as well as a correct guess.
# Hence, check that the guess was actually correct before congratulating:
if [[ $guess -eq $files ]]
then
  echo "Correct! The directory contains $files file(s)."
fi
