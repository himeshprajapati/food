package com.db;


	public class ProductModal {
		private int id;
        private String productName;
        private String prodDesc;
        private String type;
        private int price;
        private String image;
        
		public ProductModal(int id, String productName, String prodDesc, String type, int price, String image) {
			// TODO Auto-generated constructor stub
			this.id = id;
			this.productName = productName;
			this.prodDesc = prodDesc;
			this.type = type;
			this.price = price;
			this.image = image;
			
		}

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getProductName() {
			return productName;
		}

		public void setProductName(String productName) {
			this.productName = productName;
		}

		public String getProdDesc() {
			return prodDesc;
		}

		public void setProdDesc(String prodDesc) {
			this.prodDesc = prodDesc;
		}

		public String getType() {
			return type;
		}

		public void setType(String type) {
			this.type = type;
		}

		public int getPrice() {
			return price;
		}

		public void setPrice(int price) {
			this.price = price;
		}

		public String getImage() {
			return image;
		}

		public void setImage(String image) {
			this.image = image;
		}
}
		 
