package main

import (
 "net"
 "os"
 "bufio"
 "log"
 "fmt"
 "strconv"
)

const (
 HOST = "localhost"
 PORT = "7000"
)

func handleRequest(conn net.Conn, id int) {
 name := strconv.Itoa(id) + ".csv"
 fmt.Println("Creating new file:", name)
 defer func() {
  fmt.Println("Closing file:", name)
 }()
 file, err:= os.Create("data/"+name)
 if err != nil {
  fmt.Println("Couldn't open file:", name)
  return
 }
 defer file.Close()
 scanner := bufio.NewScanner(conn) // reads lines
 for {
  if !scanner.Scan() {
   return
  }
  line := string(scanner.Bytes()) + "\n"
  if _, err := file.Write([]byte(line)); err != nil {
   return
  }
 }
}

func main() {
 listener, err := net.Listen("tcp", HOST+":"+PORT)
 if err != nil {
  log.Fatal("Error listening:", err.Error())
 }
 defer listener.Close()
 i := 1
 for {
  conn, err := listener.Accept()
  if err != nil {
   log.Fatal("Error accepting:", err.Error())
  }
  go handleRequest(conn, i)
  defer conn.Close()
  i += 1
 }
}
