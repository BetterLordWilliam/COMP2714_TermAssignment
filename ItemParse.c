#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *input = "item.txt";
char *output = "item.sql";
char *query = "INSERT INTO item (locName, iName, iWeight, iValue, iDesc) VALUES";
char *end = "END";
char *reg1 = "%[^,],%[^,],%f,%d,%[^\n]";
char *reg2 = "('%s','%s',%f,%d,'%s'),\n";

int main() {
  FILE *in = fopen(input, "r");
  FILE *out = fopen(output, "w");

  fputs(query, out);
  fputs("\n", out);

  char str[256];

  while (strcmp(str, end) != 0) {
    fgets(str, 100, in);
    
    char itemName[256];
    char itemLocation[256];
    float weight = 0;
    int value = 0;
    char desc[256];

    // Yay happy moment
    if (strcmp(str, end) != 0 && sscanf(str, reg1, itemName, itemLocation, &weight, &value, desc)) {
      //printf("%s", locName);
      size_t len = strcspn(desc, "\n");
      desc[len-1] = '\0';
      fprintf(out, reg2, itemName, itemLocation, weight, value, desc);
    }
  }

  fclose(in);
  fclose(out);

  return 0;
}