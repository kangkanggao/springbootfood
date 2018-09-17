package cn.edu.nyist.food.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "buyer_info")
public class BuyerInfo implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private String buyerOpenid;
	private String buyerName;
	private String buyerPwd;

	public BuyerInfo() {

	}

	public String getBuyerOpenid() {
		return buyerOpenid;
	}

	public void setBuyerOpenid(String buyerOpenid) {
		this.buyerOpenid = buyerOpenid;
	}

	public String getBuyerName() {
		return buyerName;
	}

	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}

	public String getBuyerPwd() {
		return buyerPwd;
	}

	public void setBuyerPwd(String buyerPwd) {
		this.buyerPwd = buyerPwd;
	}

}
