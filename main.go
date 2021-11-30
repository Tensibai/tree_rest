package main

import "github.com/gin-gonic/gin"

func SetupRouter() *gin.Engine {
	r := gin.Default()
	r.GET("/tree", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"myFavouriteTree": "maple",
		})
	})
	return r
}

func main() {
	r := SetupRouter()
	r.Run() // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}
