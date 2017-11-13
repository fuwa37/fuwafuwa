package controllers

import (
	"github.com/astaxie/beego"
	//"fmt"
	"log"
	_ "github.com/go-sql-driver/mysql"
	"database/sql"
	//"encoding/json"
)

type tkantin struct {
	id int `json:"id"`
	nama string `json:"nama"`
	lokasi string `json:"lokasi"`
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
	
	TB1:=tkantin{}
	
	rows, err:=db.Query("select * from tkantin")
	
	if err !=nil {
		log.Fatal(err)
	}
	defer rows.Close()
	for rows.Next(){
		err:=rows.Scan(&TB1.id,&TB1.nama,&TB1.lokasi)
		if err !=nil {
			log.Fatal(err)
		}
		m:=map[string]interface{}{"id":TB1.id,"nama":TB1.nama,"lokasi":TB1.lokasi}
		dkantin=append(dkantin,m)
	}
	if err!=nil{
		log.Fatal(err)
	}
	err=rows.Err()
	c.Data["json"]=&dkantin
	c.ServeJSON()
}
