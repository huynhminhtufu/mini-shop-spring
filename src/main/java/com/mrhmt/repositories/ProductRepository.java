package com.mrhmt.repositories;

import com.mrhmt.entities.Product;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer> {
    List<Product> findByCategory_Id(int id);

    @Query("SELECT p FROM Product p")
    List<Product> paging(Pageable pageable);

    List<Product> findByNameContains(String keyword);

    @Query(value="SELECT p FROM Product p WHERE LOWER(p.name) LIKE CONCAT('%', LOWER(:name), '%')")
    List<Product> findAndPaging(@Param("name")String name, Pageable pageable);
}
