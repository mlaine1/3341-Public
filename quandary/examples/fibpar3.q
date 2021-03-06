Q main(int arg) {
    return [ fibConcurrent(arg, 4) . fibSerial(arg) ];
}

int fibSerial(int n) {
    if (n < 2) return n;
    return fibSerial(n - 1) + fibSerial(n - 2);
}

int fibConcurrent(int n, int level) {
    if (n < 2) return n;
    if (level <= 0)
       return fibConcurrent(n - 1, level - 1) + fibConcurrent(n - 2, level - 1);
    return [ fibConcurrent(n - 1, level - 1) + fibConcurrent(n - 2, level - 1) ];
}