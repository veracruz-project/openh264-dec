# OpenH264 decoder

Library built on top of [`openh264`](https://github.com/cisco/openh264), providing a higher level API to easily decode H264

## Example
The example in `example` decodes an H264 video and saves the decoded frames into a file.
### Build
* Build [`openh264`](https://github.com/veracruz-project/openh264) and `openh264-dec`. Both directories should be at the same filesystem level, i.e. under the same directory
* Build the example
### Run
* In wasmtime:
  ```wasmtime --dir=. dec.wasm```
* In the freestanding execution engine:
  ```RUST_LOG=debug RUST_BACKTRACE=1 cargo run -- -d in.h264 -p dec.wasm -x interp -o true -e true```
* Read the output with VLC (adjust fps and video width and height to the original video):
  ```cvlc --rawvid-fps <fps> --rawvid-width <width> --rawvid-height <height> --rawvid-chroma I420 out.yuv```
