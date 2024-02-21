const price = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const taxRate = 0.10;
    const taxAmount = inputValue * taxRate;
    const taxAmount_integer = Math.floor(taxAmount);
    const saleProfit = inputValue - taxAmount_integer;

  const addTaxDom = document.getElementById("add-tax-price");
  const saleProfitDom = document.getElementById("profit");

  addTaxDom.innerHTML = taxAmount_integer;
  saleProfitDom.innerHTML = saleProfit;
  });
};

window.addEventListener('turbo:load',price);
window.addEventListener('turbo:render',price);