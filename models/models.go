package models

type Tkantin struct {
	//ID int `json:"id"`
	Nama string `json:"Nama"`
	Lat float32 `json:"lat"`
	Lng float32 `json:"lng"`
	Desc string `json:"deskripsi"`
}

type DBkantin []Tkantin

type Tmenu struct {
	//ID int `json:"id"`
	//ID_kantin int `json:"id_kantin"`
	Kantin string `json:"Kantin"`
	Menu string `json:"Menu"`
	Harga int `json:"Harga (Rp.)"`
	Gambar string `json:"Gambar"`
}

type DBmenu []Tmenu