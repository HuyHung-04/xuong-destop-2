package com.example.ASM.ASMGD1.controller;

import com.example.ASM.ASMGD1.entity.SanPham;
import com.example.ASM.ASMGD1.service.SanPhamSerVice;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.SneakyThrows;
import org.apache.commons.beanutils.BeanUtils;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

@WebServlet(name = "SanPhamController", value = {
        "/sanpham/sp-hienthi",
        "/sanpham/sp-viewadd",
        "/sanpham/sp-viewupdate",
        "/sanpham/sp-detail",
        "/sanpham/sp-delete",
        "/sanpham/sp-add",
        "/sanpham/sp-update"
})
public class SanPhamController extends HttpServlet {
    private SanPhamSerVice Sersp = new SanPhamSerVice();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        if(uri.contains("sp-hienthi")){
            hienthi(req,resp);
        }
        else if(uri.contains("sp-viewadd")){
            viewadd(req,resp);
        }
        else if(uri.contains("sp-viewupdate")){
            viewupdate(req,resp);
        }
        else if(uri.contains("sp-detail")){
            detail(req,resp);
        }
        else if(uri.contains("sp-delete")){
            delete(req,resp);
        }
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Sersp.deleteSanPham(Integer.valueOf(req.getParameter("id")));
        resp.sendRedirect("/sanpham/sp-hienthi");
    }

    private void detail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("sp",Sersp.getIdSanPham(Integer.valueOf(req.getParameter("id"))));
        req.getRequestDispatcher("/ASMGD1/sp-detail.jsp").forward(req,resp);
    }

    private void viewupdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("sp",Sersp.getIdSanPham(Integer.valueOf(req.getParameter("id"))));
        req.getRequestDispatcher("/ASMGD1/sp-update.jsp").forward(req,resp);
    }

    private void viewadd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/ASMGD1/sp-viewadd.jsp").forward(req,resp);
    }

    private void hienthi(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("danhSach",Sersp.getAll());
        req.getRequestDispatcher("/ASMGD1/sp-hienthi.jsp").forward(req,resp);
    }

    @SneakyThrows
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uri = req.getRequestURI();
        if(uri.contains("sp-add")){
            addSanPham(req,resp);
        }
        else if(uri.contains("sp-update")){
            updateSanPham(req,resp);
        }
    }

    private void updateSanPham(HttpServletRequest req, HttpServletResponse resp) throws InvocationTargetException, IllegalAccessException, IOException {
        SanPham sp = new SanPham();
        BeanUtils.populate(sp,req.getParameterMap());
        Sersp.updateSanPham(sp);
        resp.sendRedirect("/sanpham/sp-hienthi");
    }

    private void addSanPham(HttpServletRequest req, HttpServletResponse resp) throws InvocationTargetException, IllegalAccessException, IOException {
        SanPham sp = new SanPham();
        BeanUtils.populate(sp,req.getParameterMap());
        Sersp.addSanPham(sp);
        resp.sendRedirect("/sanpham/sp-hienthi");
    }
}
