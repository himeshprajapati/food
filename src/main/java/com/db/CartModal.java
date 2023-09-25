package com.db;

public class CartModal {
		private int id;
        private int customerid;
        private int productid;
        private int quantity;
        private String prodName;
        private String prodDesc;
        private String prodImage;
        private int prodPrice;
        
        
		public CartModal(int id, int customerid, int productid, int quantity, String prodName, String prodDesc, int price, String prodImage) {
			
			this.id = id;
			this.customerid = customerid;
			this.productid = productid;
			this.quantity = quantity;
			this.prodName = prodName;
			this.prodDesc = prodDesc;
			this.prodImage = prodImage;
			this.prodPrice = price;
		}

		
		

		public int getId() {
			return id;
		}


		public void setId(int id) {
			this.id = id;
		}


		public int getCustomerid() {
			return customerid;
		}


		public void setCustomerid(int customerid) {
			this.customerid = customerid;
		}


		public int getProductid() {
			return productid;
		}


		public void setProductid(int productid) {
			this.productid = productid;
		}


		public int getQuantity() {
			return quantity;
		}


		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}
		
		   
        public String getProdName() {
			return prodName;
		}


		public void setProdName(String prodName) {
			this.prodName = prodName;
		}


		public String getProdDesc() {
			return prodDesc;
		}


		public void setProdDesc(String prodDesc) {
			this.prodDesc = prodDesc;
		}


		public String getProdImage() {
			return prodImage;
		}


		public void setProdImage(String prodImage) {
			this.prodImage = prodImage;
		}


		public int getProdPrice() {
			return prodPrice;
		}


		public void setProdPrice(int prodPrice) {
			this.prodPrice = prodPrice;
		}

       
}
