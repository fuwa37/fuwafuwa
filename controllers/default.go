package controllers

import (
"github.com/astaxie/beego"
"log"
_ "github.com/go-sql-driver/mysql"
"database/sql"
"fuwafuwa/models"
)

type Kantin struct {
	beego.Controller
}

type Menu struct {
	beego.Controller
}

func (c *Kantin) Get() {
	t:=models.Tkantin{}
	dkantin:=models.DBkantin{}

	m:=models.Tmenu{}
	dmenu:=models.DBmenu{}

	db, err:=sql.Open("mysql","root:@tcp(127.0.0.1:3306)/kantin")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()
	
	rowk, err:=db.Query("select nama,lat,lng,deskripsi from tkantin")
	
	if err !=nil {
		log.Fatal(err)
	}
	defer rowk.Close()
	for rowk.Next(){
		err:=rowk.Scan(&t.Nama,&t.Lat,&t.Lng,&t.Desc)
		if err !=nil {
			log.Fatal(err)
		}
		dkantin=append(dkantin,t)
	}
	if err!=nil{
		log.Fatal(err)
	}
	err=rowk.Err()

	rowm, err:=db.Query("select tkantin.nama,tmenu.menu,tmenu.harga,tmenu.gambar from tmenu left join tkantin on tmenu.id_kantin=tkantin.id")

	if err !=nil {
		log.Fatal(err)
	}
	defer rowm.Close()
	for rowm.Next(){
		err:=rowm.Scan(&m.Kantin,&m.Menu,&m.Harga,&m.Gambar)
		if err !=nil {
			log.Fatal(err)
		}
		dmenu=append(dmenu,m)
	}
	if err!=nil{
		log.Fatal(err)
	}
	err=rowm.Err()
	
	c.Data["jsonm"]=&dmenu
	c.Data["jsonk"]=&dkantin
	
	//c.ServeJSON()
	
	//c.Layout = "index.tpl"
	c.TplName = "index.tpl"
}

func (c *Menu) Get() {
	c.TplName = "menu.tpl"
}
