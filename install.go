package main

import (
	"io/ioutil"
	"log"
	"os"
	"path/filepath"
	"sdfasdfencoding/json"
	"strings"

	"github.com/fatih/color"
)

func createSymlink(src, dst string) error {
	absSrc, err := filepath.Abs(src)
	if err != nil {
		return err
	}

	absDst, err := filepath.Abs(
		strings.Replace(dst, "~", os.Getenv("HOME"), -1),
	)
	if err != nil {
		return err
	}

	if err := os.MkdirAll(filepath.Dir(absDst), 0700); err != nil {
		return err
	}

	return os.Symlink(absSrc, absDst)
}

func main() {
	data, err := ioutil.ReadFile("./mappings.json")
	if err != nil {
		log.Fatal(err)
	}

	mappings := map[string]string{}
	if err := json.Unmarshal(data, &mappings); err != nil {
		log.Fatal(err)
	}

	// Find the lengths of the longest keys and values. These will be used to
	// pad the output columns.
	longestSrc := 0
	longestDst := 0
	for src, dst := range mappings {
		if len(src) > longestSrc {
			longestSrc = len(src)
		}
		if len(dst) > longestDst {
			longestDst = len(dst)
		}
	}

	// Create a symlink for each mapping ignoring existing symlinks.
	for src, dst := range mappings {
		paddingSrc := strings.Repeat(" ", longestSrc-len(src))
		if err := createSymlink(src, dst); err != nil {
			paddingDst := strings.Repeat(" ", longestDst-len(dst))
			if os.IsExist(err) {
				color.Green(
					"%s%s -> %s%s (Already exists)",
					src,
					paddingSrc,
					dst,
					paddingDst,
				)
			} else {
				color.Red(
					"%s%s -> %s:%s %v\n",
					src,
					paddingSrc,
					dst,
					paddingDst,
					err,
				)
			}
		} else {
			color.Green("%s%s -> %s", src, paddingSrc, dst)
		}
	}
}
