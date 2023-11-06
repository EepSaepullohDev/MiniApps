package com.example.jspdemo.repo;

import com.example.jspdemo.model.Konsumen;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IKonsumenRepository extends JpaRepository<Konsumen, Long> {
}
