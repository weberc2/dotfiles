package main

import (
	"encoding/json"
	"io/ioutil"
	"log"
	"os"
	"path/filepath"
	"strings"
)

func createSymlink(src, dst string) error {
	relSrc, err := filepath.Rel(".", src)
	if err != nil {
		return err
	}

	dst = strings.Replace(dst, "~", os.Getenv("HOME"), -1)

	if err := os.MkdirAll(filepath.Dir(dst), 0700); err != nil {
		return err
	}

	return os.Symlink(relSrc, dst)
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

	for src, dst := range mappings {
		if err := createSymlink(src, dst); err != nil {
			log.Printf(
				"Error creating symlink for '%s' -> '%s': %v\n",
				src,
				dst,
				err,
			)
		}
	}
}
