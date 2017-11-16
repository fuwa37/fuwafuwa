package controllers

import (
	"github.com/astaxie/beego"
	//"fmt"
	"log"
	_ "github.com/go-sql-driver/mysql"
	"database/sql"
	//"encoding/json"
)

type tbkantin struct {
	id string `json:"id"`
	nama string `json:"nama"`
	lat string `json:"lat"`
	lng string `json:"lng"`
	desc string `json:"deskripsi"`
}

type DB map[string]interface{}

var dkantin []DB

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {
	db, err:=sql.Open("mysql","root:@tcp(127.0.0.1:3306)/kantin")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()
	
	TB1:=tbkantin{}
	
	rows, err:=db.Query("select * from tbkantin")
	
	if err !=nil {
		log.Fatal(err)
	}
	defer rows.Close()
	for rows.Next(){
		err:=rows.Scan(&TB1.id,&TB1.nama,&TB1.lat,&TB1.lng,&TB1.desc)
		if err !=nil {
			log.Fatal(err)
		}
		m:=map[string]interface{}{"id":TB1.id,"nama":TB1.nama,"lat":TB1.lat,"lng":TB1.lng,"deskripsi":TB1.desc}
		dkantin=append(dkantin,m)
	}
	if err!=nil{
		log.Fatal(err)
	}
	err=rows.Err()
	c.Data["json"]=&dkantin
	//c.ServeJSON()
	c.TplName = "index.tpl"
}
