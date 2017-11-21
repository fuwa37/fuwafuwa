package controllers

import (
	"github.com/astaxie/beego"
	"fmt"
	"log"
	_ "github.com/go-sql-driver/mysql"
	"database/sql"
)

type tbkantin struct {
	ID string `json:"id"`
	Nama string `json:"nama"`
	Lat string `json:"lat"`
	Lng string `json:"lng"`
	Desc string `json:"deskripsi"`
}

type dbkantin []tbkantin

type MainController struct {
	beego.Controller
}

type Tes struct {
	beego.Controller
}

func (c *MainController) Get() {
	t:=tbkantin{}
	dkantin:=dbkantin{}

	db, err:=sql.Open("mysql","root:@tcp(127.0.0.1:3306)/kantin")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()
	
	rows, err:=db.Query("select * from tbkantin")
	
	if err !=nil {
		log.Fatal(err)
	}
	defer rows.Close()
	for rows.Next(){
		err:=rows.Scan(&t.ID,&t.Nama,&t.Lat,&t.Lng,&t.Desc)
		if err !=nil {
			log.Fatal(err)
		}
		dkantin=append(dkantin,t)
	}
	if err!=nil{
		log.Fatal(err)
	}
	err=rows.Err()

	fmt.Println()
	c.Data["json"]=&dkantin
	//c.ServeJSON()
	c.TplName = "index.tpl"
}
