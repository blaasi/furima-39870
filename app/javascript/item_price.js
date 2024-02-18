window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const taxRate = 0.10;
    const taxAmount = inputValue * taxRate;
    const saleProfit = inputValue - taxAmount;

  const addTaxDom = document.getElementById("add-tax-price");
  const saleProfitDom = document.getElementById("profit");

  addTaxDom.innerHTML = Math.floor(taxAmount)
  saleProfitDom.innerHTML = Math.floor(saleProfit)
  });
});