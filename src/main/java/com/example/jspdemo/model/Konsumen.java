package com.example.jspdemo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "konsumen")
public class Konsumen {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Nama is required")
    private String nama;

    @NotBlank(message = "Alamat is required")
    private String alamat;

    @NotBlank(message = "Kota is required")
    private String kota;

    @NotBlank(message = "Provinsi is required")
    private String provinsi;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @NotNull(message = "Tanggal Registrasi is required")
    private Date tglRegistrasi;

    @NotBlank(message = "Status is required")
    private String status;
}
