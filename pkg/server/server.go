package server

type Server struct {
	addr string
}

func NewServer(addr string) *Server {
	return &Server{addr}
}

func (server Server) Run() error {

	return nil
}
