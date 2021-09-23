/*
H.264 decoding library, based on the OpenH264 codec library

AUTHORS

The Veracruz Development Team.

COPYRIGHT AND LICENSING

See the `LICENSE_MIT.markdown` file in the root directory for copyright and
licensing information.
Based on the OpenH264 codec library, BSD license (https://github.com/cisco/openh264)
*/

#include <string>

using namespace std;

int32_t h264_decode(string strInputFile, string strOutputFile, bool saveOutput, void (*onFrameReady)(SBufferInfo *));
