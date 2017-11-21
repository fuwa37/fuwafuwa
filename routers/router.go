package routers

import (
	"fuwafuwa/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.MainController{})
    beego.Router("/tes",&controllers.Tes{})
}
