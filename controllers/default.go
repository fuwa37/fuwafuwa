package controllers

import (
"github.com/astaxie/beego"
"log"
_ "github.com/go-sql-driver/mysql"
"database/sql"
"fuwafuwa/models"
"strconv"
)

type Kantin struct {
	beego.Controller
}

type Menu struct {
	beego.Controller
}

type Req struct {
	beego.Controller
}

type Main struct {
	beego.Controller
}

func setDB() *sql.DB {
	db, err:=sql.Open("mysql","root:@tcp(167.205.67.251:3306)/kantin")
	err=db.Ping()
	if err != nil {
		db, err=sql.Open("mysql","kantin:Nb8rE2W~-82H@tcp(den1.mysql6.gear.host:3306)/kantin")
		if err != nil {
			log.Fatal(err)
		}
	}

	return db
}

func (c *Main) Prepare() {
	var temp int
	var id int

	session := c.StartSession()
	ID := session.Get("ID")
	if ID != nil {
	}

	db:=setDB()
	defer db.Close()

	row, err:=db.Query("select id from reqkantin")
	if err !=nil {
		log.Fatal(err)
	}
	defer row.Close()
	for row.Next(){
		temp=id
		err:=row.Scan(&id)
		if err !=nil {
			log.Fatal(err)
		}
	}
	ID=temp
	if err!=nil{
		log.Fatal(err)
	}
	err=row.Err()

	session.Set("ID",id+1)
	log.Print(id)
}

func getKantin() models.DBkantin {

	t:=models.Tkantin{}
	dkantin:=models.DBkantin{}

	db:=setDB()
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

	return dkantin
}

func getMenu() models.DBmenu {
	m:=models.Tmenu{}
	dmenu:=models.DBmenu{}

	db:=setDB()
	defer db.Close()

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

	return dmenu
}

func (c *Kantin) Get() {
	dkantin:=getKantin()

	c.Data["jsonk"]=&dkantin
	c.TplName = "index.tpl"
}

func (c *Menu) Get() {
	dmenu:=getMenu()

	c.Data["jsonm"]=&dmenu
	c.TplName = "menu.tpl"
}

func (c *Main) Get() {
	dmenu:=getMenu()
	dkantin:=getKantin()

	c.Data["jsonk"]=&dkantin
	c.Data["jsonm"]=&dmenu
	c.TplName = "main.tpl"
}

func (c *Main) Post() {
	session := c.StartSession()
	ID := session.Get("ID")
	if ID != nil {
		db:=setDB()

		stmt, err := db.Prepare("INSERT reqkantin SET id=?, nama=?,lat=?,lng=?")
		if err != nil {
			log.Fatal(err)
		}
		defer stmt.Close()

		_, err = stmt.Exec(ID,c.GetString("nama"),c.GetString("ltd"),c.GetString("lng"))
		if err != nil {
			log.Fatal(err)
		}
		c.Redirect("/req",302)
	}
}

func (c *Req) Get() {
	c.TplName="req.tpl"
}

func (c *Req) Post() {
	session := c.StartSession()
	ID := session.Get("ID")
	if ID != nil {
		db:=setDB()

		stmt, err := db.Prepare("INSERT reqmenu SET id_kantin=?, menu=?,harga=?")
		if err != nil {
			log.Fatal(err)
		}
		defer stmt.Close()

		j,_:=strconv.Atoi(c.GetString("count"))
		for i:=1;i<=j;i++{
			k:=strconv.Itoa(i)
			a:="menu"+k
			b:="harga"+k
			_, err = stmt.Exec(ID,c.GetString(a),c.GetString(b))
			if err != nil {
				log.Fatal(err)
			}
		}

		c.TplName="trm.tpl"
	}
}
