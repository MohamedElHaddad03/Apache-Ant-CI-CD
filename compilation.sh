javac -d bin/ -classpath lib/commons-lang3-3.5.jar src/fr/ubo/tetris/*.java


jar cf tetris.jar -C bin/fr .


java -cp bin:lib/commons-lang3-3.5.jar fr.ubo.tetris.Tetris

