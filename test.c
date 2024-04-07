#include <assert.h>
#include <string.h>

int ircd_strlen(char *p);
int ircd_stoi(char *p, int *err);
void ircd_draw_row(int width, int row, char *p);
void ircd_memset(char *dest, char b, size_t size);

void test_ircd_strlen() { assert(ircd_strlen("hello world") == 11); }

void test_ircd_stoi() {
  int i = 0;
  int err = 0;

  i = ircd_stoi("", &err);
  assert(i == 0 && err == 0);

  err = 0;
  i = ircd_stoi("10", &err);
  assert(i == 10 && err == 0);

  ircd_stoi("abc", &err);
  assert(err == 1);
}

void test_ircd_draw_row() {
  const int size = 10;
  const char *rows[10] = {
      "    *    ", "   ***   ", "  *****  ", " ******* ", "*********",
  };

  char row[10];
  row[9] = 0;
  for (int i = 0; i < size / 2; i++) {
    memset(row, ' ', 9);
    ircd_draw_row(size - 1, i, row);
    assert(strcmp(row, rows[i]) == 0);
  }
}

void test_ircd_memset() {
  char data[5];
  ircd_memset(data, '*', 4);
  data[4] = 0;
  assert(strcmp(data, "****") == 0);
}

int main(int argc, char **argv) {
  test_ircd_strlen();
  test_ircd_stoi();
  test_ircd_draw_row();
  test_ircd_memset();
  return 0;
}
