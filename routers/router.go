package routers

import (
	"fuwafuwa/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/main", &controllers.Kantin{})
    beego.Router("/menu", &controllers.Menu{})
    //beego.Router("/menu", &controllers.Menu{})
}
