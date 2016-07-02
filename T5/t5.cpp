#include <stdio.h>

typedef struct Tponto{
	int x, y;
}ponto_s;

double teste(ponto_s a, ponto_s b, ponto_s c){
	return (b.x - c.x) * (b.y - c.y) - (b.x - c.x) * (a.y - c.y);
}

int main(){
	ponto_s a, b, c, p;
  FILE *entrada, *saida;

	entrada = fopen("entrada.txt","r");
  saida = fopen("saidaC.txt","w");

while(!feof(entrada)){
  fscanf(entrada,"%d %d %d %d %d %d %d %d", &a.x, &a.y, &b.x, &b.y, &c.x, &c.y, &p.x, &p.y);
	if(teste(a,b,c) == teste(a,b,p) + teste(a,p,c)+ teste(p,b,c))
	  fprintf(saida,"1\n");
	else
		fprintf(saida,"0\n");
}
fclose(entrada);
fclose(saida);
    return 0;
}
