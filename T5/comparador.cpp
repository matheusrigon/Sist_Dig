#include<stdio.h>

int main(void) {
  FILE *C = NULL, *V = NULL, *saida = NULL;
  int out_ver, out_c, i;
  V = fopen("saidaV.txt", "r");
  C = fopen("saidaC.txt", "r");
  saida = fopen("saidaCompara.txt","w");


  for (i = 1; fscanf(V, "%d", &out_ver) != EOF && fscanf(C, "%d", &out_c) != EOF; i++)
    if (out_ver != out_c)
      fprintf(saida, "Valores diferentes para a saida na linha %d\n", i);

  fclose(V);
  fclose(C);
  fclose(saida);

  return 0;
}
