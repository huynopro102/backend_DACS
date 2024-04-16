
const onlinePaymentBtn = document.querySelector('.online-payment-btn');
const cashOnDeliveryBtn = document.querySelector('.cash-on-delivery-btn');

onlinePaymentBtn.addEventListener('click', function() {
    cashOnDeliveryBtn.classList.remove('active');
    onlinePaymentBtn.classList.add('active');
});

cashOnDeliveryBtn.addEventListener('click', function() {
    onlinePaymentBtn.classList.remove('active');
    cashOnDeliveryBtn.classList.add('active');
});