#include <assert.h>
#include <stdio.h>

int ircd_strlen(char *p);
int ircd_stoi(char *p, int *err);

int main(int argc, char **argv) {
  assert(ircd_strlen("hello world") == 11);

  int i = 0;
  int err = 0;

  i = ircd_stoi("", &err);
  assert(i == 0 && err == 0);

  err = 0;
  i = ircd_stoi("10", &err);
  assert(i == 10 && err == 0);

  ircd_stoi("abc", &err);
  assert(err == 1);

  return 0;
}
