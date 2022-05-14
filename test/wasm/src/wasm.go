package main

import (
	"fmt"

	"github.com/JonahPlusPlus/umami/pkg/client"
)

type Person struct {
	name   string
	age    int8
	height float32
}

func main() {
	person := Person{name: "Jake", age: 45, height: 5.9}
	fmt.Println("Hello, WebAssembly! ", person)
	client.Connect()
}
