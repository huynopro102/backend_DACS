function changeNumberCart() {
    const gioHang = JSON.parse(localStorage.getItem("giohang")) || [];
    let totalQuantity = 0;
    gioHang.forEach(item => {
        totalQuantity += item.soluong;
    });
    document.querySelector(".cart_view").textContent = totalQuantity
}

changeNumberCart()