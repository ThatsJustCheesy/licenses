# licenses

## Automatically compile software component licenses

`licenses` is a super simple command-line tool that automates compiling licenses of software components into a single file that the end user can read.

Sound boring? Well, to be honest, it is. That's why `licenses` exists: less boring work for you!

## Build from source

For an optimized build, run

    swift build --configuration release

in the root of the repository. Then, to install it on your local machine:

    cp .build/release/licenses /usr/local/bin

## Use

### Tool

Type `licenses --help` for a brief synopsis.

At the moment, the tool has no command-line options. It simply looks in the current directory for a config file, `licenses.yaml`, and in a `licenses` subdirectory for license text files, and dumps a compiled license file to standard output.

### Config file

The `licenses.yaml` config file lists out (a) licenses used and (b) copyright strings for components under each license. New components can be added in a snap, especially if they use the same license already in use by another component.

See the example file for details on the format.

### License text files

`txt` files placed in the `licenses` directory are used to contain the full legal text of each license in use. The tool copies the full text of each license used by the config file into the output.

### Examples

See `licenses.yaml` and the `licenses` directory in this repository, which describe the third-party code licenses for the tool itself. `licenses.yaml` contains explanations of each configuration key.

## Architecture

All of the actual functionality of the tool is contained in a static library built with the Swift Package Manager. This library has rudimentary tests, and can also be plugged into directly if desired for more customizable functionality.

## Portability

This tool has been tested on macOS (10.15.4). It should work on Linux in theory, but this has not been tested.
