OPENH264_LIB_PATH = ../../openh264

# wasi sdk toolchain
WASI_SDK_SYSROOT=$(WASI_SDK_ROOT)/share/wasi-sysroot
CLANG_FLAGS=--target=wasm32-wasi
CC=$(WASI_SDK_ROOT)/bin/clang++ --sysroot=$(WASI_SDK_SYSROOT) $(CLANG_FLAGS)
CXX=$(CC)

all: dec.cpp
	$(CXX) dec.cpp -I ../inc/ -L .. -lh264dec -L $(OPENH264_LIB_PATH) -lopenh264 -o dec.wasm
