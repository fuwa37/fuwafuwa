package models

type Tkantin struct {
	ID int `json:"id"`
	Nama string `json:"nama"`
	Lat float32 `json:"lat"`
	Lng float32 `json:"lng"`
	Desc string `json:"deskripsi"`
}

type DBkantin []Tkantin

type Tmenu struct {
	ID int `json:"id"`
	ID_kantin int `json:"id_kantin"`
	Menu string `json:"menu"`
	Harga int `json:"harga"`
	Gambar string `json:"gambar"`
}

type DBmenu []Tmenu