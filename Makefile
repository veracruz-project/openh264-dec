# openh264-dec Makefile
#
# AUTHORS
#
# The Veracruz Development Team.
#
# COPYRIGHT AND LICENSING
#
# See the `LICENSE_MIT.markdown` file in the root directory for copyright and
# licensing information.

OBJ=wasm
AR_OPTS=cr $@
SRC_PATH = ../openh264/

# wasi sdk toolchain
WASI_SDK_SYSROOT=$(WASI_SDK_ROOT)/share/wasi-sysroot
CLANG_FLAGS=--target=wasm32-wasi
CC=$(WASI_SDK_ROOT)/bin/clang --sysroot=$(WASI_SDK_SYSROOT) $(CLANG_FLAGS)
CXX=$(WASI_SDK_ROOT)/bin/clang++ --sysroot=$(WASI_SDK_SYSROOT) $(CLANG_FLAGS)
AR=$(WASI_SDK_ROOT)/bin/ar

INCLUDES += -I$(SRC_PATH)codec/api/svc -I$(SRC_PATH)codec/common/inc -Icodec/common/inc

DECODER_INCLUDES += \
    -I$(SRC_PATH)codec/decoder/core/inc \
    -I$(SRC_PATH)codec/decoder/plus/inc

H264DEC_INCLUDES += $(DECODER_INCLUDES) -I./inc
H264DEC_SRCDIR=.
H264DEC_CPP_SRCS=\
	$(H264DEC_SRCDIR)/src/d3d9_utils.cpp\
	$(H264DEC_SRCDIR)/src/h264dec.cpp\

H264DEC_OBJS += $(H264DEC_CPP_SRCS:.cpp=.$(OBJ))

OBJS += $(H264DEC_OBJS)

$(H264DEC_SRCDIR)/%.$(OBJ): $(H264DEC_SRCDIR)/%.cpp
	$(QUIET_CXX)$(CXX) $(CFLAGS) $(CXXFLAGS) $(INCLUDES) $(H264DEC_CFLAGS) $(H264DEC_INCLUDES) -c $(CXX_O) $< -o $@

libopenh264dec_wasm.a: $(H264DEC_OBJS)
	$(QUIET)rm -f $@
	$(QUIET_AR)$(AR) $(AR_OPTS) $+
ifeq (True, $(PROCESS_FILES))
	cp $@ $(LIBPREFIX)openh264dec_wasm.$(DEBUGSYMBOLS_TAG).$(LIBSUFFIX)
	$(STRIP) $(STRIP_FLAGS) $@ -o $@
endif

libraries: libopenh264dec_wasm.a

clean:
	rm src/*.$(OBJ)
	rm libopenh264dec_wasm.a
