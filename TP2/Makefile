IDIR = examples
ODIR = demos

_DEMOS = func.vm impares.vm inverso.vm logico.vm max.vm menor.vm ola.vm ordenar.vm produtorio.vm quadrado.vm vetor.vm
DEMOS = $(patsubst %,$(ODIR)/%,$(_DEMOS))

all: progz demos

progz: progz.lex progz.y
	flex progz.lex
	yacc progz.y
	gcc y.tab.c `pkg-config --cflags --libs glib-2.0` -o progz

demos: progz.lex progz.y $(DEMOS)

$(ODIR)/%.vm: $(IDIR)/%.pgz progz.lex progz.y
	./progz < $< > $@

clean:
	rm -f y.tab.c lex.yy.c progz
	rm -f demos/*.vm
