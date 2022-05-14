package server

import (
	"context"

	proto "github.com/JonahPlusPlus/umami/internal/umami"
)

type Server struct {
	addr string
}

type umami struct{}

func (yum umami) GetToken(_ context.Context, call proto.Umami_getToken) error {

	return nil
}

func NewServer(addr string) *Server {
	return &Server{addr}
}

func (server Server) Run() error {
	return nil
}
