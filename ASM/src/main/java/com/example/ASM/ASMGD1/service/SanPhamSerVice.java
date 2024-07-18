package com.example.ASM.ASMGD1.service;

import com.example.ASM.ASMGD1.entity.SanPham;

import java.util.ArrayList;
import java.util.List;

public class SanPhamSerVice {
    List<SanPham> danhSach = new ArrayList<>();
    public SanPhamSerVice(){
        danhSach.add(new SanPham(1,"SP1","Áo",true));
        danhSach.add(new SanPham(2,"SP2","Quần",true));
        danhSach.add(new SanPham(3,"SP3","Tất",false));
        danhSach.add(new SanPham(4,"SP4","Mũ",true));
    }

    public List<SanPham> getAll(){
        return danhSach;
    }

    public SanPham getIdSanPham(int id){
        for (SanPham sp: danhSach){
            if(sp.getId().equals(id)){
                return sp;
            }
        }
        return null;
    }

    public void addSanPham(SanPham sp){
        danhSach.add(sp);
    }

    public void deleteSanPham(int id){
        for (SanPham sp: danhSach){
            if(sp.getId().equals(id)){
                danhSach.remove(sp);
                break;
            }
        }
    }

    public void updateSanPham(SanPham sp){
        for (int i = 0; i<danhSach.size(); i++){
            if(danhSach.get(i).getId().equals(sp.getId())){
                danhSach.set(i,sp);
                break;
            }
        }
    }
}
