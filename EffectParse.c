#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *input = "effect.txt";
char *output = "effect.sql";
char *query = "INSERT INTO effect (duration, radius, edesc) VALUES";
char *end = "END";
char *reg1 = "%f,%d,%[^\n]\n";
char *reg2 = "(%f,%d,'%s'),\n";

int main() {
  FILE *in = fopen(input, "r");
  FILE *out = fopen(output, "w");

  fputs(query, out);
  fputs("\n", out);

  char str[100];

  while (strcmp(str, end) != 0) {
    fgets(str, 100, in);
    
    char effectDesc[100];
    float duration = 0;
    int radius = 0;

    // Yay happy moment
    if (strcmp(str, end) != 0 && sscanf(str, reg1, &duration, &radius, effectDesc)) {
      //printf("%s", locName);
      size_t len = strcspn(effectDesc, "\n");
      effectDesc[len-1] = '\0';
      fprintf(out, reg2, duration, radius, effectDesc);
    }
  }

  fclose(in);
  fclose(out);

  return 0;
}