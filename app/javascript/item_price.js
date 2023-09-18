window.addEventListener('load', () => {

  // 金額を入力した数値をpriceInputという変数に格納する
  const priceInput = document.getElementById("item-price");
  
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    const taxValue = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = taxValue
    const addProfit = document.getElementById("profit");
    const profitValue = Math.floor(inputValue - taxValue);
    addProfit.innerHTML = profitValue
  })

});
