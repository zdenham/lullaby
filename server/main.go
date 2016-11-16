package main

import (
 "net"
 "os"
 "bufio"
 "log"
)

const (
 HOST = "localhost"
 PORT = "7000"
)

func getString(scanner *bufio.Scanner) string {
 if !scanner.Scan() {
  return ""
 } else {
  return string(scanner.Bytes())
 }
}

func handleRequest(conn net.Conn) {
  scanner := bufio.NewScanner(conn) // reads lines
  scanner.Scan()
  name := getString(scanner)
  for {
   
  }
}

func main() {
 listener, err := net.Listen("tcp", CONN_HOST+":"+CONN_PORT)
 if err != nil {
  log.Fatal("Error listening: ", err.Error())
 }
 defer listener.Close()
 fmt.Println("Listening on " + HOST + ":" + PORT)
 for {
  conn, err := l.Accept()
  if err != nil {
   log.Fatal("Error accepting: ", err.Error())
  }
  go handleRequest(conn)
  defer conn.Close()
 }
}
