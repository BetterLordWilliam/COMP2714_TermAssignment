#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *input = "location.txt";
char *output = "location.sql";
char *query = "INSERT INTO location VALUES";
char *end = "END";
char *reg1 = "%[^\n]\n";
char *reg2 = "('%s'),\n";

int main() {
  FILE *in = fopen(input, "r");
  FILE *out = fopen(output, "w");

  fputs(query, out);
  fputs("\n", out);

  char str[100];

  while (strcmp(str, end) != 0) {
    fgets(str, 100, in);
    
    char locName[100];

    // Yay happy moment
    if (strcmp(str, end) != 0 && sscanf(str, reg1, locName)) {
      printf("%s", locName);
      fprintf(out, reg2, locName);
    }
  }

  fclose(in);
  fclose(out);

  return 0;
}