package com.example.ASM.ASMGD1.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SanPham {
    private Integer id;
    private String ma;
    private String ten;
    private boolean trangThai;
}
