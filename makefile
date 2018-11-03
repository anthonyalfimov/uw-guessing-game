all: README.md

README.md: guessinggame.sh
	echo "# The Guessing Game" > README.md
	echo "**Created:** " >> README.md
	date -u >> README.md
	echo "" >> README.md
	echo "**Lines of code:** " >> README.md
	wc -l guessinggame.sh | egrep -o "[0-9]+" >> README.md

clean:
	rm README.md
