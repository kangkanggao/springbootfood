package cn.edu.nyist.milk.front.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import cn.edu.nyist.milk.model.BuyerAddress;

public interface BuyerAddressRepository extends CrudRepository<BuyerAddress, Integer> {
   List<BuyerAddress>  findByBid(int bid);
}
