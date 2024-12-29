const price = () => {
  window.addEventListener('load', () => {
    const priceInput = document.getElementById("item-price");
    priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const ProfitDom = document.getElementById("profit");
    addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1);
    ProfitDom.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1));
    });
  });
};

window.addEventListener('turbo:load', price);
window.addEventListener('turbo:render', price);