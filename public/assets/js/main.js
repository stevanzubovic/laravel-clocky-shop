window.onload = function () {

    var categories = [];
    var discounts = [];



    if(location.pathname == '/') {
        $('.category').change(getProducts);
        $('#sort').change(getProducts);
        $('#search').blur(getProducts);
    }

    if(location.pathname == '/admin') {

        sendAjaxRequest('/products', 'POST', '', productsAdminDisplay, empty);
        $('#products').click(function () {sendAjaxRequest('/products', 'POST', '', productsAdminDisplay)});
        $('#close').click(function () {
            $('.popup').css('display', 'none ');
        })
        $('#categories').click(function () {
             sendAjaxRequest('/getCategories','POST', '', categoriesAdminDisplay, empty)
        });
        $('#discounts').click(function () {
            sendAjaxRequest('/getDiscounts', 'POST', '', discountsAdminDisplay, empty)
        });
        $('#users').click(function () {
            sendAjaxRequest('/getUsers', 'POST','', userAdminDisplay, empty)
        });
        $('#display-msg').click(function () {
            $(this).css('display', 'none');
        })

    }

    if(location.pathname == '/cart') {

        if ((getFromLocalStorage('cart') == null) || getFromLocalStorage('cart').length == 0)
        {
            showEmptyCart()
        } else
        {
            let productIds = [];
            let products = getFromLocalStorage('cart');
            products.forEach(p => {
                productIds.push(p.id)
            })
            let data = {
                'ids':productIds
            }
            sendAjaxRequest('getProductsByIds','POST', data, populateCart, empty);
        }
    }

    $('#add-to-cart').click(addProductToCart);
    $('#add-to-cart').click(function() {
        $('.cart-info').css('display', 'block');
    });
    $('.close').click(function(){
        $('.cart-info').css('display', 'none');
    });

    $('#submit-contact-form').click(function() {

        let contact = {
             'message':$('#message').val(),
             'email':$('#contact-form-email').val()
        }
        sendAjaxRequest('/contact', 'POST', contact, displayContactFormMessage);
    });
}

function displayContactFormMessage(message) {
    let messageDiv = $('#contact-form-message')
    messageDiv.html(message.message);
    messageDiv.css('display', 'block');
    setTimeout(() => {messageDiv.css('display', 'none')}, 5000)
}

function showEmptyCart() {
    let result = `
    <div id="cart-error" class="row justify-content-center text-center">
        <p class="">No products currently in cart</p>
    </div>`;
    $('#cart-container').html(result);
    $('#checkout').css('display', 'none');
}

function addProductToCart() {
    let productId = $(this).data('id');
    var numberOfProducts = $('#number-of-products').val();
    var productsInCart = getFromLocalStorage('cart');

    if (productsInCart)
    {
        if (productAlreadyInCart(productId))
        {
            incrementProductInCart()
        } else
        {
            addProductToCartFirstTime()
        }
    } else
    {

        firstProductToCart();
    }

    function firstProductToCart() {
        let data = [];
        data[0] = {
            id: productId,
            quantity: numberOfProducts
        }
        setToLocalStorage(data, 'cart')
    }

    function incrementProductInCart() {

        for (let product of productsInCart)
        {
            if (product.id == productId)
            {
                product.quantity =  parseInt(product.quantity) + parseInt(numberOfProducts);
                break
            }
        }
        setToLocalStorage(productsInCart, 'cart');
    }

    function addProductToCartFirstTime() {

        let data = {
            id: productId,
            quantity: parseInt(numberOfProducts)
        }
        productsInCart.push(data);
        setToLocalStorage(productsInCart, 'cart');
    }

    function productAlreadyInCart(id) {
        return productsInCart.filter(x => x.id == productId).length
    }
}

function populateCart(data) {

    let productsInStorage = getFromLocalStorage('cart');
    data.forEach(element => {
        for(let product of productsInStorage) {
            if(element.id == product.id) {
                element.quantity = product.quantity;
            }
        }
    });
    let result = ` <table class="table">
    <thead>
        <tr>
<!--            <th>Image</th>-->
            <th>Product name</th>
            <th>Quantity</th>
            <th>Total</th>
            <th>Discount</th>
            <th>Delete</th>
        </tr>
    </thead>
    <tbody>`;

    data.forEach(product => {
        result += `
        <tr>
<!--        <td><img src="http://127.0.0.1:8000/assets/images/${product.image.url}" alt="${product.image.alt}" class="thumb-image"></td>-->
        <td>${product.name}</td>
        <td>${product.quantity}</td>
        <td class="text-nowrap">${product.discount ? (product.price.amount - ((product.price.amount / 100) * product.discount.percent))*product.quantity : (product.price.amount)*product.quantity} &euro;</td>
        <td>${product.discount ? product.discount.name + ' - ' + product.discount.percent + '%' : '/'}</td>
        <td><input type="button" data-id="${product.id}"class="btn btn-danger remove-from-cart tm-btn-right" value="Remove"/>
        </td>`;
    });
    $('.cart-products').html(result);
    $('.remove-from-cart').click(removeFromLocalStorage);
    $('.remove-from-cart').click(updateCart);
    $('#checkout').click(function () {
        let products = getFromLocalStorage('cart');
        sendAjaxRequest('receipt', 'POST', {'data':products}, cartMessage);
        localStorage.clear();
    })
}

function cartMessage(message) {
   // console.log(message);
    let result = `
    <div id="cart-error" class="row justify-content-center text-center">
        <p class="">${message.message}</p>
    </div>`;
    $('#cart-container').html(result);
    $('#checkout').css('display', 'none');
}


function updateCart() {
    $(this).parent().parent().remove();
    if(getFromLocalStorage('cart').length == 0) {
        showEmptyCart()
    }
}

function removeFromLocalStorage() {
    let products = getFromLocalStorage('cart');
    let filtered = products.filter(p => $(this).data('id') != p.id);
    setToLocalStorage(filtered, 'cart');
}

function setToLocalStorage(data, id) {
    localStorage.setItem(id, JSON.stringify(data));
}

function getFromLocalStorage(id) {
    return JSON.parse(localStorage.getItem(id))
}


function sendAjaxRequest(url, method, data, success, failure = empty) {
    $.ajaxSetup({
        headers:{
            'X-CSRF-TOKEN':$("input[name='_token']").attr('value')
        }
    });

    $.ajax({
        url:url,
        data:data,
        dataType:'JSON',
        method:method,
        success:function(response) {
            success(response);
        },
        error:function(xhr) {
            failure(xhr);
        }
    })
}

function empty(response) {

}

function getProducts() {
    let categories = $('.category:checked');
    let sortType = $('#sort').val();
    let searchTerm = $('#search').val();
    let categoryIds = [];

    for (const category of categories) {
        categoryIds.push(category.value)
    }
    let data = {
        'searchTerm':searchTerm,
        'categoryIds':categoryIds,
        'sortType':sortType
    }
    sendAjaxRequest('/products', 'POST', data, productsFill, empty);
}

function productsFill(response) {
     //console.log(response);
    //let products = JSON.parse(response);
    let result =  `<div class="row">`;
    console.log(response);
    response.forEach(product => {
        result += `
                    <div class="col-xl-3 col-lg-4 col-md-6 mb-4">
                        <div class="bg-white rounded shadow-sm">
                            <img src="${'../../assets/images/'+product.image.url}" alt="${'../../public/assets/images/'+product.image.alt}" class="img-fluid card-img-top">
                            <div class="p-4">
                                <h6 class="product-card"> <a href="/product/${product.id}" class="">${product.name}</a></h6>
                                <div class="row">
                                ${printPrice(product.amount, product.discount)}
                                </div>
                            </div>
                        </div>
                    </div>`
    });
    result += `<div>`;
    $('#products').html(result);
}

function printPrice(price, discount) {
    if(discount) {
        return `
            <div class="col-6">
                <s class="price text-nowrap">${price} &euro;</s>
            </div>
            <div class="col-6">
                <p class="price text-nowrap">${price - ((price / 100) * discount.percent)} &euro;</p>\
            </div>`

    } else {
        return `<p class="price text-nowrap">${price} &euro;</p>`
    }
}

function productsAdminDisplay(response) {
    let result = ` <table class="table">
    <thead>
        <tr>
            <th>Product Id</th>
            <th>Product name</th>
            <th>Price</th>
            <th>Discount</th>
            <th>Category</th>
            <th>Delete</th>
            <th>Edit</th>
        </tr>
    </thead>
    <tbody>`;

    response.forEach(product => {
        result += `
        <tr>
        <td>${product.id}</td>
        <td>${product.name}</td>
        <td class="text-nowrap">${product.discount ? (product.amount - ((product.amount / 100) * product.discount.percent)) : (product.amount)} &euro;</td>
        <td class="text-nowrap">${product.discount ? product.discount.name : '/'}</td>
        <td>${product.category.name}</td>
        <td><input type="button" data-id="${product.id}"class="btn btn-danger delete-product tm-btn-right" value="Delete"/>
        <td><input type="button" data-id="${product.id}"class="btn btn-primary edit-product tm-btn-right" value="Edit"/>
        </td>`;
    })
    //${price - ((price / 100) * discount.percent)} &euro;
    $('#admin-display').html(result);
    $('#insert-new').html(`<button id="insert-new" class="btn btn-success top-gap">New product</button>`);
    $('.delete-product').click(function() {
        let id = $(this).data('id');
        let data = {
            'id':id
        }

        sendAjaxRequest('/deleteProduct', 'DELETE', data, refreshAdminProducts, empty);
    });

    $('#insert-new').click(function() {
        let formHtml = ` <input type="text" id="product-name" class="form-control" placeholder="Enter new name...">
        <div class="form-group">
            <label for="product-category">Select a category</label>
            <select name="product-category" id="product-category" class="form-control"></select>
        </div>
        <div class="form-group">
        <label for="product-price">Select price</label>
        <select name="product-price" id="product-price" class="form-control"></select>
        </div>
        <div class="form-group">
        <label for="product-discount">Select discount</label>
        <select name="product-discount" id="product-discount" class="form-control"></select>
        </div>
        <textarea name="description" id="product-description" cols="30" rows="10" class="form-control" placeholder="New description..."></textarea>
                <button class="btn btn-success" id="new-product">Submit</button>`;

        $('#input-form').html(formHtml);
        $('#product-category').html($('#categories-hidden').html());
        $('#product-price').html($('#prices-hidden').html());
        $('#product-discount').html($('#discounts-hidden').html());
        $('.popup').css('display', 'block');
        $('#new-product').click(function() {
            let productName = $('#product-name').val();
            let category = $('#product-category').val();
            let price = $('#product-price').val();
            let discount = $('#product-discount').val();
            let description = $('#product-description').val();
            console.log(productName);
            let data = {
                'name':productName,
                'category':category,
                'price':price,
                'discount':discount,
                'description':description
            }
            sendAjaxRequest('/createProduct', 'POST', data, refreshPage, empty);
        });
    });

    $('.edit-product').click(function() {
        let id = $(this).attr('data-id');
        let product = response.filter(x => x.id == id);
        console.log(product);
        let formHtml = ` <input type="text" id="product-name" class="form-control" value="${product[0].name}">
        <div class="form-group">
            <label for="product-category">Select a category</label>
            <select name="product-category" id="product-category" class="form-control"></select>
        </div>
        <div class="form-group">
        <label for="product-price">Select price</label>
        <select name="product-price" id="product-price" class="form-control"></select>
        </div>
        <div class="form-group">
        <label for="product-discount">Select discount</label>
        <select name="product-discount" id="product-discount" class="form-control"></select>
        </div>
        <div class="form-group">
        <label for="product-description">Description</label>
        <textarea name="description" id="product-description" cols="30" rows="10" class="form-control"> ${product[0].description}</textarea>
        </div>
                <button class="btn btn-success" data-id="${product[0].id}" id="edit-product">Submit</button>`;

        $('#input-form').html(formHtml);
        $('#product-category').html($('#categories-hidden').html());
        $('#product-price').html($('#prices-hidden').html());
        $('#product-discount').html($('#discounts-hidden').html());
        $('.popup').css('display', 'block');
        $('#edit-product').click(function() {
            let productName = $('#product-name').val();
            let category = $('#product-category').val();
            let price = $('#product-price').val();
            let discount = $('#product-discount').val();
            let description = $('#product-description').val();
            console.log(productName);
            let data = {
                'id':$(this).attr('data-id'),
                'name':productName,
                'category':category,
                'price':price,
                'discount':discount,
                'description':description
            }
            sendAjaxRequest('/editProduct', 'POST', data, refreshPage, displayAdminMessage);
        });
        $('.popup').css('display', 'block');
    });
}

function refreshPage() {
    location.reload();
}

function  categoriesAdminDisplay(data) {
    let result = ` <table class="table">
    <thead>
        <tr>
            <th>Category Id</th>
            <th>Category name</th>
            <th>Created </th>
            <th>Updated</th>
            <th>Delete</th>
            <th>Edit</th>
        </tr>
    </thead>
    <tbody>`;

    data.forEach(category => {
        result += `
        <tr>
        <td>${category.id}</td>
        <td>${(category.name)}</td>
        <td>${category.created_at}</td>
        <td>${category.updated_at ? category.updated_at : '/'}</td>
        <td><input type="button" data-id="${category.id}"class="btn btn-danger delete-category" value="Delete"/>
        <td><input type="button" data-id="${category.id}"class="btn btn-primary edit-category" value="Edit"/>
        </td>`;
    });

    $('#admin-display').html(result);
    $('#insert-new').html(`<button id="insert-new" class="btn btn-success top-gap">New category</button>`);
    $('#insert-new').click(function() {
        let formHTML = `
        <div class="form-group">
            <label for="category-name">Category name</label>
            <input type="text" class="form-control" id="category-name">
        </div>
        <button class="btn btn-success" id="new-category">Submit</button>`;
        $('#input-form').html(formHTML);
        $('.popup').css('display', 'block');
        $('#new-category').click(function() {
            //let id = $('#category-name').val();
            let data = {
                'name':$('#category-name').val()
            }
           sendAjaxRequest('/createCategory', 'POST', data, refreshPage, displayAdminMessage);
        });
    });
    $('.delete-category').click(function() {
        let id = $(this).data('id');
        let data = {
            'id':id
        }
        sendAjaxRequest('/deleteCategory', 'DELETE',  data, refreshAdminCategories, displayAdminMessage);
    });
    $('.edit-category').click(function() {
        let id = $(this).attr('data-id');
        let category = data.filter(x => x.id == id);
        let formHtml = `
            <div class="form-group">
                <label for="category-name">Category name</label>
                <input type="text" id="category-name" class="form-control" value="${category[0].name}">
            </div>
           <button class="btn btn-success" data-id="${category[0].id}" id="edit-category">Submit</button>`;
        $('#input-form').html(formHtml);
        $('.popup').css('display', 'block');
        $('#edit-category').click(function() {
            let catData = {
                'id':category[0].id,
                'name':$('#category-name').val()
            }
            sendAjaxRequest('/editCategory', 'POST', catData, refreshPage, displayAdminMessage);
        })

    });
}

function displayAdminMessage(text) {
   // console.log(text.responseJSON);
    $('.popup').css('display', 'none');
    let div = $('#display-msg');
    div.html(text.responseJSON.message);
    div.css('display', 'block');

}

function discountsAdminDisplay(data) {
    let result = ` <table class="table">
    <thead>
        <tr>
            <th>Discount Id</th>
            <th>Discount name</th>
            <th>Percent</th>
            <th>Created </th>
            <th>Updated</th>
            <th>Delete</th>
            <th>Edit</th>
        </tr>
    </thead>
    <tbody>`;

    data.forEach(discount => {
        result += `
        <tr>
        <td>${discount.id}</td>
        <td>${(discount.name)}</td>
        <td>${discount.percent}%</td>
        <td>${discount.created_at}</td>
        <td>${discount.updated_at ? discount.updated_at : '/'}</td>
        <td><input type="button" data-id="${discount.id}"class="btn btn-danger delete-discount" value="Delete"/>
        <td><input type="button" data-id="${discount.id}"class="btn btn-primary edit-discount" value="Edit"/>
        </td>`;
    });

    $('#admin-display').html(result);
    $('#insert-new').html(`<button id="insert-new" class="btn btn-success top-gap">New discount</button>`);
    $('.delete-discount').click(function() {
        let id = $(this).data('id');
        let data = {
            'id':id
        }
        sendAjaxRequest('/deleteDiscount', 'DELETE',  data, refreshAdminDiscounts, displayAdminMessage);
    });
    $('#insert-new').click(function() {
        let formHtml = `
            <div class="form-group">
                <label for="discount-name">Discount name</label>
                <input type="text" id="discount-name" class="form-control" placeholder="Enter new name...">
            </div>
            <div class="form-group">
                <label for="discount-percent">Discount percent</label>
                <input type="text" id="discount-percent" class="form-control" placeholder="Enter a percentage...">
            </div>
           <button class="btn btn-success" id="new-discount">Submit</button>`;
        $('#input-form').html(formHtml);
        $('#new-discount').click(function() {
           let data = {
               'name':$('#discount-name').val(),
               'percent':$('#discount-percent').val()
           }
           sendAjaxRequest('/createDiscount', 'POST', data, refreshPage, displayAdminMessage);
        });
    });
    $('.edit-discount').click(function() {
        let id = $(this).attr('data-id');
        let discount = data.filter(x => x.id == id);
        let formHtml = `
            <div class="form-group">
                <label for="discount-name">Discount name</label>
                <input type="text" id="discount-name" class="form-control" value="${discount[0].name}">
            </div>
            <div class="form-group">
                <label for="discount-percent">Discount percent</label>
                <input type="text" id="discount-percent" class="form-control" value="${discount[0].percent}">
            </div>
           <button class="btn btn-success" data-id="${discount[0].id}" id="edit-discount">Submit</button>`;
        $('#input-form').html(formHtml);
        $('.popup').css('display', 'block');
        $('#edit-discount').click(function() {
           let discountData = {
               'id':$('#edit-discount').attr('data-id'),
               'name':$('#discount-name').val(),
               'percent':$('#discount-percent').val()
           }
           sendAjaxRequest('/editDiscount', 'POST', discountData, refreshPage, displayAdminMessage);
        });
    });
}

function userAdminDisplay(data) {
    $('#insert-new').html(``);
    let result = ` <table class="table">
    <thead>
        <tr>
            <th>User Id</th>
            <th>User name</th>
            <th>Email</th>
            <th>Registered </th>
            <th>Delete</th>
        </tr>
    </thead>
    <tbody>`;

    data.forEach(user => {
        result += `
        <tr>
        <td>${user.id}</td>
        <td>${user.user_name}</td>
        <td>${user.email}</td>
        <td>${user.created_at}</td>
        <td><input type="button" data-id="${user.id}"class="btn btn-danger delete-user" value="Delete"/>
        </td>`;
    });

    $('#admin-display').html(result);
    $('.delete-user').click(function() {
        let id = $(this).attr('data-id');
        let userId = {
            'id':id
        }
        sendAjaxRequest('deleteUser', 'DELETE', userId, refreshAdminUsers)
    });
}

function refreshAdminProducts() {
    sendAjaxRequest('/products', 'POST',  '', productsAdminDisplay);
}

function refreshAdminCategories() {
    sendAjaxRequest('/getCategories', 'POST', '', categoriesAdminDisplay);
}

function refreshAdminDiscounts() {
    sendAjaxRequest('/getDiscounts', 'POST', '', discountsAdminDisplay);
}

function refreshAdminUsers() {
    sendAjaxRequest('/getUsers', 'POST', '', userAdminDisplay);
}

