#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *input = "spell.txt";
char *output = "spell.sql";
char *query = "INSERT INTO spell (locName, spellName, spellCost) VALUES";
char *end = "END";
char *reg1 = "%[^,],%[^,],%d";
char *reg2 = "('%s','%s',%d),\n";

int main() {
  FILE *in = fopen(input, "r");
  FILE *out = fopen(output, "w");

  fputs(query, out);
  fputs("\n", out);

  char str[100];

  while (strcmp(str, end) != 0) {
    fgets(str, 100, in);
    
    char spellLocation[100];
    char spellName[100];
    int spellMagCost = 0;

    // Yay happy moment
    if (strcmp(str, end) != 0 && sscanf(str, reg1, spellLocation, spellName, &spellMagCost)) {
      //printf("%s", locName);
      fprintf(out, reg2, spellLocation, spellName, spellMagCost);
    }
  }

  fclose(in);
  fclose(out);

  return 0;
}