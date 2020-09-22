function price(){
   const priceInput = document.getElementById("item-price");
   const add_tax = document.getElementById("add-tax-price");
   const profit = document.getElementById("profit");
     priceInput.addEventListener('keyup', () => {
         const value = priceInput.value; 
         
       if (value >= 300 && value <= 9,999,999){
         let fee = value * 0.1
         let gains = value - fee
         add_tax.textContent = Math.floor(fee).toLocaleString();
         profit.textContent = Math.floor(gains).toLocaleString();
     } else {
       let fee = '0';
       let gains = '0';
       add_tax.textContent = fee;
       profit.textContent = gains;
     }
   });
  
  }
  window.addEventListener('load', price);
  