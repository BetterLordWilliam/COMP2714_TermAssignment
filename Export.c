#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *tables[] = {
  "item", "spell", "effect", "alteration", "armour", "book", 
  "conjuration", "defensive", "destruction", "food",
  "illusion", "ingredients", "keyitem", "location", "offensive",
  "potion", "restoration", "scroll", "weapon"
};
int size = 19;

/**
 * main:    contains the logic for exporting the SQL data into csv files
*/
int main() {
  
  FILE *out = fopen("./Export.sql", "w");
  char *query = 
  "SELECT * FROM %s "
  "INTO OUTFILE '%s'"
  "FIELDS TERMINATED BY ','"
  "ENCLOSED BY '\"'"
  "LINES TERMINATED BY '\\n';";            // SQL query as literal

  // Create query text for all the tables
  for (int i = 0; i < size; i++) {
    char *currentTable = tables[i];
    char *path = malloc(sizeof(char) * 100);
    strcat(path, "D:/BCIT/L1/Sem2/COMP2714/TermProject/COMP2714_TermAssignment/CSV/");
    strcat(path, currentTable);
    strcat(path, ".csv");
    // FILE *temp = fopen(path, "w");                   // Create file hack -- NOT REQUIRED
    fprintf(out, query, currentTable, path);            // Put it to specific file at specific location
    fprintf(out, "\n");                                 // Newline between queries
  }

  return 0;
}