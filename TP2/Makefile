IDIR = examples
ODIR = demos

_DEMOS = avg_max.vm max.vm maxof3.vm while.vm array.vm test.vm func.vm \
				logical.vm order.vm sum.vm evens.vm
DEMOS = $(patsubst %,$(ODIR)/%,$(_DEMOS))

all: strz demos

strz: strz.lex strz.y
	flex strz.lex
	yacc strz.y
	gcc y.tab.c `pkg-config --cflags --libs glib-2.0` -o strz

demos: strz.lex strz.y $(DEMOS)

$(ODIR)/%.vm: $(IDIR)/%.stz strz.lex strz.y
	./strz < $< > $@

clean:
	rm -f y.tab.c lex.yy.c strz
	rm -f demos/*.vm
