OPENH264_LIB_PATH = ../../openh264

all: dec.cpp
	#$(CXX) dec.cpp -I ../inc/ -L .. -lh264dec -L $(OPENH264_LIB_PATH) -l:$(OPENH264_LIB_PATH)/libopenh264.a -pthread
	$(CXX) dec.cpp -I ../inc/ -L .. -lh264dec -L $(OPENH264_LIB_PATH) -lopenh264
