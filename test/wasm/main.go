package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"os/exec"
	"path/filepath"
)

func main() {
	cmd := exec.Command("go", "build", "-o", "../www/main.wasm")
	path, err := os.Getwd()

	if err != nil {
		log.Fatal(err)
	}

	cmd.Dir = path + filepath.FromSlash("/test/wasm/go")
	cmd.Env = os.Environ()
	cmd.Env = append(cmd.Env, "GOOS=js")
	cmd.Env = append(cmd.Env, "GOARCH=wasm")

	err = cmd.Run()

	if err != nil {
		log.Fatal(err)
	}

	fmt.Println("Running web server on http://127.0.0.1:8080/index.html")
	http.ListenAndServe("127.0.0.1:8080", http.FileServer(http.Dir(path+filepath.FromSlash("/test/wasm/www/"))))
}
