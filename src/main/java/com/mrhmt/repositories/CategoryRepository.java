package com.mrhmt.repositories;

import com.mrhmt.entities.Category;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CategoryRepository extends JpaRepository<Category, Integer> {
    @Query(value="SELECT c FROM Category c")
    List<Category> paging(Pageable pageable);

    List<Category> findByNameContains(String keyword);

    @Query(value="SELECT c FROM Category c WHERE LOWER(c.name) LIKE CONCAT('%', LOWER(:name), '%')")
    List<Category> findAndPaging(@Param("name")String name, Pageable pageable);
}