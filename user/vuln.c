#include "kernel/types.h"
#include "kernel/fcntl.h"
#include "user/user.h"

// gets api found in linux
void lgets(char *input) {
  int i = 0;
  while (1) {
    char c;
    read(0, &c, 1);
    input[i] = c;
    if (c == '\n') {
      break;
    }
    i++;
  }
  input[i] = 0;
}

void win() {
  int fd = open("flag.txt", O_RDONLY);
  char buf[128];
  int n_read = read(fd, buf, 128);
  write(1, buf, n_read);
  exit(0);
}

int sumbytes() {
  char buf[128];
  lgets(buf);
  int sum = 0;
  int i = 0;
  while (buf[i] != 0) {
    sum += buf[i++];
  }
  return sum;
}

int main(int argc, char *argv[]) {
  int sum = sumbytes();
  printf("%d\n", sum);
  exit(0);
}
