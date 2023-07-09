package main

import (
	"log"

	"github.com/gofiber/fiber/v2"
)

type Response struct {
	data []ListItem
	code int
}

type ListItem struct {
	Title         string `json:"title"`
	Content       string `json:"content"`
	Username      string `json:"username"`
	Category      string `json:"category"`
	LikeCount     int    `json:"like_count"`
	CommentsCount int    `json:"comments_count"`
}

func main() {
	app := fiber.New()

	// home follow
	app.Get("/api/follow", func(c *fiber.Ctx) error {

		messages := []ListItem{}

		for i := 0; i < 10; i++ {
			messages = append(messages, ListItem{
				Title:         "如何使用CSS创建高级动画，这个函数必须掌握",
				Content:       "因此如果我们要将相机实时流 CameraImage 转为yuv 或 rgba 后给opencv 或 tflite 来做后续动作，那么建议使用 ffi / method channel将数据传给 c++ 层 opencv 的 cvtColor 来转换，效率高很多！当然如果对实时流的效率要求没那么高，imageLib.Image 也是完全足以的",
				Username:      "JunIce",
				Category:      "Javascript",
				LikeCount:     200,
				CommentsCount: 300,
			})
		}

		return c.Status(200).JSON(fiber.Map{
			"code": 200,
			"data": messages,
		})
	})

	log.Fatal(app.Listen(":3001"))
}
