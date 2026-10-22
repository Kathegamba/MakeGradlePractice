JAR = ttsDemo.jar
LIB = /usr/share/java/freetts-1.2.2.jar
SRC = src/main/java

.PHONY: build run clean

build: $(JAR)

$(SRC)/Speaker.class: $(SRC)/Speaker.java
	javac -cp ".:$(LIB)" $(SRC)/Speaker.java

$(SRC)/Main.class: $(SRC)/Main.java
	javac -cp ".:$(LIB):$(SRC)" $(SRC)/Main.java

$(JAR): $(SRC)/Main.class $(SRC)/Speaker.class
	jar cfe $(JAR) Main -C $(SRC) Main.class -C $(SRC) Speaker.class

run: build
	java -cp "$(JAR):/usr/share/java/*" Main

clean:
	rm -f $(SRC)/*.class $(JAR)
