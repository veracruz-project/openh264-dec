#include <stdlib.h>

#include "h264dec.h"

int main() {
	int32_t x = h264_decode("in2.h264", "out2.yuv");
	return x;
}
