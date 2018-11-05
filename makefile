all: README.md

date := $(shell date -u)
lines := $(shell wc -l guessinggame.sh | egrep -o "[0-9]+")

README.md: guessinggame.sh
	echo "# The Guessing Game" > README.md
	echo "**Make run on:** ${date}" >> README.md
	echo "" >> README.md
	echo "**Lines of code:** ${lines}" >> README.md

clean:
	rm README.md
