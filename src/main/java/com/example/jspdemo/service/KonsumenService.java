package com.example.jspdemo.service;

import com.example.jspdemo.model.Konsumen;
import com.example.jspdemo.repo.IKonsumenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KonsumenService {
    @Autowired
    private IKonsumenRepository konsumenRepository;

    public List<Konsumen> getAllKonsumen(String keyword) {
        if (keyword != null && !keyword.isEmpty()) {
            Konsumen konsumen = new Konsumen();
            konsumen.setNama(keyword);

            ExampleMatcher matcher = ExampleMatcher.matching()
                    .withStringMatcher(ExampleMatcher.StringMatcher.CONTAINING)
                    .withIgnoreCase()
                    .withIgnoreNullValues();

            Example<Konsumen> example = Example.of(konsumen, matcher);

            return konsumenRepository.findAll(example);
        } else {
            return konsumenRepository.findAll();
        }
    }

    public Konsumen getKonsumenById(Long id) {
        return konsumenRepository.findById(id).get();
    }

    public boolean saveOrUpdateKonsumen(Konsumen konsumen) {
        Konsumen updatedKonsumen = konsumenRepository.save(konsumen);

        if (konsumenRepository.findById(updatedKonsumen.getId()).isPresent()) {
            return true;
        }

        return false;
    }

    public boolean deleteKonsumen(Long id) {
        konsumenRepository.deleteById(id);

        if (konsumenRepository.findById(id) != null) {
            return true;
        }

        return false;
    }
}
