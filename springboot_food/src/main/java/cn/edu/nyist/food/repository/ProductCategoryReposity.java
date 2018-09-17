package cn.edu.nyist.food.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import cn.edu.nyist.food.model.ProductCategory;
public interface ProductCategoryReposity extends JpaRepository<ProductCategory,Integer>{
  
}
