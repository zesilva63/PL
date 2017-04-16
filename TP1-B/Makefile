V=processor


$V: $V.fl
	flex $V.fl
	gcc lex.yy.c `pkg-config --cflags --libs glib-2.0` -o $V

clean:
	rm result.txt
	rm tabela.html
	rm index.html
	rm $V
	rm lex.yy.c
