###
<<<<<<< HEAD
# This Makefile can be used to make a scanner for the Gibberish language
# (Yylex.class) and to make a program that tests the scanner (P2.class).
#
# The default makes both the scanner and the test program.
#
# make clean removes all generated files.
#
# Note: P2.java will not compile unless Yylex.class exists.
#
###

# define the java compiler to be used and the flags
JC = javac
FLAGS = -g -cp $(CP) 
CP = ./deps:.

P2.class: P2.java Yylex.class sym.class
	$(JC) $(FLAGS) P2.java

Yylex.class: gibberish.jlex.java ErrMsg.class sym.class
	$(JC) $(FLAGS) gibberish.jlex.java
=======
# This Makefile can be used to make a parser for the C-- language
# (parser.class) and to make a program (P3.class) that tests the parser and
# the unparse methods in ast.java.
#
# make clean removes all generated files.
#
###

JC = javac
FLAGS = -g
CP = ./deps:.

P3.class: P3.java parser.class Yylex.class ASTnode.class
	$(JC) $(FLAGS) -cp $(CP) P3.java

parser.class: parser.java ASTnode.class Yylex.class ErrMsg.class
	$(JC) $(FLAGS) -cp $(CP) parser.java

parser.java: gibberish.cup
	java -cp $(CP) java_cup.Main < gibberish.cup

Yylex.class: gibberish.jlex.java sym.class ErrMsg.class
	$(JC) $(FLAGS) -cp $(CP) gibberish.jlex.java

ASTnode.class: ast.java
	$(JC) $(FLAGS) -cp $(CP) ast.java
>>>>>>> 387248d (supporting structs, bool and void)

gibberish.jlex.java: gibberish.jlex sym.class
	java -cp $(CP) JLex.Main gibberish.jlex

sym.class: sym.java
<<<<<<< HEAD
	$(JC) $(FLAGS) sym.java

ErrMsg.class: ErrMsg.java
	$(JC) $(FLAGS) ErrMsg.java

	
###
# testing - add more here to run your tester and compare its results
# to expected results
###
test:
	# java -cp $(CP) P2 stringLiteral &> stringLiteralLog.out
	# diff stringLiteralTest.out stringLiteralGT.txt

	# java -cp $(CP) P2 intLiteral &> intLiteralLog.out
	# diff intLiteralTest.out intLiteralGT.txt

	# java -cp $(CP) P2 comment &> commentLog.out
	#diff commentTest.out commentGT.txt

	java -cp $(CP) P2
	diff allTokens.in allTokens.out
###
# clean up
###

clean:
	rm -f *~ *.class gibberish.jlex.java

cleantest:
	rm -f allTokens.out
=======
	$(JC) $(FLAGS) -cp $(CP) sym.java

sym.java: gibberish.cup
	java -cp $(CP) java_cup.Main < gibberish.cup

ErrMsg.class: ErrMsg.java
	$(JC) $(FLAGS) -cp $(CP) ErrMsg.java

##test
test:
	java -cp $(CP) P3 test.gibberish test.out

###
# clean
###
clean:
	rm -f *~ *.class parser.java gibberish.jlex.java sym.java

## cleantest (delete test artifacts)
cleantest:
	rm -f *.out
>>>>>>> 387248d (supporting structs, bool and void)
