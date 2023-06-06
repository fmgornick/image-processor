# image processor

## dependencies

**FFTW**: C library for computing the fast fourier transform, used for $O(n \log(n))$ time image convolution. Download can be found [here](https://www.fftw.org/download.html).

## run

To compile this program, simply compile with the following command (add `-j` for multithreaded make)...

```sh
make -j
```

finally, to run this program, type

```sh
./image-processor-app <INPUT> <FILTER> <OUTPUT>
```

where `INPUT` and `OUTPUT` are the paths to the image input and output, and `FILTER` is the name of the filter you wish to apply.

### currently supported filter options

- canny-edge-detect
- double_threshold
- gaussian_blur
- greyscale
- hysteresis
- invert
- mean_blur
- non_max
- purplescale
- sharpening
- sobel
- solarization
- threshold
- threshold-low
- threshold-high
