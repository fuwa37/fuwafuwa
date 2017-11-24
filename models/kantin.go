package models

type Tkantin struct {
	ID int `json:"id"`
	Nama string `json:"nama"`
	Lat float32 `json:"lat"`
	Lng float32 `json:"lng"`
	Desc string `json:"deskripsi"`
}

type DBkantin []Tkantin