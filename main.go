package main

import (
_ "fuwafuwa/routers"
"github.com/astaxie/beego"
"github.com/astaxie/beego/session"
)

func main() {
	sessionconf := &session.ManagerConfig{
		CookieName: "begoosessionID",
		Gclifetime: 3600,
	}
	beego.GlobalSessions, _ = session.NewManager("memory", sessionconf)
	go beego.GlobalSessions.GC()
	beego.Run()
}

