package main

import (
	"os"

	"github.com/gin-gonic/gin"
)

type Response struct {
	Message string
}

func main() {
	r := gin.Default()

	r.GET("/", func(c *gin.Context) {
		c.JSON(200, Response{Message: "success"})
	})

	r.Run(":" + os.Getenv("PORTS"))
}
