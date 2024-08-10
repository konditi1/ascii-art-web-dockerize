package main

import (
	"fmt"
	"net/http"

	webart "webart/handler"
)

func main() {
	fs := http.FileServer(http.Dir("static"))
	http.Handle("/static/", http.StripPrefix("/static/", fs))
	http.HandleFunc("/", webart.Asciiweb)
	err := http.ListenAndServe(":7050", nil)
	if err != nil {
		fmt.Println(err)
		return
	}
}
