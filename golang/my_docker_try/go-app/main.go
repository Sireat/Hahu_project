package main

import (
    "database/sql"
    "fmt"
    "log"
    "net/http"
    _ "github.com/lib/pq"
)

func main() {
    connStr := "host=postgres user=postgres password=postgrespassword dbname=my-db sslmode=disable"
    db, err := sql.Open("postgres", connStr)
    if err != nil {
        log.Fatal(err)
    }
    defer db.Close()

    err = db.Ping()
    if err != nil {
        log.Fatal(err)
    }

    fmt.Println("Successfully connected to PostgreSQL")

    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintf(w, "Hello, Go!")
    })

    http.ListenAndServe(":8082", nil) // Ensure this matches the port exposed in docker-compose.yml
}
