OPENH264_LIB_PATH = ../../openh264

# wasi sdk toolchain
WASI_SDK_SYSROOT=$(WASI_SDK_ROOT)/share/wasi-sysroot
CLANG_FLAGS=--target=wasm32-wasi

all: wasi

wasi: dec.cpp
	$(WASI_SDK_ROOT)/bin/clang++ --sysroot=$(WASI_SDK_SYSROOT) $(CLANG_FLAGS) dec.cpp -I ../inc -L .. -lopenh264dec -L $(OPENH264_LIB_PATH) -lopenh264 -o dec.wasm

native: dec.cpp
	$(CXX) dec.cpp -I ../inc/ -L .. -lopenh264dec -L $(OPENH264_LIB_PATH) -lopenh264 -lpthread -o dec

clean:
	rm dec dec.wasm
