#include "../src/logger.h"

int main() {
    logger_set_level(DEBUG);
    logger(DEBUG, "debug");
    logger(INFO, "info");
    logger(WARNING, "warning");
    logger(ERROR, "error");
    logger(FATAL, "fatal");

    return 0;
}
