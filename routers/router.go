package routers

import (
	"fuwafuwa/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/kantin", &controllers.Kantin{})
    beego.Router("/menu", &controllers.Menu{})
    beego.Router("/main", &controllers.Main{})
}
