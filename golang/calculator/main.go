package main

import (
	"encoding/json"
	"fmt"
	"net/http"
	"strconv"
)

// Payload struct to map the JSON input
type Payload struct {
	Arg1 float64 `json:"arg1"`
	Arg2 float64 `json:"arg2"`
}

// Result struct to map the JSON output
type Result struct {
	Result float64 `json:"result"`
}

func addHandler(w http.ResponseWriter, r *http.Request) {
	arg1, arg2, err := parseQueryParams(r)
	if err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	result := Result{Result: arg1 + arg2}
	json.NewEncoder(w).Encode(result)
}

func subHandler(w http.ResponseWriter, r *http.Request) {
	arg1, arg2, err := parseQueryParams(r)
	if err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	result := Result{Result: arg1 - arg2}
	json.NewEncoder(w).Encode(result)
}

func mulHandler(w http.ResponseWriter, r *http.Request) {
	var payload Payload
	if err := json.NewDecoder(r.Body).Decode(&payload); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	result := Result{Result: payload.Arg1 * payload.Arg2}
	json.NewEncoder(w).Encode(result)
}

func divHandler(w http.ResponseWriter, r *http.Request) {
	var payload Payload
	if err := json.NewDecoder(r.Body).Decode(&payload); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	if payload.Arg2 == 0 {
		http.Error(w, "cannot divide by zero", http.StatusBadRequest)
		return
	}
	result := Result{Result: payload.Arg1 / payload.Arg2}
	json.NewEncoder(w).Encode(result)
}

func parseQueryParams(r *http.Request) (float64, float64, error) {
	//r.Method if else condion
	arg1Str := r.URL.Query().Get("arg1")
	arg2Str := r.URL.Query().Get("arg2")
	arg1, err1 := strconv.ParseFloat(arg1Str, 64)
	arg2, err2 := strconv.ParseFloat(arg2Str, 64)
	if err1 != nil || err2 != nil {
		return 0, 0, fmt.Errorf("invalid query parameters")
	}
	return arg1, arg2, nil
}

func main() {
	http.HandleFunc("/add", addHandler)
	http.HandleFunc("/sub", subHandler)
	http.HandleFunc("/mul", mulHandler)
	http.HandleFunc("POST /div", divHandler)

	fmt.Println("Starting server on :8000")
	http.ListenAndServe(":8000", nil)
}